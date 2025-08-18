# Claude Commands Reference - Security Assessment Suite

This document provides a comprehensive reference for all available Claude commands in your security assessment suite.

## Command Categories

### 🔍 Reconnaissance Commands (`/recon/`)

#### `/quick-recon target.com`
**Purpose**: Execute quick reconnaissance on a target domain using passive techniques
- **Duration**: ~10-15 minutes
- **Stealth Level**: High (passive only)
- **Tools**: subscope, webscope, nuclei, proxychains
- **Output**: Subdomain list, live hosts, initial vulnerabilities, testing recommendations

#### `/deep-recon target.com [--stealth|--aggressive|--comprehensive]`
**Purpose**: Execute comprehensive deep reconnaissance with aggressive techniques
- **Duration**: 1-3 hours
- **Stealth Level**: Configurable
- **Tools**: subscope, webscope, nuclei, feroxbuster, nmap, amass
- **Output**: Complete asset inventory, detailed vulnerability analysis, technology stacks

#### `/auto-recon target.com [--continuous|--one-shot|--monitoring]`
**Purpose**: Launch automated reconnaissance orchestrator with intelligent agent handoff
- **Duration**: 2-6 hours
- **Automation Level**: Fully automated
- **Agent Coordination**: Intelligent parallel execution
- **Output**: Master assessment report with business impact analysis

### 🛡️ Security Testing Commands (`/security/`)

#### `/vulnerability-scan [target-file|single-target] [options]`
**Purpose**: Execute comprehensive vulnerability scanning with nuclei templates
- **Options**: `--severity`, `--categories`, `--rate-limit`, `--proxy`
- **Templates**: exposures, cves, misconfigurations, takeovers, technologies
- **Output**: Prioritized findings with exploitation guidance

#### `/web-app-test target-url [--scope wide|focused|api] [--intensity normal|aggressive]`
**Purpose**: Comprehensive web application security testing with automated exploitation
- **Scope**: Full application, focused components, or API-specific testing
- **Testing**: OWASP Top 10, business logic, authentication, authorization
- **Output**: Professional bug bounty or penetration testing reports

#### `/code-security-review [repository-path|git-url] [options]`
**Purpose**: Comprehensive security code review with static analysis
- **Languages**: JavaScript, Python, Java, Go, PHP
- **Analysis**: SAST scanning, dependency vulnerabilities, configuration issues
- **Output**: Detailed findings with remediation guidance and CI/CD integration

#### `/generate-report assessment-data [--format] [--audience] [--compliance]`
**Purpose**: Generate comprehensive security assessment reports
- **Formats**: executive, technical, bug-bounty, compliance
- **Audiences**: client, internal, bug-bounty platform
- **Compliance**: OWASP, NIST, PCI DSS, ISO 27001

#### `/finding-analysis findings-data [options]`
**Purpose**: Analyze security findings for correlation and impact assessment
- **Analysis**: Correlation, exploitation chains, false positive validation
- **Output**: Risk-prioritized findings, attack path visualization, business impact

### 🤖 Agent Coordination Commands (`/agents/`)

#### `/agent-handoff [findings-file|assessment-directory] [options]`
**Purpose**: Execute intelligent agent handoff based on findings
- **Logic**: Vulnerability-based delegation to specialized agents
- **Agents**: web-app-penetration-tester, penetration-tester, security-code-reviewer
- **Output**: Consolidated handoff summary with cross-agent correlation

#### `/multi-agent-coordination target-scope [options]`
**Purpose**: Coordinate multiple security agents for comprehensive parallel assessment
- **Strategies**: comprehensive, focused, rapid
- **Management**: Resource allocation, conflict prevention, progress monitoring
- **Output**: Multi-agent execution plan with efficiency metrics

### 🕵️ OPSEC Commands (`/opsec/`)

#### `/setup-proxy-chain [--layers tor,ssh,vpn] [options]`
**Purpose**: Configure advanced proxy chains for operational security
- **Layers**: Tor circuits, SSH tunnels, VPN rotation
- **Features**: Health monitoring, automatic rotation, traffic distribution
- **Output**: Proxy configuration summary with performance metrics

#### `/stealth-mode [--intensity maximum|high|moderate] [options]`
**Purpose**: Configure maximum stealth operational parameters
- **Features**: Traffic obfuscation, fingerprint randomization, rate limiting
- **Targets**: General, CDN-focused, WAF evasion
- **Output**: Stealth configuration with detection monitoring

#### `/cdn-bypass target-domain [--methods all|passive|active]`
**Purpose**: Execute advanced CDN bypass techniques for direct origin access
- **Methods**: DNS history, certificate analysis, subdomain scanning
- **Verification**: Host header testing, response comparison, timing analysis
- **Output**: Origin IP addresses with bypass configuration

## Command Usage Patterns

### Basic Reconnaissance Workflow
```bash
# Quick assessment
/quick-recon target.com

# Deep dive if interesting findings
/deep-recon target.com --aggressive

# Full automation for comprehensive assessment
/auto-recon target.com --one-shot
```

### Stealth Operations Workflow
```bash
# Setup maximum stealth
/stealth-mode --intensity maximum --target-type cdn

# Configure proxy chains
/setup-proxy-chain --layers tor,ssh,vpn --rotation auto

# Execute stealth reconnaissance
/deep-recon target.com --stealth
```

### Automated Assessment Workflow
```bash
# Launch automated orchestrator
/auto-recon target.com --one-shot

# Manual agent handoff if needed
/agent-handoff assessment-results --agents auto --parallel true

# Generate professional report
/generate-report assessment-data --format technical --audience client
```

### Bug Bounty Workflow
```bash
# Initial reconnaissance
/quick-recon target.com

# Deep analysis of interesting targets
/deep-recon target.com --comprehensive

# Focused web application testing
/web-app-test high-value-targets --scope focused --intensity aggressive

# Generate bug bounty report
/generate-report findings --format bug-bounty --audience bug-bounty
```

### Penetration Testing Workflow
```bash
# Comprehensive automated assessment
/auto-recon target.com --one-shot

# Multi-agent coordination for full coverage
/multi-agent-coordination target-scope --strategy comprehensive

# Finding analysis and correlation
/finding-analysis all-findings --correlation auto --chains complex

# Client report generation
/generate-report consolidated-data --format technical --audience client
```

## Integration Points

### Agent Handoff Triggers
- **Web Vulnerabilities** → `/web-app-test` via web-app-penetration-tester
- **Infrastructure Issues** → penetration-tester (infrastructure-focused)
- **Source Code Exposure** → `/code-security-review` via security-code-reviewer
- **API Endpoints** → `/web-app-test --scope api` (API-focused)

### OPSEC Integration
All reconnaissance and testing commands automatically use:
- Configured proxy chains from `/setup-proxy-chain`
- Stealth parameters from `/stealth-mode`
- CDN bypass techniques from `/cdn-bypass`

### Reporting Integration
- All assessment commands generate data compatible with `/generate-report`
- Finding analysis via `/finding-analysis` enhances all report types
- Cross-command correlation maintains assessment continuity

## Command Customization

### Environment Variables
```bash
# Proxy configuration
export CLAUDE_PROXY_CONFIG="/path/to/proxy/config"
export CLAUDE_STEALTH_LEVEL="high"

# Tool paths
export NUCLEI_TEMPLATES="/custom/nuclei/templates"
export WORDLISTS_PATH="/custom/wordlists"

# Output preferences
export CLAUDE_OUTPUT_FORMAT="json"
export CLAUDE_REPORT_TEMPLATE="/custom/report/template"
```

### Configuration Files
```yaml
# ~/.claude/config/commands.yaml
reconnaissance:
  default_intensity: aggressive
  proxy_chains: enabled
  stealth_mode: auto

security_testing:
  nuclei_rate_limit: 50
  web_app_depth: 3
  code_review_languages: [js, python, java, go]

reporting:
  default_format: technical
  compliance_frameworks: [owasp, nist]
  executive_summary: enabled
```

## Performance Optimization

### Resource Management
- **Parallel Execution**: Automatic resource allocation across agents
- **Rate Limiting**: Intelligent request spacing to avoid detection
- **Memory Management**: Efficient handling of large assessment datasets
- **Storage Optimization**: Compressed result storage and archival

### Scalability Features
- **Distributed Assessment**: Multi-host coordination capabilities
- **Cloud Integration**: Support for cloud-based assessment infrastructure
- **API Integration**: REST APIs for external tool integration
- **Monitoring Integration**: SIEM and alerting system compatibility

## Security Considerations

### Legal and Ethical Usage
- **Authorization**: All commands require explicit testing authorization
- **Scope Compliance**: Automated scope validation and boundary enforcement
- **Activity Logging**: Comprehensive audit trails for all assessment activities
- **Responsible Disclosure**: Integrated vulnerability reporting workflows

### Operational Security
- **Proxy Validation**: Automatic proxy health checking and rotation
- **Detection Avoidance**: Advanced techniques to avoid WAF and CDN detection
- **Traffic Obfuscation**: Request pattern randomization and timing variation
- **Incident Response**: Automatic response to detection or blocking events

---

## Quick Reference

### Most Common Commands
- **Quick Assessment**: `/quick-recon target.com`
- **Comprehensive Assessment**: `/auto-recon target.com`
- **Web App Testing**: `/web-app-test target --intensity aggressive`
- **Generate Report**: `/generate-report data --format technical`

### Emergency Procedures
- **Detection Alert**: `/stealth-mode --intensity maximum`
- **Proxy Issues**: `/setup-proxy-chain --layers tor,ssh --health-check enabled`
- **Assessment Pause**: Stop all running agents and rotate infrastructure

### Support and Documentation
- **Command Help**: `/help command-name` for detailed usage
- **Agent Status**: `/agents status` for running agent information
- **System Health**: `/system health` for infrastructure status

This command suite provides comprehensive security assessment automation while maintaining operational security and professional reporting standards.