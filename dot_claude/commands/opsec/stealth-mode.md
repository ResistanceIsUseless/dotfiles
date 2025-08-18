---
name: stealth-mode
description: Configure maximum stealth operational parameters for sensitive security assessments
---

Configure maximum stealth operational parameters for sensitive security assessments with advanced detection avoidance. This command:

1. **Advanced OPSEC Configuration**: Maximum anonymity and detection avoidance settings
2. **Traffic Obfuscation**: Request pattern randomization and timing variation
3. **Fingerprint Randomization**: Dynamic user agent, header, and protocol variation
4. **Rate Limiting**: Intelligent request spacing to avoid detection algorithms
5. **CDN Bypass**: Advanced techniques for Cloudflare, Akamai, and other CDN evasion

**Usage**: `/stealth-mode [--intensity maximum|high|moderate] [--target-type general|cdn|waf] [--duration hours]`

**Stealth Intensity Levels**:
- `maximum`: Ultra-stealth with minimal detection risk (slowest)
- `high`: Strong stealth with reasonable performance balance
- `moderate`: Balanced stealth and performance for general use

**Target-Specific Configurations**:
- `general`: Standard stealth configuration for most targets
- `cdn`: Enhanced CDN bypass techniques (Cloudflare, Akamai)
- `waf`: Web Application Firewall evasion focus

**Stealth Features**:
- **Request Timing**: Human-like browsing patterns with variable delays
- **User Agent Rotation**: Realistic browser fingerprint cycling
- **Header Randomization**: Dynamic HTTP header variation
- **Protocol Mixing**: HTTP/HTTPS/HTTP2 protocol variation
- **Geographic Distribution**: Exit point rotation across regions

**CDN Bypass Techniques**:
- **Origin IP Discovery**: Direct origin server identification and access
- **Cache Busting**: Techniques to bypass CDN caching mechanisms
- **Regional Routing**: Geographic routing to avoid primary CDN nodes
- **Legacy Endpoints**: Discovery and use of non-CDN protected endpoints

**Detection Avoidance**:
- **Pattern Breaking**: Avoid repetitive request patterns
- **Rate Limit Compliance**: Respect and adapt to rate limiting
- **Error Response Handling**: Intelligent response to blocking attempts
- **Session Management**: Realistic session and cookie handling

**Process**:
1. Analyze target characteristics and configure appropriate stealth level
2. Initialize advanced proxy chains with geographic distribution
3. Configure request timing and pattern randomization
4. Implement fingerprint rotation and header randomization
5. Enable CDN bypass techniques based on target analysis
6. Monitor for detection indicators and adjust parameters
7. Maintain stealth posture throughout assessment duration

**Timing Configuration**:
- **Base Delay**: Minimum time between requests (5-30 seconds)
- **Random Variation**: Additional random delay (0-60 seconds)
- **Burst Prevention**: Maximum requests per time window
- **Cool-down Periods**: Extended delays after intensive scanning

**Fingerprint Management**:
- **User Agent Pool**: Realistic browser user agent rotation
- **Accept Headers**: Browser-appropriate content type preferences
- **Language Headers**: Geographic-appropriate language preferences
- **Encoding Headers**: Realistic compression and encoding support

**Monitoring and Adaptation**:
- **Detection Indicators**: Monitor for blocking, rate limiting, captchas
- **Response Analysis**: Analyze response patterns for detection signs
- **Automatic Adjustment**: Adapt stealth parameters based on feedback
- **Fallback Modes**: Escalate stealth level if detection is suspected

**Output**:
- Stealth configuration summary with active parameters
- Detection monitoring dashboard with alert indicators
- Performance impact analysis with time estimates
- Effectiveness metrics and adaptation recommendations
- Incident log with any detection events or adjustments