---
name: agent-handoff
description: Execute intelligent agent handoff based on findings and target characteristics
allowed-tools: Bash, Read, Write, Grep, Glob, Task
argument-hint: "[findings-file|assessment-directory] [--agents auto|manual] [--parallel true|false]"
---

Intelligently hand off security testing to specialized agents based on current findings, target characteristics, and vulnerability types. This command:

1. **Finding Analysis**: Parse current assessment results for agent assignment criteria
2. **Agent Selection**: Choose appropriate specialized agents based on discovered vulnerabilities
3. **Context Preparation**: Create detailed handoff context with relevant information
4. **Parallel Execution**: Coordinate multiple agents running simultaneously
5. **Progress Monitoring**: Track agent execution and collect intermediate results

**Usage**: `/agent-handoff [findings-file|assessment-directory] [--agents auto|manual] [--parallel true|false]`

**Agent Selection Logic**:
- **Web Vulnerabilities** (XSS, SQLi, CSRF) → `web-app-penetration-tester`
- **API Endpoints** (GraphQL, REST, Swagger) → `web-app-penetration-tester --api-focused`
- **Infrastructure Issues** (Open ports, services) → `penetration-tester --infrastructure`
- **Source Code Exposure** (Git, configs, JS) → `security-code-reviewer`
- **Authentication Systems** (Login, SSO, MFA) → `penetration-tester --auth-focused`
- **Mobile Applications** (APK, IPA discovered) → `mobile-app-scanner`
- **Cloud Resources** (AWS, GCP, Azure) → `cloud-security-auditor`

**Handoff Criteria**:
- **Vulnerability Severity**: Critical/High findings trigger immediate handoff
- **Technology Stack**: Framework-specific agents for detected technologies
- **Asset Type**: Specialized agents for specific asset types (API, mobile, cloud)
- **Finding Category**: Route by vulnerability classification (OWASP, CWE)

**Process**:
1. Parse assessment results and extract key findings
2. Analyze technology stack and asset characteristics
3. Apply handoff logic to select appropriate agents
4. Generate detailed context files for each selected agent
5. Launch agents in parallel with progress monitoring
6. Collect and aggregate results as agents complete
7. Generate consolidated handoff summary

**Context Generation**:
Each agent receives a tailored context file containing:
- **Target Information**: Scope, discovered assets, technology stack
- **Relevant Findings**: Vulnerability discoveries specific to agent expertise
- **Priority Targets**: High-value assets requiring focused attention
- **Background Intelligence**: Reconnaissance results and asset relationships
- **Testing Recommendations**: Suggested approaches and techniques

**Monitoring and Coordination**:
- **Progress Tracking**: Real-time agent execution status
- **Resource Management**: Prevent agent conflicts and resource exhaustion
- **Result Collection**: Aggregate findings as agents complete
- **Error Handling**: Graceful handling of agent failures and retries

**Output**:
- Agent selection rationale with assignment criteria
- Parallel execution status with progress indicators
- Consolidated findings from all executed agents
- Cross-agent correlation analysis
- Recommendations for additional testing