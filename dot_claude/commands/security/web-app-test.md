---
name: web-app-test
description: Execute comprehensive web application security testing with automated exploitation and reporting
---

Perform comprehensive web application security testing using the web-app-penetration-tester agent with automated exploitation techniques. This command:

1. **Application Profiling**: Technology stack identification and attack surface mapping
2. **Automated Vulnerability Discovery**: OWASP Top 10 and custom vulnerability testing
3. **Exploitation Development**: Working proof-of-concept creation for found vulnerabilities
4. **Business Logic Testing**: Workflow analysis and logic flaw identification
5. **Professional Reporting**: Bug bounty quality reports with exploitation guidance

**Usage**: `/web-app-test target-url [--scope wide|focused|api] [--intensity normal|aggressive] [--output bug-bounty|pentest|internal]`

**Scope Options**:
- `wide`: Full application testing including all discovered endpoints
- `focused`: Targeted testing on high-value components (default)
- `api`: API-focused testing with GraphQL and REST analysis

**Intensity Levels**:
- `normal`: Standard testing with manual verification points
- `aggressive`: Comprehensive automated testing with all techniques

**Output Formats**:
- `bug-bounty`: Professional bug bounty report format
- `pentest`: Client penetration testing report
- `internal`: Internal security team format

**Testing Categories**:
- **Authentication & Session Management**: Login bypass, session fixation, JWT manipulation
- **Input Validation**: SQL injection, XSS, command injection, file upload vulnerabilities
- **Authorization**: IDOR, privilege escalation, access control bypass
- **Business Logic**: Race conditions, workflow bypass, price manipulation
- **API Security**: GraphQL introspection, REST API abuse, rate limiting bypass

**Process**:
1. Perform application reconnaissance and technology fingerprinting
2. Execute automated vulnerability discovery with custom payloads
3. Develop working proof-of-concept exploits for findings
4. Analyze business logic and workflow vulnerabilities
5. Test API endpoints for security misconfigurations
6. Chain vulnerabilities for maximum impact demonstration
7. Generate professional security assessment report

**Output**:
- Executive summary with business risk assessment
- Detailed vulnerability findings with working exploits
- Step-by-step reproduction instructions
- Business impact analysis for each finding
- Remediation guidance with implementation examples

**Integration**: Can be invoked automatically by auto-recon based on findings