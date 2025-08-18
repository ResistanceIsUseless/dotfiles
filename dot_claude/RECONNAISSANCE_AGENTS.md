# Reconnaissance Agent Suite - Documentation

This document describes the comprehensive reconnaissance agent suite designed for bug bounty hunting, penetration testing, and security assessments with advanced operational security capabilities.

## Agent Overview

### 1. **passive-recon-agent** (Normal Intensity)
**Purpose**: Comprehensive passive reconnaissance with normal scanning intensity
**Best For**: Initial target assessment, stealth operations, client assessments

**Key Features**:
- Multi-source subdomain enumeration using subscope
- Comprehensive host discovery with webscope
- Initial vulnerability assessment with nuclei
- Advanced proxy chains for OPSEC
- Cloudflare/Akamai evasion techniques
- Professional reporting with manual testing recommendations

**Use Cases**:
- Bug bounty reconnaissance phase
- Client security assessment preparation
- Red team engagement intelligence gathering
- Stealth mode operations for sensitive targets

### 2. **aggressive-recon-agent** (High Intensity)
**Purpose**: Comprehensive aggressive reconnaissance with enhanced scanning techniques
**Best For**: Thorough assessments, time-constrained engagements, broad scope testing

**Key Features**:
- Enhanced multi-source asset discovery
- Aggressive port scanning and service fingerprinting
- Intensive vulnerability discovery with all nuclei templates
- Advanced CDN bypass and origin IP discovery
- Multi-tier proxy rotation with health monitoring
- Comprehensive content discovery with multiple wordlists
- Deep JavaScript analysis for sensitive data

**Use Cases**:
- Comprehensive bug bounty assessments
- Red team engagements with time constraints
- Security assessments requiring maximum coverage
- Client penetration testing with broad scope

### 3. **automated-recon-orchestrator** (Intelligent Automation)
**Purpose**: Fully automated reconnaissance with intelligent agent handoff
**Best For**: Autonomous operations, continuous monitoring, comprehensive assessments

**Key Features**:
- Complete automated reconnaissance pipeline
- Intelligent vulnerability analysis and classification
- Strategic agent handoff based on findings
- Parallel agent execution and coordination
- Results aggregation from multiple specialized agents
- Business impact assessment and risk calculation
- Continuous monitoring recommendations

**Use Cases**:
- Fully automated security assessments
- Continuous security monitoring pipelines
- Large-scale bug bounty operations
- Autonomous red team assessments

## Tool Integration

### Core Tools
- **subscope**: Advanced subdomain discovery with multiple data sources
- **webscope**: Automated web service discovery and analysis
- **nuclei**: Template-based vulnerability scanning
- **feroxbuster**: Directory and content enumeration
- **nmap**: Network discovery and port scanning
- **Burp Suite MCP**: Advanced web application analysis (when available)

### Custom Security Tools
- **proxyhawk**: HTTP proxy traffic analysis
- **jsluice**: JavaScript analysis for sensitive data discovery
- **amass**: OSINT-based attack surface mapping
- **puredns**: DNS brute forcing and validation

### OPSEC Tools
- **Tor**: Multiple circuit anonymization
- **SSH tunnels**: Additional anonymity layers
- **ProxyChains**: Traffic routing and distribution
- **User agent rotation**: Fingerprint randomization

## Operational Security Features

### Advanced Proxy Infrastructure
- **Multi-tier proxy chains**: Tor + SSH tunnels + VPN rotation
- **Dynamic proxy rotation**: Health checking and automatic failover
- **Traffic distribution**: Load balancing across multiple exit points
- **Anti-detection measures**: Request timing and pattern randomization

### CDN and WAF Evasion
- **Cloudflare bypass**: Origin IP discovery and direct access
- **Akamai evasion**: Advanced request obfuscation techniques
- **User agent randomization**: Browser fingerprint variation
- **Header manipulation**: Request profile obfuscation

### Rate Limiting and Stealth
- **Adaptive rate limiting**: Detection-based delay adjustment
- **Request spacing**: Intelligent timing to avoid pattern detection
- **Error response handling**: Automatic proxy rotation on detection
- **Traffic profiling**: Legitimate-looking request patterns

## Agent Handoff System

The **automated-recon-orchestrator** includes an intelligent agent handoff system that automatically delegates specialized testing based on findings:

### Handoff Logic
1. **Web Application Vulnerabilities** → **web-app-penetration-tester**
   - SQL injection, XSS, authentication bypass findings
   - Business logic vulnerability indicators
   - API security issues

2. **Infrastructure Vulnerabilities** → **penetration-tester**
   - Open ports and services
   - Network misconfigurations
   - Service-specific vulnerabilities

3. **Source Code Exposure** → **security-code-reviewer**
   - Git repositories, configuration files
   - JavaScript secret analysis
   - Dependency vulnerabilities

4. **API Endpoints** → **web-app-penetration-tester** (API-focused)
   - GraphQL introspection opportunities
   - REST API misconfigurations
   - Swagger/OpenAPI documentation

### Parallel Execution
The orchestrator coordinates multiple agents running in parallel:
- **Monitoring**: Real-time agent progress tracking
- **Resource management**: Optimal resource allocation
- **Result aggregation**: Consolidated finding collection
- **Chain analysis**: Vulnerability relationship identification

## Usage Examples

### Basic Passive Reconnaissance
```bash
# Normal intensity reconnaissance
passive-recon-agent target.com

# Expected output:
# - Subdomain enumeration results
# - Live host identification
# - Initial vulnerability assessment
# - Manual testing recommendations
```

### Aggressive Comprehensive Assessment
```bash
# High intensity reconnaissance
aggressive-recon-agent target.com

# Expected output:
# - Comprehensive asset discovery
# - Detailed vulnerability analysis
# - Content discovery results
# - Advanced evasion techniques applied
```

### Fully Automated Assessment
```bash
# Automated orchestration with agent handoff
automated-recon-orchestrator target.com

# Expected output:
# - Complete reconnaissance pipeline
# - Intelligent agent delegation
# - Consolidated vulnerability assessment
# - Business impact analysis
```

## Configuration and Customization

### Proxy Configuration
```bash
# Custom proxy chains
export PROXY_CONFIG="/path/to/custom/proxychains.conf"

# SSH tunnel configuration
export SSH_PROXIES="user@proxy1.com user@proxy2.com user@proxy3.com"

# VPN rotation
export VPN_CONFIGS="/etc/openvpn/config1.ovpn /etc/openvpn/config2.ovpn"
```

### Nuclei Template Customization
```bash
# Custom template directories
export NUCLEI_CUSTOM_TEMPLATES="/home/user/nuclei-templates/custom/"

# High-impact template sets
export NUCLEI_AGGRESSIVE_TEMPLATES="/home/user/nuclei-templates/custom-aggressive/"
```

### Wordlist Configuration
```bash
# Directory enumeration wordlists
export FEROX_WORDLISTS="/usr/share/seclists/Discovery/Web-Content/"

# DNS brute force wordlists
export DNS_WORDLISTS="/usr/share/seclists/Discovery/DNS/"
```

## Security Considerations

### Legal and Ethical Usage
- **Authorization Required**: Always obtain explicit written permission
- **Scope Compliance**: Stay within defined testing boundaries
- **Responsible Disclosure**: Report vulnerabilities through appropriate channels
- **Documentation**: Maintain detailed logs of all testing activities

### OPSEC Best Practices
- **Proxy Verification**: Always test proxy connectivity before scanning
- **Rate Limiting**: Implement adaptive delays to avoid detection
- **Traffic Distribution**: Use multiple exit points for large scans
- **Fingerprint Rotation**: Regularly change user agents and headers

### Detection Avoidance
- **CDN Bypass**: Use origin IP discovery when possible
- **Request Randomization**: Vary timing and patterns
- **Error Handling**: Graceful response to rate limiting and blocking
- **Monitoring**: Watch for detection indicators and adjust accordingly

## Report Generation

### Standard Reports
Each agent generates comprehensive markdown reports including:
- **Executive Summary**: High-level findings and risk assessment
- **Technical Details**: Detailed vulnerability information
- **Manual Testing Recommendations**: Areas requiring human analysis
- **OPSEC Summary**: Anonymization measures employed

### Business Impact Assessment
The orchestrator includes advanced business impact analysis:
- **Risk Scoring**: Quantitative risk assessment
- **Attack Chain Analysis**: Vulnerability relationship mapping
- **Remediation Prioritization**: Strategic fix recommendations
- **Compliance Mapping**: Regulatory requirement alignment

## Integration with Other Agents

### Agent Handoff Scenarios
1. **Critical Vulnerabilities Found** → Immediate escalation to specialized agents
2. **API Endpoints Discovered** → API-focused security testing
3. **Authentication Systems Identified** → Authentication bypass testing
4. **Source Code Exposed** → Static analysis and secret scanning

### Collaborative Assessment
The agents work together to provide comprehensive coverage:
- **Reconnaissance** → **Exploitation** → **Post-Exploitation**
- **Asset Discovery** → **Vulnerability Analysis** → **Impact Assessment**
- **Technical Testing** → **Business Logic Analysis** → **Risk Evaluation**

## Performance and Scalability

### Resource Optimization
- **Parallel Processing**: Multi-threaded scanning with resource limits
- **Memory Management**: Efficient handling of large datasets
- **Network Optimization**: Bandwidth-aware scanning techniques
- **Storage Efficiency**: Compressed result storage and archival

### Scalability Features
- **Distributed Scanning**: Multi-host coordination capabilities
- **Cloud Integration**: Support for cloud-based infrastructure
- **API Integration**: REST API for external tool integration
- **Monitoring Integration**: SIEM and alerting system compatibility

---

## Quick Reference

### Agent Selection Guide
- **Stealth Required** → `passive-recon-agent`
- **Maximum Coverage** → `aggressive-recon-agent`  
- **Full Automation** → `automated-recon-orchestrator`

### Common Workflows
1. **Bug Bounty**: passive → aggressive → orchestrator (if findings warrant)
2. **Penetration Testing**: aggressive → specialized agent handoff
3. **Continuous Monitoring**: orchestrator with scheduling
4. **Red Team**: orchestrator with stealth configuration

### Emergency Procedures
- **Detection Alert**: Immediately rotate proxies and reduce scan rate
- **Legal Issues**: Stop all scanning and document activities
- **Technical Problems**: Failover to backup proxy infrastructure
- **Resource Exhaustion**: Implement emergency rate limiting

This reconnaissance agent suite provides comprehensive security assessment capabilities while maintaining operational security through advanced anonymization and evasion techniques.