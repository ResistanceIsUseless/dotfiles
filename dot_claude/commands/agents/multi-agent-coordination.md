---
name: multi-agent-coordination
description: Coordinate multiple security agents for comprehensive parallel assessment
allowed-tools: Bash, Read, Write, Grep, Glob, Task, TodoWrite
argument-hint: "target-scope [--agents list|auto] [--max-parallel N] [--strategy comprehensive|focused|rapid]"
---

Coordinate multiple security agents for comprehensive parallel assessment with resource management and result aggregation. This command:

1. **Assessment Planning**: Design multi-agent testing strategy based on scope and objectives
2. **Resource Allocation**: Distribute targets and tasks across available agents
3. **Parallel Execution**: Launch coordinated agent testing with conflict prevention
4. **Progress Monitoring**: Real-time tracking of all agent activities and results
5. **Dynamic Adjustment**: Adapt agent assignments based on intermediate findings

**Usage**: `/multi-agent-coordination target-scope [--agents list|auto] [--max-parallel N] [--strategy comprehensive|focused|rapid]`

**Coordination Strategies**:
- `comprehensive`: Maximum coverage with all relevant agents
- `focused`: Target specific high-value assets with specialized agents
- `rapid`: Fast assessment with core agents only

**Agent Categories**:
- **Reconnaissance Agents**: passive-recon, aggressive-recon, automated-orchestrator
- **Web Security Agents**: web-app-penetration-tester, api-security-tester
- **Infrastructure Agents**: penetration-tester, network-scanner, cloud-auditor
- **Code Analysis Agents**: security-code-reviewer, dependency-scanner
- **Specialized Agents**: mobile-app-scanner, iot-security-tester

**Resource Management**:
- **Target Distribution**: Prevent duplicate testing of same assets
- **Rate Limiting**: Coordinate request rates to avoid detection
- **Proxy Allocation**: Distribute proxy usage across agents
- **Memory/CPU**: Monitor system resources and throttle if needed

**Conflict Prevention**:
- **Asset Locking**: Prevent simultaneous testing of same targets
- **Timing Coordination**: Stagger aggressive scans to avoid conflicts
- **Proxy Rotation**: Ensure agents don't share same exit points
- **Rate Limit Sharing**: Coordinate request rates across all agents

**Process**:
1. Analyze target scope and identify required agent types
2. Create comprehensive testing plan with agent assignments
3. Configure resource limits and conflict prevention measures
4. Launch agents in coordinated sequence with monitoring
5. Collect intermediate results and adjust strategy if needed
6. Aggregate final results from all agents
7. Generate comprehensive assessment summary

**Dynamic Adaptation**:
- **Finding-Based Escalation**: Launch additional agents based on discoveries
- **Resource Reallocation**: Reassign agents based on progress and findings
- **Priority Adjustment**: Focus resources on high-value discoveries
- **Scope Expansion**: Add new targets discovered during assessment

**Monitoring Dashboard**:
- **Agent Status**: Real-time status of all running agents
- **Resource Usage**: CPU, memory, network utilization per agent
- **Finding Stream**: Live feed of discoveries from all agents
- **Progress Metrics**: Completion percentage and estimated time remaining

**Output**:
- Multi-agent execution plan with resource allocation
- Real-time coordination dashboard with agent status
- Consolidated assessment results from all agents
- Cross-agent finding correlation analysis
- Resource efficiency and optimization recommendations