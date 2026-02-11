---
name: generate-report
description: Generate comprehensive security assessment reports with multiple output formats
allowed-tools: Read, Write, Grep, Glob
argument-hint: "assessment-data [--format executive|technical|bug-bounty|compliance] [--audience client|internal|bug-bounty]"
---

Generate comprehensive security assessment reports from agent findings with customizable formats and executive summaries. This command:

1. **Data Aggregation**: Collect and consolidate findings from multiple assessment sources
2. **Risk Analysis**: Calculate CVSS scores, business impact, and remediation priorities
3. **Report Customization**: Generate reports tailored to specific audiences and requirements
4. **Compliance Mapping**: Align findings with regulatory frameworks and standards
5. **Executive Summaries**: Create high-level summaries for management and stakeholders

**Usage**: `/generate-report assessment-data [--format executive|technical|bug-bounty|compliance] [--audience client|internal|bug-bounty] [--compliance owasp|nist|pci|iso27001]`

**Report Formats**:
- `executive`: High-level business risk summary for management
- `technical`: Detailed technical findings for security teams
- `bug-bounty`: Professional bug bounty submission format
- `compliance`: Regulatory compliance assessment report

**Audience Customization**:
- `client`: External client penetration testing report
- `internal`: Internal security team assessment
- `bug-bounty`: Bug bounty platform submission

**Compliance Frameworks**:
- `owasp`: OWASP Top 10 and ASVS alignment
- `nist`: NIST Cybersecurity Framework mapping
- `pci`: PCI DSS compliance assessment
- `iso27001`: ISO 27001 control alignment

**Report Sections**:
- **Executive Summary**: Business risk overview with key metrics
- **Methodology**: Assessment approach and tools used
- **Findings Summary**: Vulnerability statistics and severity breakdown
- **Detailed Findings**: Technical details with reproduction steps
- **Risk Assessment**: Business impact analysis and CVSS scoring
- **Remediation Guide**: Prioritized fix recommendations
- **Appendices**: Technical details, tool outputs, and evidence

**Risk Calculation**:
- **CVSS Scoring**: Automated CVSS v3.1 score calculation
- **Business Impact**: Asset criticality and exposure assessment
- **Exploitability**: Technical complexity and attack vector analysis
- **Remediation Effort**: Fix complexity and resource requirements

**Process**:
1. Parse and consolidate assessment data from multiple sources
2. Classify vulnerabilities by type, severity, and impact
3. Calculate risk scores using CVSS and business impact factors
4. Generate compliance mapping for selected frameworks
5. Create audience-appropriate content and formatting
6. Generate executive summary with key metrics and recommendations
7. Export to multiple formats (PDF, HTML, Markdown, JSON)

**Data Sources**:
- Nuclei vulnerability scan results
- Agent assessment findings
- Manual testing discoveries
- Configuration analysis results
- Dependency vulnerability reports

**Output Formats**:
- **PDF**: Professional formatted reports with charts and graphs
- **HTML**: Interactive reports with filtering and search
- **Markdown**: Technical documentation format
- **JSON**: Structured data for integration and automation
- **Excel**: Spreadsheet format for tracking and metrics

**Customization Options**:
- **Branding**: Custom logos, colors, and company information
- **Templates**: Pre-defined report templates for common scenarios
- **Metrics**: Custom scoring and risk calculation methods
- **Sections**: Configurable report sections and content
- **Evidence**: Automatic screenshot and proof inclusion