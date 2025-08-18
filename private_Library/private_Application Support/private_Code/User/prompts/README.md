# GitHub Copilot Security Agents

This directory contains specialized GitHub Copilot chat modes for security testing and analysis.

## Available Security Agents

### 1. **penetration-tester.chatmode.md**
**Description**: Ethical Hacking & Security Assessment
- Comprehensive web application security testing
- Infrastructure and network security assessment
- OWASP Top 10 vulnerability testing
- Professional penetration testing methodology
- CI/CD security integration

**Use Cases**:
- Security assessments and audits
- Vulnerability testing and validation
- Infrastructure security review
- Compliance testing (OWASP, NIST)

### 2. **web-app-penetration-tester.chatmode.md**
**Description**: Web App Exploitation & Bug Bounty
- Advanced web application exploitation techniques
- Bug bounty methodology and reporting
- Proof-of-concept exploit development
- Modern web technology security testing
- Vulnerability chaining and impact demonstration

**Use Cases**:
- Bug bounty hunting and reporting
- Client penetration testing engagements
- Zero-day research and exploitation
- Red team web application assessment

### 3. **security-code-reviewer.chatmode.md**
**Description**: Secure Code Analysis & Review
- Static application security testing (SAST)
- Language-specific vulnerability detection
- Infrastructure as Code (IaC) security
- Secure development lifecycle integration
- Security architecture assessment

**Use Cases**:
- Pull request security reviews
- Code security audits
- Dependency vulnerability analysis
- Architecture security assessment

### 4. **security-testing.chatmode.md**
**Description**: Repository Security Configuration Checker
- Comprehensive repository security audits
- Secret detection and history analysis
- Dependency and supply chain security
- Container and image security (JFrog/Artifactory integration)
- Compliance and policy checks

**Use Cases**:
- Repository security scanning
- CI/CD pipeline security validation
- Compliance auditing
- Supply chain security assessment

## Usage in VS Code

### Activating Chat Modes
1. Open GitHub Copilot Chat (`Ctrl/Cmd + Shift + I`)
2. Type `@` to see available chat modes
3. Select the appropriate security agent
4. Describe your security testing or analysis requirements

### Example Usage

#### Penetration Testing
```
@penetration-tester
Perform a comprehensive security assessment of our e-commerce application including authentication, payment processing, and user data handling.
```

#### Web App Exploitation
```
@web-app-penetration-tester
Test this web application for exploitable vulnerabilities and create professional bug bounty reports for any findings.
```

#### Code Security Review
```
@security-code-reviewer
Review this pull request for security vulnerabilities and provide remediation guidance for any issues found.
```

#### Repository Security Audit
```
@security-testing
Conduct a comprehensive security audit of this repository including secret scanning, dependency analysis, and configuration review.
```

## Agent Capabilities

### Common Tools Available
All agents have access to:
- `codebase`: Full repository analysis
- `search`: Code pattern searching
- `runCommands`: Terminal command execution
- `editFiles`: Code modification capabilities
- `fetch`: External resource access
- `runTests`: Security test execution

### Security Tool Integration
- **Burp Suite**: Web application security testing
- **Nuclei**: Fast vulnerability scanner
- **Nmap**: Network discovery and auditing
- **Custom Tools**: proxyhawk, webscope, subscope
- **SAST Tools**: Semgrep, CodeQL, SonarQube
- **Container Security**: Docker image analysis

## Best Practices

### Security Testing Guidelines
1. **Authorization**: Only test systems with explicit permission
2. **Scope**: Stay within defined testing boundaries
3. **Documentation**: Maintain detailed testing logs
4. **Responsible Disclosure**: Report vulnerabilities appropriately

### Code Review Standards
1. **Comprehensive Analysis**: Review for all vulnerability categories
2. **Actionable Feedback**: Provide specific remediation guidance
3. **Risk Assessment**: Prioritize findings by business impact
4. **Learning Opportunity**: Educate developers on secure coding

### Agent Selection Guide
- **General Security Assessment** → `penetration-tester`
- **Web App Bug Bounty** → `web-app-penetration-tester`
- **Code/PR Review** → `security-code-reviewer`
- **Repository Audit** → `security-testing`

## Configuration Management

These chat modes are managed through chezmoi for consistency across development environments:

```bash
# Update prompts across machines
chezmoi apply

# View current configuration
chezmoi status
```

## Agent Updates and Customization

To modify or add new security agents:
1. Edit the `.chatmode.md` files in this directory
2. Follow the YAML frontmatter format for tool definitions
3. Update this README with new agent descriptions
4. Add to chezmoi for version control

## Support and Training

For questions about using these security agents:
- Review the individual agent documentation
- Check the example usage patterns
- Consult security team for specialized requirements
- Contribute improvements via pull requests

---

*Last Updated: 2025-08-18*
*Version: 1.0*