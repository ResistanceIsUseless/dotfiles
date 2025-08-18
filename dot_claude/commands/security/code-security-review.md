---
name: code-security-review
description: Execute comprehensive security code review with static analysis and vulnerability detection
---

Perform comprehensive security code review using the security-code-reviewer agent with static analysis tools and vulnerability detection. This command:

1. **Codebase Analysis**: Language detection, framework identification, and architecture review
2. **Static Security Analysis**: SAST scanning with multiple tools and custom rules
3. **Dependency Assessment**: Vulnerability scanning of third-party dependencies
4. **Configuration Review**: Security misconfiguration detection in configuration files
5. **Professional Reporting**: Detailed findings with remediation guidance

**Usage**: `/code-security-review [repository-path|git-url] [--languages js,python,java,go] [--scope full|incremental|pull-request]`

**Scope Options**:
- `full`: Complete codebase security review
- `incremental`: Review changes since last commit/tag
- `pull-request`: Review only changes in current PR

**Language Support**:
- **JavaScript/TypeScript**: ESLint security rules, client-side vulnerability detection
- **Python**: Bandit security linting, dependency vulnerability scanning
- **Java**: SpotBugs security rules, Spring framework security analysis
- **Go**: Gosec security checker, dependency vulnerability assessment
- **PHP**: PHPCS security rules, framework-specific vulnerability detection

**Analysis Categories**:
- **Injection Vulnerabilities**: SQL, NoSQL, LDAP, OS command injection patterns
- **Authentication & Authorization**: Session management, access control implementation
- **Cryptographic Issues**: Weak algorithms, improper key management, insecure random generation
- **Input Validation**: Buffer overflows, format string bugs, path traversal
- **Information Disclosure**: Hardcoded secrets, verbose error messages, debug information
- **Configuration Security**: Insecure defaults, missing security headers, weak configurations

**Process**:
1. Clone repository and analyze project structure
2. Detect programming languages and frameworks
3. Configure appropriate static analysis tools
4. Execute SAST scanning with security-focused rules
5. Analyze dependencies for known vulnerabilities
6. Review configuration files for security issues
7. Generate prioritized findings with remediation guidance

**Static Analysis Tools**:
- **Semgrep**: Cross-language static analysis with custom security rules
- **CodeQL**: Semantic code analysis for complex vulnerability patterns
- **Language-specific**: Bandit (Python), Gosec (Go), ESLint Security (JS)
- **Dependency scanners**: Safety (Python), npm audit (Node.js), go list (Go)

**Output**:
- Executive summary with security posture assessment
- Detailed vulnerability findings with code snippets
- Dependency vulnerability report with update recommendations
- Configuration security issues with fix examples
- Integration guidance for CI/CD security gates

**Integration**: Automatically triggered when source code exposure is detected during reconnaissance