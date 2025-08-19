---
name: deep-recon
description: Execute comprehensive deep reconnaissance with aggressive techniques and multi-source enumeration
---

Perform comprehensive deep reconnaissance on the target domain using aggressive scanning techniques. This command:

1. **Multi-Source Asset Discovery**: subscope with all data sources, DNS brute forcing, certificate transparency mining
2. **Enhanced Host Analysis**: Full port scanning, service fingerprinting, technology profiling
3. **Comprehensive Vulnerability Assessment**: All nuclei templates with custom additions
4. **Content Discovery**: Aggressive directory enumeration with multiple wordlists
5. **Advanced OPSEC**: Multi-tier proxy rotation with CDN bypass techniques

**Usage**: `/deep-recon target.com [--stealth|--aggressive|--comprehensive] [--ssh-connection "user@host:port"]`

**Modes**:
- `--stealth`: Maximum OPSEC with slower scanning
- `--aggressive`: Fast comprehensive scanning (default)
- `--comprehensive`: Include historical analysis and deep enumeration

**Process**:
1. Setup advanced proxy infrastructure (Tor + custom SSH tunnels if specified)
2. Execute multi-source subdomain discovery through proxy chains
3. Perform enhanced host discovery and profiling with OPSEC measures
4. Run comprehensive vulnerability assessment using proxy rotation
5. Conduct aggressive content discovery with stealth configuration
6. Generate detailed analysis report with proxy effectiveness metrics

**SSH Connection Configuration**:
- Custom SSH proxy server for additional anonymization layer
- Supports key-based authentication and SSH config integration
- Can chain multiple SSH hops for enhanced OPSEC
- Format: "user@hostname:port" or use SSH config aliases

**Output**:
- Complete asset inventory with risk assessment
- Detailed vulnerability analysis with exploitation guidance
- Technology stack analysis with version information
- Content discovery results with sensitive file identification
- OPSEC summary with detection avoidance measures

**Time**: 1-3 hours depending on target size and mode
**Stealth Level**: Configurable (high to medium)
**Tools Used**: subscope, webscope, nuclei, feroxbuster, nmap, amass, proxychains