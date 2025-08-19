---
name: setup-proxy-chain
description: Configure advanced proxy chains with Tor, SSH tunnels, and VPN rotation for operational security
---

Configure advanced proxy chains combining Tor, SSH tunnels, and VPN rotation for maximum operational security during security assessments. This command:

1. **Multi-Layer Proxy Setup**: Tor + SSH tunnels + VPN rotation configuration
2. **Health Monitoring**: Continuous proxy connectivity and performance monitoring
3. **Automatic Rotation**: Dynamic proxy switching based on performance and detection
4. **Traffic Distribution**: Load balancing across multiple exit points
5. **Detection Avoidance**: Advanced techniques to avoid CDN and WAF detection

**Usage**: `/setup-proxy-chain [--layers tor,ssh,vpn] [--rotation auto|manual] [--health-check enabled|disabled] [--ssh-connection "user@host:port"]`

**Proxy Layers**:
- `tor`: Multiple Tor circuits with different exit nodes
- `ssh`: SSH tunnels through multiple proxy servers
- `vpn`: VPN rotation through different geographic locations
- `residential`: Residential proxy network integration

**Configuration Options**:
- `--layers`: Select proxy layer combinations
- `--rotation`: Automatic vs manual proxy rotation
- `--health-check`: Enable continuous health monitoring
- `--geographic`: Geographic distribution of exit points
- `--rate-limit`: Request rate limiting per proxy
- `--ssh-connection`: Custom SSH connection string (format: "user@host:port" or "user@host")

**Advanced Features**:
- **Circuit Isolation**: Separate Tor circuits for different scan phases
- **Geographic Distribution**: Exit nodes from multiple countries/regions
- **Protocol Mixing**: HTTP/HTTPS/SOCKS proxy protocol mixing
- **Fingerprint Rotation**: User agent and header randomization
- **Timing Variation**: Request timing randomization to avoid patterns

**Process**:
1. Initialize Tor daemon with multiple circuits
2. Establish SSH tunnels to configured proxy servers
3. Configure VPN connections for additional anonymity layers
4. Test connectivity and performance of all proxy chains
5. Implement health monitoring and automatic failover
6. Configure request distribution and rotation logic
7. Enable detection avoidance and fingerprint randomization

**Tor Configuration**:
- Multiple SocksPort instances (9050, 9051, 9052, 9053)
- Isolated circuits for different assessment phases
- Exit node geographic distribution preferences
- Circuit building and rotation timing

**SSH Tunnel Management**:
- Dynamic port forwarding through multiple servers
- Custom SSH connection string support with flexible host/port specification
- Key-based authentication with automated connection
- Connection health monitoring and automatic reconnection
- Load balancing across available tunnel endpoints
- Support for SSH configuration files and jump hosts

**Health Monitoring**:
- Continuous connectivity testing to external services
- Response time and performance metrics
- Automatic proxy rotation on failure or degradation
- Detection of rate limiting or blocking

**Output**:
- Proxy chain configuration summary with active endpoints
- Health status dashboard with connectivity metrics
- Geographic distribution map of exit points
- Performance metrics and rotation statistics
- Detection avoidance status and effectiveness measures

**Integration**: Automatically used by all reconnaissance and security testing agents