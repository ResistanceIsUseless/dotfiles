# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive collection of specialized AI agents designed for rapid development cycles, security assessments, and technical operations. The repository contains 90+ expert agents organized by department, including an extensive security team with defensive/offensive capabilities and specialized reconnaissance agents, each designed to be invoked within Claude Code for specific tasks.

## Architecture & Structure

### Agent Organization
Agents are organized into departments based on their expertise:
- `engineering/` - Development, architecture, DevOps, testing agents (16 agents)
- `design/` - UI/UX, branding, visual storytelling agents (6 agents)
- `marketing/` - Growth, social media, app store optimization agents (7 agents)
- `product/` - Strategy, feedback analysis, trend research agents (5 agents)
- `project-management/` - Sprint planning, shipping, experiment tracking agents (3 agents)
- `studio-operations/` - Analytics, finance, infrastructure, legal agents (6 agents)
- `testing/` - Performance, API testing, quality analysis agents (6 agents)
- `security/` - Comprehensive security team with defensive and offensive research capabilities (17 agents)
- `advanced-analytics/` - Data science, network analysis, operations research agents (4 agents)
- `research-development/` - Algorithm research, computational science, quantum research agents (4 agents)
- `physical-sciences/` - Physics simulation, chaos theory, signal processing agents (4 agents)
- `life-sciences/` - Bioinformatics, computational biology, neuroscience agents (3 agents)
- `ham-radio-electronics/` - RF engineering, SDR development, antenna design agents (5 agents)
- `bonus/` - Studio coach and humor agents (2 agents)
- **Specialized Reconnaissance Agents** - Advanced security assessment and OSINT capabilities (4 agents)

### Agent File Structure
Each agent follows a consistent format:
```markdown
---
name: agent-name
description: When to use + detailed examples with context/commentary
color: visual-identifier
tools: Available tools (Write, Read, MultiEdit, Bash, etc.)
---

[Detailed system prompt with responsibilities, expertise, and best practices]
```

### Key Architectural Principles
- **6-Day Sprint Cycle**: All agents optimize for rapid development within 6-day cycles
- **Proactive Triggering**: Some agents (studio-coach, test-writer-fixer, whimsy-injector) activate automatically
- **Multi-Agent Collaboration**: Agents are designed to work together on complex tasks
- **Trend-Aware Development**: Focus on viral potential and rapid market validation

## Agent Usage Patterns

### Proactive Agents (Auto-Triggered)
- `studio-coach` - Activates for complex multi-agent tasks or when agents need guidance
- `test-writer-fixer` - Triggers after code changes to run tests and fix failures
- `whimsy-injector` - Activates after UI/UX changes to add delightful elements
- `experiment-tracker` - Triggers when feature flags or A/B tests are implemented

### Common Agent Combinations
- New app development: `rapid-prototyper` + `ui-designer` + `whimsy-injector`
- Requirements gathering: `requirements-engineer` + `ux-researcher` + `sprint-prioritizer`
- Data-driven features: `data-scientist` + `database-specialist` + `analytics-reporter`
- Complex integrations: `integration-specialist` + `backend-architect` + `security-code-reviewer`
- Browser development: `browser-architect` + `security-architect` + `performance-benchmarker`
- Marketing campaigns: `tiktok-strategist` + `content-creator` + `growth-hacker`
- Performance issues: `performance-benchmarker` + `infrastructure-maintainer`
- Launch preparation: `project-shipper` + `platform-publisher` + `app-store-optimizer`
- Security assessment: `penetration-tester` + `security-code-reviewer` + `compliance-auditor`
- Incident response: `incident-responder` + `threat-hunter` + `security-architect`
- Reconnaissance workflows: `passive-recon-agent` → `aggressive-recon-agent` → `automated-recon-orchestrator`
- Bug bounty assessment: `passive-recon-agent` + `web-app-penetration-tester` + `bug-bounty-hunter`
- Red team operations: `aggressive-recon-agent` + `red-team-operator` + `attack-simulation-coordinator`

## Development Workflow

### Starting New Projects
1. Use `rapid-prototyper` for MVP scaffolding and core features
2. Involve `ui-designer` for interface components
3. Add `whimsy-injector` for delightful user moments
4. Use `test-writer-fixer` to ensure code quality

### Feature Development
1. Use `sprint-prioritizer` to plan 6-day cycles
2. Implement features with appropriate engineering agents
3. Apply `security-code-reviewer` for security validation
4. Apply `whimsy-injector` after UI changes
5. Run `test-writer-fixer` after code modifications

### Launch & Growth
1. `project-shipper` coordinates launch activities
2. `app-store-optimizer` handles store presence
3. `tiktok-strategist` creates viral marketing content
4. `analytics-reporter` tracks performance metrics

## Agent Customization Guidelines

When modifying agents for specific needs:
- Maintain the YAML frontmatter structure
- Include 3-4 detailed usage examples with context/commentary
- Write comprehensive system prompts (500+ words)
- Test trigger conditions thoroughly
- Update tool access permissions as needed

## Quality Standards

### Agent Requirements
- Must include specific trigger examples with context
- Should integrate with 6-day sprint methodology
- Must specify exact tools available to agent
- Should include success metrics and best practices

### Code Quality
- All agents follow TypeScript/JavaScript best practices when generating code
- Prioritize modern frameworks (React/Next.js, Tailwind CSS)
- Include error handling and loading states
- Implement mobile-first responsive design

## Best Practices

### Working with Agents
- Be specific in task descriptions for better agent performance
- Allow agents to work together on complex tasks
- Trust agent expertise within their domains
- Iterate quickly based on agent output

### Sprint Management
- Use `sprint-prioritizer` for feature prioritization
- Leverage `studio-coach` for complex project coordination
- Apply `experiment-tracker` for data-driven decisions
- Celebrate wins and extract learnings with team

### Performance Optimization
- Use `performance-benchmarker` for speed analysis
- Apply `tool-evaluator` for technology decisions
- Leverage `workflow-optimizer` for process improvements
- Monitor with `analytics-reporter` for insights

## Security Integration

### Security Department (`security/`)
The security team provides comprehensive defensive and offensive research capabilities:

**Defensive Security Agents:**
- **penetration-tester** - Ethical hacking and vulnerability assessment
- **security-code-reviewer** - Secure coding practices and SAST analysis
- **incident-responder** - Security incident management and digital forensics
- **threat-hunter** - Proactive threat detection and behavioral analysis
- **security-architect** - Secure system design and zero trust architecture
- **compliance-auditor** - Regulatory compliance and audit preparation
- **nuclei-template-wizard** - Vulnerability template creation and optimization
- **web-app-penetration-tester** - Advanced web application security testing with exploitation
- **bug-bounty-hunter** - Professional bug bounty hunting and vulnerability research
- **mobile-app-scanner** - Mobile application security assessment
- **macos-security-privacy-specialist** - macOS-specific security and privacy assessment

**Offensive Security Research Agents:**
- **exploit-researcher** - Ethical exploit development and vulnerability research
- **red-team-operator** - Adversary emulation and attack simulation
- **malware-analyst** - Malicious software analysis and threat intelligence
- **social-engineering-researcher** - Human security and awareness research
- **attack-simulation-coordinator** - Comprehensive security exercise orchestration

### Security Workflow Integration

**Defensive Security Workflows:**
- **Pre-deployment**: `security-code-reviewer` + `penetration-tester` validate security
- **Architecture Review**: `security-architect` ensures secure design patterns
- **Incident Response**: `incident-responder` + `threat-hunter` manage security events
- **Compliance**: `compliance-auditor` maintains regulatory adherence
- **Vulnerability Management**: `nuclei-template-wizard` creates detection templates

**Offensive Security Research Workflows:**
- **Threat Research**: `exploit-researcher` + `malware-analyst` analyze attack techniques
- **Red Team Operations**: `red-team-operator` + `attack-simulation-coordinator` simulate adversaries
- **Security Validation**: `social-engineering-researcher` + `red-team-operator` test human controls
- **Training Development**: `attack-simulation-coordinator` + `social-engineering-researcher` create exercises
- **Threat Intelligence**: `malware-analyst` + `threat-hunter` correlate attack patterns

**Integrated Security Operations:**
- All security agents work together for comprehensive security coverage
- Offensive research informs defensive improvements and detection development
- Security findings include both technical and human factor remediation guidance
- Cross-team collaboration between red and blue team capabilities

### Security Best Practices

**Ethical Security Research:**
- All offensive security research is conducted for defensive purposes only
- Strict ethical boundaries maintained in all security testing and research
- Controlled environments used for exploit development and malware analysis
- Responsible disclosure practices followed for vulnerability research
- Focus on strengthening defenses rather than enabling attacks

**Comprehensive Security Coverage:**
- Defense-in-depth approach with both technical and human security controls
- Integration of offensive research findings into defensive improvements
- Continuous threat intelligence integration and sharing
- Regular security exercises and training programs
- Incident response maintains evidence integrity and legal compliance

**Quality and Safety Standards:**
- All security testing is non-destructive and properly scoped
- Safety mechanisms and controls built into all offensive security exercises
- Comprehensive documentation and knowledge sharing practices
- Regular review and improvement of security methodologies
- Compliance with industry standards and regulatory requirements

## Specialized Research Departments

### Advanced Analytics (`advanced-analytics/`)
Specialized agents for complex data analysis and operational research:
- **network-analyst** - Network topology analysis and traffic pattern recognition
- **numerical-analyst** - Advanced mathematical computation and statistical analysis
- **operations-researcher** - Optimization problems and decision science
- **statistical-theorist** - Statistical modeling and hypothesis testing

### Research & Development (`research-development/`)
Cutting-edge research agents for algorithm development and computational science:
- **algorithm-researcher** - Algorithm design, analysis, and optimization
- **computational-scientist** - High-performance computing and simulation
- **mathematical-modeler** - Mathematical modeling and numerical methods
- **quantum-researcher** - Quantum computing algorithms and applications

### Physical Sciences (`physical-sciences/`)
Agents specializing in physics simulation and signal processing:
- **chaos-theorist** - Nonlinear dynamics and complex systems analysis
- **computational-physicist** - Physics simulations and theoretical modeling
- **physics-simulator** - Physical system modeling and simulation
- **signal-processor** - Digital signal processing and analysis

### Life Sciences (`life-sciences/`)
Bioinformatics and computational biology specialists:
- **bioinformatics-researcher** - Genomic data analysis and biological databases
- **computational-biologist** - Mathematical biology and systems biology
- **neuroscience-modeler** - Neural network modeling and brain simulation

### Ham Radio & Electronics (`ham-radio-electronics/`)
Specialized agents for RF engineering and software-defined radio:
- **antenna-specialist** - Antenna design, modeling, and optimization
- **embedded-systems-engineer** - Microcontroller and IoT development
- **ham-radio-operator** - Amateur radio protocols and emergency communications
- **rf-engineer** - Radio frequency design and electromagnetic analysis
- **sdr-developer** - Software-defined radio development and signal analysis

## Specialized Reconnaissance Agents

### Advanced Security Assessment Capabilities
The repository includes specialized reconnaissance agents designed for comprehensive security assessments with advanced operational security:

**Reconnaissance Agent Suite:**
- **passive-recon-agent** - Normal intensity passive reconnaissance with OPSEC focus
- **aggressive-recon-agent** - High intensity comprehensive reconnaissance with advanced evasion
- **automated-recon-orchestrator** - Fully automated assessment with intelligent agent handoff
- **pentesting-agent** - General penetration testing with ethical hacking focus

### Reconnaissance Workflow Integration

**Progressive Assessment Methodology:**
1. **Initial Discovery**: `passive-recon-agent` for stealth asset discovery and basic vulnerability assessment
2. **Comprehensive Analysis**: `aggressive-recon-agent` for deep enumeration and extensive vulnerability scanning
3. **Automated Orchestration**: `automated-recon-orchestrator` for intelligent agent coordination and specialized testing

**Intelligence-Driven Handoffs:**
- **Web Application Vulnerabilities** → `web-app-penetration-tester` for exploitation and PoC development
- **Infrastructure Vulnerabilities** → `penetration-tester` for network and service security testing
- **Source Code Exposure** → `security-code-reviewer` for static analysis and secret detection
- **API Endpoints** → `web-app-penetration-tester` (API-focused) for GraphQL and REST security testing

### Advanced OPSEC Integration

**Multi-Layer Anonymization:**
- Tor circuit rotation with geographic distribution
- SSH tunnel meshes through multiple proxy servers
- VPN rotation and residential proxy integration
- Advanced CDN bypass techniques for Cloudflare/Akamai evasion

**Detection Avoidance:**
- Request timing randomization and pattern breaking
- User agent rotation with realistic browser fingerprints
- Traffic distribution across multiple exit points
- Adaptive rate limiting with detection response

**Tool Integration:**
- **subscope**: Multi-source subdomain enumeration with OPSEC
- **webscope**: Comprehensive web service analysis and fingerprinting
- **nuclei**: Template-based vulnerability scanning with custom additions
- **feroxbuster**: Content discovery with stealth configuration
- **proxyhawk, jsluice**: Custom security tools for specialized analysis

### Reconnaissance Best Practices

**Operational Security:**
- All reconnaissance agents implement advanced proxy chains by default
- Automatic detection avoidance with intelligent response to blocking
- Comprehensive logging for legal compliance and audit trails
- Responsible disclosure integration for vulnerability reporting

**Assessment Quality:**
- Professional reporting with executive summaries and technical details
- Business impact assessment with risk prioritization
- Cross-agent finding correlation and attack chain identification
- Integration points for manual testing and specialized analysis

**Scalability and Automation:**
- Parallel agent execution with resource management and conflict prevention
- Intelligent workload distribution across multiple assessment phases
- Continuous monitoring capabilities with change detection
- API integration for external tool coordination and result aggregation

This repository represents a complete ecosystem of AI expertise designed for comprehensive security assessments, rapid development cycles, advanced research capabilities, and specialized technical operations across multiple domains.