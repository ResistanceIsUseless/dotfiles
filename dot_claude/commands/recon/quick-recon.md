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

**Usage**: `/quick-recon target.com`

**Process**:
- Set up proxy chains with Tor
- Run subscope for subdomain discovery
- Use webscope for live host identification
- Execute nuclei with exposure templates
- Generate summary report with findings

**Output**: 
- List of discovered subdomains
- Live hosts with technology stacks
- Initial vulnerability findings
- Recommendations for deeper testing

**Time**: ~10-15 minutes depending on target size
**Stealth Level**: High (passive techniques only)
**Tools Used**: subscope, webscope, nuclei, proxychains