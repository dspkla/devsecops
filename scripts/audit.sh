#!/usr/bin/env bash
set -euo pipefail

echo "============================================"
echo "    Enterprise DevSecOps Audit Scanner      "
echo "============================================"

echo "[1/3] Running Secret Detection..."
if command -v trufflehog &> /dev/null; then
    trufflehog git file://. --since-commit HEAD~1
else
    echo "TruffleHog CLI not found locally, deferred to CI gate."
fi

echo "[2/3] Running SAST Code Analysis..."
if command -v semgrep &> /dev/null; then
    semgrep --config=rules/semgrep-rules.yaml .
else
    echo "Semgrep CLI not found locally, deferred to CI gate."
fi

echo "[3/3] Checking Infrastructure Misconfigurations..."
if command -v checkov &> /dev/null; then
    checkov -d . --framework terraform
else
    echo "Checkov not found locally, deferred to CI gate."
fi

echo "Pre-commit security audit completed successfully."
