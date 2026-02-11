---
name: auto-recon
description: Execute fully automated reconnaissance with intelligent agent handoff and continuous monitoring. All findings should be validated and based on output from tooling.
allowed-tools: Bash, Read, Write, Grep, Glob, Task, TodoWrite
argument-hint: "target.com [--continuous|--one-shot|--monitoring] [--ssh-connection \"user@host:port\"]"
---

Execute comprehensive reconnaissance following the structured 8-phase methodology with intelligent analysis between each phase. This command:

1. **Automated Reconnaissance Pipeline**: Complete passive and active reconnaissance
2. **Intelligent Finding Analysis**: AI-powered vulnerability classification and risk assessment
3. **Strategic Agent Handoff**: Automatic delegation to specialized security agents
4. **Parallel Execution Coordination**: Multi-agent testing with progress monitoring
5. **Results Aggregation**: Consolidated analysis with business impact assessment


**Usage**: `/auto-recon target.com [--continuous|--one-shot|--monitoring] [--ssh-connection "user@host:port"]`

**SSH Examples**:
- `/auto-recon target.com --ssh-connection "root@vps.example.com:22"`
- `/auto-recon target.com --ssh-connection "kali@192.168.1.100:2222"`

**Modes**:
- `--one-shot`: Single comprehensive assessment (default)
- `--continuous`: Ongoing monitoring with scheduled rescans
- `--monitoring`: Lightweight continuous asset monitoring

--CRITICAL INSTRUCTIONS BEGIN--
* COMMANDS WILL RUN AS LONG AS THEY NEED! LET THEM RUN! *
*** ALL BASH COMMANDS MUST USE run_in_background: true TO AVOID TIMEOUTS ***
*** IF --ssh-connection PROVIDED: ALL COMMANDS MUST RUN VIA SSH CONNECTION ***
*** SSH COMMAND FORMAT: ssh user@host -p port "command here" ***
*** ALL FINDINGS SHOULD ALWAYS HAVE DETAILED BREAKDOWN OF WHAT COMMAND WAS RUN AND OUTPUT FROM THAT COMMAND WHICH BACKS UP FINDING OR INTERESTING RESULTS TO LOOK INTO FURTHER ***
Always start with tools and arguments referenced in `~/.claude/security-tools-reference.md` and avoid creating scripts when possible. Always making sure to output results to file for review.
If SSH connection defined, ALL reconnaissance commands run through that SSH connection for OPSEC.
Agent should run commands and let them finish and review output then move on to next step in flow. Running addtional commands to be thurough is highly encouraged.
Use BashOutput tool to monitor background commands and wait for completion before proceeding.
Agents can be used but only as subprocess for targeted checks such as a specific service or path with detailed instructions on what to check and what to return.
--CRITICAL INSTRUCTIONS END--

**Objective Flow**
***CRITICAL: After each phase, intelligently analyze output for actionable insights before proceeding***

1. Domain/subdomain recon
    - Objective: Use passive recon to create the intial scope of targets + intelligent analysis
    - Required Input: domain(s)
    - Required Output: subdomains, IP's + analysis notes
    - Tools: subfinder,subcope*experimental*, alterx + grep/gf for pattern analysis
    - Things to consider at this stage: subdomains with interesting names (dev, k8s, cluster, internal), subdomain take overs
    - **Analysis Focus**: Parse subdomain names for hints - Examples: k8s→kubernetes paths, api→API endpoints, admin→admin panels, dev→development configs, staging→test configs, etc. Use pattern recognition for any technology/purpose indicators
2. Active recon
    - Objective: Portscan, Service detection, Tech detection + contextual analysis
    - Required Input: subdomains, IP's + analysis from phase 1
    - Required Output: Detected ports/services, http service info (headers, status code, page title, tech detection) + targeted findings
    - Tools: nmap, naabu, webscope*experimental*, httpx, urlfinder + grep/gf for intelligent parsing
    - Things to consider at this stage: vulnerable services, interesting headers, interesting tech
    - **Analysis Focus**: Look for patterns and anomalies - Examples: Different Server headers across paths (backend inconsistencies), version disclosures, tech-specific paths (k8s→/api/v1/, GraphQL→/graphql, /v1/graphql), custom headers revealing infrastructure, unusual response patterns, etc. Adapt testing based on discovered technologies
3. Secondary recon
    - Objective: Locate additional targets through crawling, javascript parsing, smart path brute forcing, regex analysis + intelligent discovery
    - Required Input: Services (http services and paths, etc) + intelligence from phases 1-2
    - Required Output: Comprehensive path/endpoint mapping, secrets, configuration exposures + targeted attack vectors
    - Tools: nmap scripts, katana, webscope*experimental*, httpx, jsluice, gf + intelligent pattern matching
    - Things to consider at this stage: Web paths showing possible different back end paths, secrets, tech specific targets, paths like .git, etc
    - **Analysis Focus**: Act on all discovered intelligence - Examples: test kubernetes paths if k8s detected, search for GraphQL endpoints if GraphQL mentioned, probe different backends if multiple Server headers found, extract API keys/secrets from JS, identify technology-specific files (.env, web.config, etc.). Continuously correlate findings with previous phases and adapt approach
4. Additional checks
    - Objective: *Optional* Targeted path brute forcing based on discovered intelligence
    - Required Input: Services + targeted wordlists based on discovered tech stack
    - Required Output: Technology-specific endpoints and hidden functionality
    - Tools: feroxbuster, gobuster + custom wordlists based on findings
    - **Analysis Focus**: Leverage all technology intelligence - Examples: Use discovered tech stack for targeted wordlists (Django→admin/, Rails→rails/info, Spring→actuator/, etc.), focus on paths that showed different responses in previous phases. Adapt wordlists and techniques to any discovered frameworks, CMSs, or custom applications
5. Vulnerability Scanning
    - Objective: Nuclei scanning with broad and targeted scanning + intelligent template selection
    - Required Input: All discovered services, paths, technologies + analysis context
    - Required Output: Confirmed vulnerabilities with exploitation context
    - Tools: nuclei, nmap scripts, dalfox + targeted template selection
    - **Analysis Focus**: Target vulnerabilities based on complete intelligence picture - Examples: Use discovered technologies for targeted nuclei templates, correlate findings with previous intelligence (test GraphQL injections if GraphQL found, k8s misconfigurations if kubernetes detected, etc.). Comprehensive testing should leverage ALL discovered technologies, services, and patterns from previous phases
6. Subagent task creation
    - Objective: *Optional* Create subagent processes to evaluate specific findings with detailed context
    - **Web App Vulnerabilities** → web-app-penetration-tester
      - Example: "Analyze login form at https://target.com/admin/login for authentication bypasses, test with these discovered credentials: admin/admin123"
    - **API Security Issues** → api-tester  
      - Example: "Test API endpoint https://api.target.com/v1/users with bearer token ABC123, focus on authorization bypass and data exposure"
    - **Infrastructure Vulnerabilities** → penetration-tester
      - Example: "Exploit SSH service on target.com:22 running OpenSSH 7.4, test discovered weak credentials and configuration issues"
    - **Source Code Exposure** → security-code-reviewer
      - Example: "Analyze exposed .git repository at https://target.com/.git/, focus on secrets, API keys, and sensitive configuration files"
    - **Custom Template Creation** → nuclei-template-wizard
      - Example: "Create nuclei template for custom CMS vulnerability found at /admin/config.php with specific parameter injection"
    - **Impact Assessment** → bug-bounty-hunter
      - Example: "Prioritize and assess business impact of confirmed SQL injection in user search, SSRF in file upload, and exposed admin panel"
    **Time**: Extended duration for comprehensive assessment (typically 2-12 hours, potentially longer for complex environments with multiple agent handoffs)
    **Automation Level**: Fully automated
    **Agent Coordination**: Intelligent parallel execution
    **Addtional Agents**: ~/.claude/agents/security/*
    **Tool Selection**: Uses dynamic tool selection matrix from `~/.claude/security-tools-reference.md` to automatically escalate from **PASSIVE → AGGRESSIVE → MAXIMUM** based on findings and target authorization scope
    **Timeout Policy**: Automated orchestration continues until all delegated agents complete their specialized assessments, ensuring comprehensive security coverage regardless of execution time
7. Manual testing hand off
    - Objective: Create postman request, python script, burp mcp requests for user to manually look into or validate any findings
    - Required Input: Services (ssh, http service and paths, etc)
    - Required Output: Files or interaction to MCP server
    - Tools: burp MCP, python, postman, possibly custom nuclei templates
    - Things to consider at this stage: Providing enough information to manually review any findings
8. Summarize output and reccomend next steps


**Process**:
1. Initialize OPSEC configuration with custom SSH proxy if specified
2. Execute Phase 1-5 of Objective Flow manually with intelligent analysis between each phase
3. Review all findings and create targeted subagent tasks (Phase 6) only for specific deep-dive analysis
4. Generate manual testing artifacts (Phase 7) for user validation
5. Summarize findings and recommend next steps (Phase 8)

**CRITICAL**: Follow the detailed 8-phase Objective Flow above, NOT automated agent delegation. Only use subagents for specific findings after manual reconnaissance is complete.


**OPSEC Configuration Sharing**:
- SSH connection settings propagated to all delegated agents
- Shared proxy configuration ensures consistent anonymization
- Coordinated traffic distribution prevents detection correlation
- Master OPSEC dashboard monitors all agent activities

**Output**:
- Executive summary with overall risk assessment
- Save all output from tooling with commands ran
- Detailed findings from all executed agents
- Vulnerability chain analysis and attack paths
- Business impact assessment with remediation priorities
- Continuous monitoring recommendations

