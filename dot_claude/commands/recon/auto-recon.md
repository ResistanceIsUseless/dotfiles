---
name: auto-recon
description: Execute fully automated reconnaissance with intelligent agent handoff and continuous monitoring
---

Launch the automated reconnaissance orchestrator for comprehensive assessment with intelligent agent delegation. This command:

1. **Automated Reconnaissance Pipeline**: Complete passive and active reconnaissance
2. **Intelligent Finding Analysis**: AI-powered vulnerability classification and risk assessment
3. **Strategic Agent Handoff**: Automatic delegation to specialized security agents
4. **Parallel Execution Coordination**: Multi-agent testing with progress monitoring
5. **Results Aggregation**: Consolidated analysis with business impact assessment

**Usage**: `/auto-recon target.com [--continuous|--one-shot|--monitoring]`

**Modes**:
- `--one-shot`: Single comprehensive assessment (default)
- `--continuous`: Ongoing monitoring with scheduled rescans
- `--monitoring`: Lightweight continuous asset monitoring

**Automated Agent Handoffs**:
- **Web App Vulnerabilities** → web-app-penetration-tester
- **API Security Issues** → web-app-penetration-tester (API-focused)
- **Infrastructure Vulnerabilities** → penetration-tester
- **Source Code Exposure** → security-code-reviewer
- **Authentication Weaknesses** → penetration-tester (auth-focused)

**Process**:
1. Execute comprehensive reconnaissance (aggressive-recon-agent)
2. Analyze findings for vulnerability classification
3. Generate agent handoff contexts based on discovery
4. Launch specialized agents in parallel
5. Monitor agent progress and collect results
6. Aggregate findings and calculate business impact
7. Generate master assessment report

**Output**:
- Executive summary with overall risk assessment
- Detailed findings from all executed agents
- Vulnerability chain analysis and attack paths
- Business impact assessment with remediation priorities
- Continuous monitoring recommendations

**Time**: 2-6 hours depending on findings and agent handoffs
**Automation Level**: Fully automated
**Agent Coordination**: Intelligent parallel execution