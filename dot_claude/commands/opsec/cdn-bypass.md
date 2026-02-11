---
name: cdn-bypass
description: Execute advanced CDN bypass techniques for direct origin access and detection avoidance
allowed-tools: Bash, Read, Write, WebFetch
argument-hint: "target-domain [--methods all|passive|active] [--verify strict|normal] [--output json|text]"
---

Execute advanced CDN bypass techniques to access origin servers directly and avoid detection by Cloudflare, Akamai, and other CDN providers. This command:

1. **Origin Discovery**: Multiple techniques to identify origin server IP addresses
2. **Direct Access Testing**: Validate direct origin connectivity and response
3. **Cache Busting**: Bypass CDN caching to reach origin servers
4. **Regional Routing**: Geographic routing to avoid primary CDN infrastructure
5. **Legacy Endpoint Discovery**: Identify non-CDN protected endpoints and subdomains

**Usage**: `/cdn-bypass target-domain [--methods all|passive|active] [--verify strict|normal] [--output json|text]`

**Discovery Methods**:
- `passive`: OSINT-based origin discovery (DNS history, certificate analysis)
- `active`: Direct testing and probing techniques
- `all`: Comprehensive approach using all available methods

**Origin Discovery Techniques**:
- **DNS History Analysis**: Historical DNS record mining from multiple sources
- **Certificate Transparency**: SSL certificate analysis for origin IPs
- **Subdomain Scanning**: Non-CDN protected subdomain identification
- **Censys/Shodan Queries**: Search engine based origin discovery
- **Network Range Analysis**: ISP and hosting provider IP range scanning

**Verification Methods**:
- **Host Header Testing**: Validate origin response with proper host headers
- **Response Comparison**: Compare CDN vs origin server responses
- **Timing Analysis**: Response time comparison for origin validation
- **Content Fingerprinting**: Verify identical content delivery

**Process**:
1. Analyze target domain for CDN usage and configuration
2. Execute passive origin discovery using OSINT sources
3. Perform active probing and testing for origin identification
4. Validate discovered origins with host header and content testing
5. Test cache busting techniques and legacy endpoint access
6. Document working bypass methods and access vectors
7. Generate bypass configuration for ongoing assessment use

**DNS History Sources**:
- **SecurityTrails**: Historical DNS record database
- **DNSdb**: Passive DNS database queries
- **Censys**: Certificate and infrastructure data
- **Archive.org**: Historical website data and IP records

**Certificate Analysis**:
- **Certificate Transparency Logs**: crt.sh, Google CT, Facebook CT
- **Subject Alternative Names**: Multi-domain certificate analysis
- **Certificate Chain Analysis**: Issuer and intermediate certificate data
- **Historical Certificate Data**: Previous certificate bindings

**Active Probing**:
- **Direct IP Access**: Test HTTP/HTTPS access to discovered IPs
- **Port Scanning**: Identify open ports on potential origin servers
- **Service Fingerprinting**: Confirm web service presence and configuration
- **Response Header Analysis**: Compare server headers and fingerprints

**Cache Busting Techniques**:
- **Query Parameter Injection**: Add random parameters to bypass caching
- **HTTP Method Variation**: Use non-cached HTTP methods
- **Cache Control Headers**: Request headers to bypass cache
- **Timestamp Parameters**: Time-based cache busting

**Output**:
- List of discovered origin IP addresses with confidence scores
- Validation results showing successful bypass methods
- Access configuration for direct origin communication
- CDN bypass effectiveness metrics and success rates
- Integration instructions for reconnaissance and testing tools

**Security Considerations**:
- **Rate Limiting**: Respect origin server rate limits
- **Legal Compliance**: Ensure bypass activities remain within scope
- **Impact Assessment**: Monitor for service disruption or detection
- **Documentation**: Maintain detailed logs of bypass activities