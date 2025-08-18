---
name: finding-analysis
description: Analyze security findings for correlation, impact assessment, and exploitation chain identification
---

Analyze security findings for vulnerability correlation, impact assessment, and exploitation chain identification. This command:

1. **Finding Correlation**: Identify relationships between discovered vulnerabilities
2. **Impact Assessment**: Calculate business risk and potential damage scenarios
3. **Exploitation Chains**: Map attack paths and vulnerability chaining opportunities
4. **False Positive Analysis**: Validate findings and eliminate false positives
5. **Prioritization Matrix**: Generate remediation priorities based on risk and effort

**Usage**: `/finding-analysis findings-data [--correlation auto|manual] [--chains simple|complex] [--validation strict|normal|permissive]`

**Analysis Types**:
- `correlation`: Find relationships between vulnerabilities across different systems
- `chains`: Identify exploitation paths and attack chain possibilities
- `validation`: Verify finding authenticity and eliminate false positives
- `prioritization`: Generate fix recommendations based on risk and effort

**Correlation Methods**:
- **Host-based**: Vulnerabilities on the same host or subnet
- **Technology-based**: Issues in the same technology stack or framework
- **Attack-vector**: Similar attack methods or exploitation techniques
- **Data-flow**: Vulnerabilities in connected or dependent systems

**Chain Analysis**:
- **Simple Chains**: Direct vulnerability combinations (A → B → Impact)
- **Complex Chains**: Multi-step attack paths with conditional dependencies
- **Privilege Escalation**: Horizontal and vertical escalation opportunities
- **Data Access**: Paths to sensitive data exposure or exfiltration

**Process**:
1. Parse and normalize finding data from multiple sources
2. Extract key attributes (CVE, CWE, CVSS, location, technology)
3. Apply correlation algorithms to identify relationships
4. Map potential exploitation chains and attack paths
5. Calculate composite risk scores for chained vulnerabilities
6. Validate findings against false positive patterns
7. Generate prioritized remediation recommendations

**Risk Factors**:
- **Vulnerability Severity**: Individual CVSS scores and impact ratings
- **Asset Criticality**: Business importance of affected systems
- **Exposure Level**: Internal vs external accessibility
- **Exploitability**: Availability of exploits and ease of exploitation
- **Chaining Potential**: Ability to combine with other vulnerabilities

**Validation Criteria**:
- **Technical Verification**: Confirm exploitability with proof-of-concept
- **Context Analysis**: Verify relevance to target environment
- **Pattern Matching**: Compare against known false positive signatures
- **Manual Review**: Flag findings requiring human verification

**Output**:
- Vulnerability correlation matrix with relationship strengths
- Exploitation chain diagrams with attack path visualization
- Risk-prioritized finding list with remediation timelines
- False positive analysis with confidence ratings
- Business impact scenarios with potential damage assessment

**Visualization**:
- **Attack Trees**: Hierarchical attack path representation
- **Risk Heatmaps**: Visual risk distribution across asset portfolio
- **Timeline Analysis**: Vulnerability discovery and exploitation timelines
- **Network Diagrams**: Asset relationships and attack vector visualization

**Integration**:
- **SIEM Systems**: Export findings for security monitoring integration
- **Ticketing Systems**: Generate remediation tickets with priorities
- **Dashboards**: Real-time risk metrics and finding status
- **Threat Intelligence**: Correlate with external threat data