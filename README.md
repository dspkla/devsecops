# Enterprise DevSecOps Pipeline & Shift-Left Governance Suite

Reusable GitHub Actions workflow templates and policy-as-code definitions designed for enterprise compliance (**SOC2 Type II, ISO 27001, SLSA Level 3**).

## 🛡️ Integrated Security Gates

| Security Layer | Engine | Enforcement Objective |
| :--- | :--- | :--- |
| **Secret Detection** | TruffleHog | Eliminates high-entropy API tokens, SSH keys, and cloud credentials before merge. |
| **SAST** | Semgrep OSS | Detects OWASP Top 10 vulnerabilities, injection flaws, and unsafe deserialization. |
| **SCA & SBOM** | Aqua Trivy | Scans third-party dependencies and produces standard CycloneDX/SPDX software bill of materials. |
| **Policy as Code** | Kyverno / OPA | Disallows root containers, privilege escalation, and unsigned container images. |

## 📦 How to Call This Workflow in Any Repository

```yaml
jobs:
  security-gate:
    uses: dspkla/enterprise-devsecops-pipeline/.github/workflows/devsecops-gate.yml@main
```
