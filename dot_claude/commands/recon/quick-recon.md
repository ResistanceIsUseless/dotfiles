---
name: quick-recon
description: Execute quick reconnaissance on a target domain using passive techniques
---

Perform quick passive reconnaissance on the specified target domain. This command:

1. **Subdomain Discovery**: Use subscope for rapid subdomain enumeration
2. **Live Host Detection**: Identify responsive web services
3. **Technology Fingerprinting**: Basic stack identification
4. **Quick Vulnerability Scan**: Run nuclei exposures templates
5. **OPSEC Setup**: Configure proxy chains for anonymity

**Usage**: `/quick-recon target.com [--scope wide|focused] [--output json|text] [--proxy-chain enabled|disabled] [--ssh-connection "user@host:port"]`

**Process**:
- Set up proxy chains with Tor and custom SSH connection if specified
- Run subscope for subdomain discovery through proxy chain
- Use webscope for live host identification with OPSEC configuration
- Execute nuclei with exposure templates using proxy rotation
- Generate summary report with findings and testing recommendations

**SSH Connection Options**:
- Format: "user@hostname:port" or "user@hostname" (default port 22)
- Supports SSH config files and identity files
- Can specify jump hosts and proxy commands
- Examples: "user@proxy.example.com:2222" or "recon@vpn-exit.com"

**Output**: 
- List of discovered subdomains
- Live hosts with technology stacks
- Initial vulnerability findings
- Recommendations for deeper testing

**Time**: ~10-15 minutes depending on target size
**Stealth Level**: High (passive techniques only)
**Tools Used**: subscope, webscope, nuclei, proxychains