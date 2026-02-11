# Security Tools Reference Guide

## CRITICAL EXECUTION REQUIREMENTS
*** ALL BASH COMMANDS MUST USE run_in_background: true TO AVOID TIMEOUTS ***
*** USE BashOutput tool to monitor command progress and wait for completion ***
*** Commands must run to completion - no 2-minute timeout limits ***

## Aggression Level Definitions

### 🟢 PASSIVE (Level 1) - Minimal Footprint
**Use Case**: Initial reconnaissance, compliance testing, stealth operations
**Detection Risk**: Very Low
**Tool Selection**:
- **Subdomain Discovery**: subfinder (passive only), amass (passive), crt.sh
- **DNS Resolution**: dnsx (simple queries only)
- **HTTP Probing**: httpx (minimal threads, realistic delays)
- **Vulnerability Scanning**: nuclei (exposures templates only)
- **Content Discovery**: waybackurls, gau (archive sources)
- **OPSEC**: Always through proxy chains, 2-5 second delays

### 🟡 MODERATE (Level 2) - Balanced Approach  
**Use Case**: Standard bug bounty, routine security assessments
**Detection Risk**: Low to Medium
**Tool Selection**:
- **Subdomain Discovery**: subfinder + amass + assetfinder
- **DNS Resolution**: dnsx with bruteforcing, puredns
- **HTTP Probing**: httpx with tech detection, multiple threads
- **Port Scanning**: naabu (top ports only), limited nmap
- **Vulnerability Scanning**: nuclei (critical/high/medium), basic nikto
- **Content Discovery**: katana, ffuf with common wordlists
- **OPSEC**: Proxy chains recommended, 1-2 second delays

### 🟠 AGGRESSIVE (Level 3) - Comprehensive Coverage
**Use Case**: Detailed penetration testing, red team exercises
**Detection Risk**: Medium to High  
**Tool Selection**:
- **Subdomain Discovery**: All tools + DNS bruteforcing + permutations
- **DNS Resolution**: massdns, puredns with large wordlists
- **HTTP Probing**: httpx with full analysis, screenshots
- **Port Scanning**: nmap comprehensive, masscan, rustscan
- **Vulnerability Scanning**: nuclei (all templates), nikto, custom scripts
- **Content Discovery**: feroxbuster, gobuster, multiple wordlists
- **Web Testing**: burp active scans, sqlmap, custom exploitation
- **OPSEC**: Proxy rotation, randomized timing

### 🔴 MAXIMUM (Level 4) - Full Spectrum Assessment
**Use Case**: Authorized penetration testing, security research
**Detection Risk**: High
**Tool Selection**:
- **All Level 3 tools** plus:
- **Advanced Scanning**: Custom exploits, 0-day testing
- **Network Testing**: Internal network pivoting, lateral movement
- **Social Engineering**: OSINT on employees, phishing simulation
- **Physical Security**: Wireless assessment, physical penetration
- **Post-Exploitation**: Persistence testing, data exfiltration simulation
- **OPSEC**: Advanced evasion, APT simulation techniques

## Tool Selection Matrix

| Phase | Passive | Moderate | Aggressive | Maximum |
|-------|---------|----------|------------|---------|
| **Subdomain Enum** | subfinder | +amass +assetfinder | +DNS bruteforce | +Custom scripts |
| **Port Scanning** | None | naabu (top 1000) | +masscan +nmap | +Custom protocols |
| **Web Scanning** | nuclei (exposures) | +medium severity | +all templates | +Custom exploits |
| **Content Discovery** | waybackurls only | +katana +basic ffuf | +feroxbuster +large wordlists | +ML-based discovery |
| **Timing** | 3-5 sec delays | 1-2 sec delays | 0.5-1 sec delays | Optimized for speed |
| **Proxy Usage** | Always required | Recommended | Optional | Advanced evasion |

## Core Reconnaissance Tools

### Subdomain Enumeration
| Tool | Command | Description |
|------|---------|-------------|
| **subfinder** | `subfinder -d target.com -all` | Fast passive subdomain discover, add -active to only get active hosts. Getting all hosts is good for dns permutations and domain takeover testing. |
| **amass** | `amass enum -passive -d target.com` | Comprehensive subdomain enumeration |
| **assetfinder** | `assetfinder --subs-only target.com` | Find related domains and subdomains |
| **findomain** | `findomain -t target.com` | Cross-platform subdomain finder |
| **subscope** | `subscope target.com` | Custom wrapper combining multiple tools |

### DNS Resolution & Analysis
| Tool | Command | Description |
|------|---------|-------------|
| **dnsx** | `dnsx -l domains.txt -resp` | Fast DNS resolver with multiple features |
| **massdns** | `massdns -r resolvers.txt -o S domains.txt` | High-performance DNS resolver |
| **puredns** | `puredns resolve domains.txt` | DNS bruteforcing and resolution |
| **alterx** | 

### HTTP Probing & Analysis
| Tool | Command | Description |
|------|---------|-------------|
| **httpx** | `httpx -l urls.txt -status-code -title -tech-detect` | HTTP toolkit for probing |
| **httprobe** | `cat domains.txt \| httprobe` | Probe for working HTTP/HTTPS servers (alternative to httpx) |
| **webscope** | `webscope subdomains.txt` | Custom live host identifier with httpx as library |

### Port Scanning
| Tool | Command | Description |
|------|---------|-------------|
| **nmap** | `nmap -sV -sC target.com` | Comprehensive port scanner |
| **masscan** | `masscan -p1-65535 target.com --rate=1000` | Fast port scanner |
| **rustscan** | `rustscan -a target.com` | Modern fast port scanner (resource intensive) |
| **naabu** | `naabu -host target.com` | Fast SYN port scanner |

## Vulnerability Scanning

### Automated Scanners
| Tool | Command | Description |
|------|---------|-------------|
| **nuclei** | `nuclei -u https://target.com -severity critical,high` | Template-based vulnerability scanner |
| **nikto** | `nikto -h https://target.com` | Web server scanner |
| **wpscan** | `wpscan --url https://target.com` | WordPress vulnerability scanner |

### Web Fuzzing
| Tool | Command | Description |
|------|---------|-------------|
| **ffuf** | `ffuf -u https://target.com/FUZZ -w wordlist.txt` | Fast web fuzzer |
| **gobuster** | `gobuster dir -u https://target.com -w wordlist.txt` | Directory/file brute-forcer |
| **wfuzz** | `wfuzz -w wordlist.txt https://target.com/FUZZ` | Web application fuzzer |
| **dirsearch** | `dirsearch -u https://target.com` | Web path scanner |
| **feroxbuster** | `feroxbuster 

## Web Application Testing

### Manual Testing Tools
| Tool | Command | Description |
|------|---------|-------------|
| **Burp Suite MCP** | GUI Application | Web vulnerability scanner and proxy |
| **OWASP ZAP** | GUI Application | Web application security scanner |
| **mitmproxy** | `mitmproxy` | Interactive HTTPS proxy |

### SQL Injection
| Tool | Command | Description |
|------|---------|-------------|
| **sqlmap** | `sqlmap -u "https://target.com?id=1"` | Automatic SQL injection tool |

### XSS Testing
| Tool | Command | Description |
|------|---------|-------------|
| **XSStrike** | `python xsstrike.py -u "https://target.com?q="` | XSS scanner |
| **dalfox** | `dalfox url https://target.com` | XSS scanner and analyzer |

### API Testing
| Tool | Command | Description |
|------|---------|-------------|
| **arjun** | `arjun -u https://target.com/api` | HTTP parameter discovery |
| **kiterunner** | `kr scan https://target.com` | API endpoint discovery |

## Content Discovery

### Web Crawling
| Tool | Command | Description |
|------|---------|-------------|
| **katana** | `katana -u https://target.com` | Fast web crawler |
| **hakrawler** | `hakrawler -url https://target.com` | Web crawler for gathering URLs |
| **gospider** | `gospider -s https://target.com` | Fast web spider |
| **gau** | `gau target.com` | Fetch URLs from multiple sources |
| **waybackurls** | `waybackurls target.com` | Fetch URLs from Wayback Machine |

## OPSEC & Proxy Tools

### Proxy Management
| Tool | Command | Description |
|------|---------|-------------|
| **proxychains** | `proxychains4 nmap target.com` | Force connections through proxy |
| **tor** | `tor` | Anonymity network |
| **SSH SOCKS** | `ssh -D 8080 user@proxy.com` | Create SOCKS proxy via SSH |

## Network Tools

### Network Scanning
| Tool | Command | Description |
|------|---------|-------------|
| **arp-scan** | `arp-scan -l` | Discover hosts on local network |
| **netcat** | `nc -lvnp 4444` | Network utility for reading/writing |
| **socat** | `socat TCP-L:8080,fork TCP:target.com:80` | Multipurpose relay tool |

## Exploitation Frameworks

### Frameworks
| Tool | Command | Description |
|------|---------|-------------|
| **Metasploit** | `msfconsole` | Penetration testing framework |
| **searchsploit** | `searchsploit apache 2.4` | Exploit database search |

## Reporting & Analysis

### Data Processing
| Tool | Command | Description |
|------|---------|-------------|
| **jq** | `cat data.json \| jq '.results[]'` | JSON processor |
| **gron** | `gron data.json` | Make JSON greppable |
| **anew** | `cat new.txt \| anew all.txt` | Append unique lines |
| **gf** | `cat urls.txt \| gf xss` | Pattern matching for URLs |

## Custom Reconnaissance Workflows

### Quick Reconnaissance
```bash
# Basic subdomain enumeration and live host detection
subscope target.com | webscope | nuclei -severity high,critical
```

### Deep Reconnaissance
```bash
# Comprehensive reconnaissance with multiple tools
amass enum -d target.com -o amass.txt
cat amass.txt | dnsx -resp -o resolved.txt
cat resolved.txt | httpx -status-code -title -tech-detect -o live.txt
cat live.txt | nuclei -t ~/.config/nuclei/templates/
```

### API Reconnaissance
```bash
# API endpoint discovery and testing
echo "https://api.target.com" | katana -f qurl | gf json | nuclei -t api/
arjun -u https://api.target.com/endpoint
```

### Stealth Reconnaissance
```bash
# Reconnaissance through proxy chains
proxychains4 subfinder -d target.com -silent
proxychains4 httpx -l subdomains.txt -random-agent
```

## Environment Variables

```bash
# Add to ~/.bashrc or ~/.zshrc

# Go environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Tool paths
export PATH=$PATH:~/tools

# Proxy configuration
export HTTP_PROXY=socks5://127.0.0.1:8080
export HTTPS_PROXY=socks5://127.0.0.1:8080

# Nuclei templates
export NUCLEI_TEMPLATES=~/.config/nuclei/templates
```

## Tool Configuration Files

### Amass Configuration
Location: `~/.config/amass/config.ini`
```ini
[data_sources]
Passive = true
Active = false

[data_sources.AlienVault]
[data_sources.SecurityTrails]
apikey = YOUR_API_KEY
```

### Subfinder Configuration
Location: `~/.config/subfinder/config.yaml`
```yaml
resolvers:
  - 8.8.8.8
  - 8.8.4.4
  - 1.1.1.1
sources:
  - alienvault
  - securitytrails
  - shodan
```

### Nuclei Configuration
Location: `~/.config/nuclei/config.yaml`
```yaml
rate-limit: 150
bulk-size: 25
concurrency: 25
```

### Proxychains Configuration
Location: `/etc/proxychains4.conf` or `~/.proxychains/proxychains.conf`
```conf
strict_chain
proxy_dns
tcp_read_time_out 15000
tcp_connect_time_out 8000

[ProxyList]
socks5 127.0.0.1 9050  # Tor
socks5 127.0.0.1 8080  # SSH tunnel
```

## SSH Proxy Setup

### Create SSH SOCKS Proxy
```bash
# Basic SSH proxy
ssh -D 8080 -f -C -q -N user@proxy-server.com

# With specific identity file
ssh -D 8080 -f -C -q -N -i ~/.ssh/key.pem user@proxy-server.com

# Through jump host
ssh -D 8080 -f -C -q -N -J jumphost user@target-server.com
```

### SSH Config for Proxy
Location: `~/.ssh/config`
```
Host proxy-server
    HostName proxy-server.com
    User pdadmin
    IdentityFile ~/.ssh/pdadmin_key.pem
    DynamicForward 8080
    ServerAliveInterval 60
    ServerAliveCountMax 3
```

## Quick Commands Reference

```bash
# Start Tor service
sudo service tor start

# Enable proxy for current session
export http_proxy=socks5://127.0.0.1:8080
export https_proxy=socks5://127.0.0.1:8080

# Disable proxy
unset http_proxy https_proxy

# Update all tools
nuclei -update-templates
go get -u all
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U

# Check tool versions
nuclei -version
subfinder -version
httpx -version
```

## Troubleshooting

### Common Issues

1. **Go tools not found**
   ```bash
   export PATH=$PATH:~/go/bin
   source ~/.bashrc
   ```

2. **Permission denied on port scanning**
   ```bash
   sudo setcap cap_net_raw+ep $(which naabu)
   sudo setcap cap_net_raw+ep $(which masscan)
   ```

3. **Proxy not working**
   ```bash
   # Check if proxy is running
   ps aux | grep ssh | grep 8080
   netstat -an | grep 8080
   ```

4. **Nuclei templates outdated**
   ```bash
   nuclei -update-templates
   cd ~/.config/nuclei/templates && git pull
   ```