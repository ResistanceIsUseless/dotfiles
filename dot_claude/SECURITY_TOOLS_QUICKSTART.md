# Security Tools Quick Start Guide

## 🚀 Installation Methods

### Method 1: Native Installation (Recommended)
```bash
# Make the script executable
chmod +x security-tools-setup.sh

# Run the installation
./security-tools-setup.sh

# Source your shell configuration
source ~/.bashrc  # or ~/.zshrc
```

### Method 2: Docker Installation
```bash
# Start all containers
docker-compose -f security-tools-docker.yml up -d

# Access Kali container with all tools
docker exec -it kali-tools /bin/bash

# Or use specific tool containers
docker run --rm -v $(pwd):/targets projectdiscovery/nuclei -u https://target.com
```

### Method 3: Custom Recon Container
```bash
# Build the custom container
docker build -f Dockerfile.recon -t recon-tools .

# Run interactive session
docker run -it --rm \
  -v $(pwd)/targets:/targets \
  -v $(pwd)/results:/results \
  -v ~/.ssh:/root/.ssh:ro \
  --network host \
  recon-tools
```

## 🎯 Quick Reconnaissance Workflows

### 1. Basic Recon (5 minutes)
```bash
# Subdomain discovery + live check + basic vulns
subscope target.com | webscope | nuclei -severity high,critical
```

### 2. Standard Recon (15 minutes)
```bash
# Set target
TARGET="example.com"

# Subdomain enumeration
subfinder -d $TARGET -o subdomains.txt
amass enum -passive -d $TARGET >> subdomains.txt
sort -u subdomains.txt -o subdomains.txt

# DNS resolution
dnsx -l subdomains.txt -resp -o resolved.txt

# Live host detection
httpx -l resolved.txt -status-code -title -tech-detect -o live.txt

# Vulnerability scanning
nuclei -l live.txt -severity critical,high,medium -o vulns.txt
```

### 3. Deep Recon with OPSEC (30+ minutes)
```bash
# Setup SSH proxy
ssh -D 8080 -f -C -q -N -i ~/.ssh/key.pem user@proxy.com

# Run through proxy
proxychains4 subfinder -d target.com -silent > subs.txt
proxychains4 httpx -l subs.txt -random-agent -o live.txt
proxychains4 nuclei -l live.txt -rl 50 -o vulns.txt
```

## 🔧 Essential Commands

### Subdomain Enumeration
```bash
# Quick subdomain discovery
subfinder -d target.com -all

# Comprehensive with multiple sources
echo target.com | subfinder | anew subs.txt
echo target.com | assetfinder --subs-only | anew subs.txt
amass enum -passive -d target.com | anew subs.txt

# With DNS resolution
cat subs.txt | dnsx -resp -o resolved.txt
```

### Web Discovery
```bash
# Find live hosts
cat domains.txt | httpx -status-code -title -tech-detect

# Directory fuzzing
ffuf -u https://target.com/FUZZ -w /wordlists/common.txt

# Content discovery
katana -u https://target.com -d 3 -o urls.txt
```

### Vulnerability Scanning
```bash
# Nuclei with all templates
nuclei -u https://target.com -t ~/nuclei-templates/

# Specific severity
nuclei -l targets.txt -severity critical,high

# Custom templates
nuclei -u https://target.com -t custom-templates/
```

### API Testing
```bash
# Find API endpoints
echo https://api.target.com | katana -f qurl | gf json

# Parameter discovery
arjun -u https://api.target.com/endpoint

# API fuzzing
ffuf -u https://api.target.com/FUZZ -w api-endpoints.txt
```

## 🛡️ OPSEC Configuration

### SSH Proxy Setup
```bash
# Create SOCKS proxy
ssh -D 8080 -f -C -q -N user@proxy-server.com

# With identity file
ssh -D 8080 -f -C -q -N -i ~/.ssh/key.pem user@proxy-server.com

# Kill proxy
ps aux | grep "ssh -D" | grep -v grep | awk '{print $2}' | xargs kill
```

### Proxychains Configuration
```bash
# Edit config
sudo nano /etc/proxychains4.conf

# Add proxy
socks5 127.0.0.1 8080

# Use with any tool
proxychains4 nmap target.com
proxychains4 nuclei -u https://target.com
```

### Tor Setup
```bash
# Start Tor
sudo service tor start

# Configure proxychains for Tor
echo "socks5 127.0.0.1 9050" >> /etc/proxychains4.conf

# Use with tools
proxychains4 curl https://check.torproject.org
```

## 📊 Output Management

### Result Organization
```bash
# Create project structure
mkdir -p recon/{subdomains,hosts,vulns,screenshots}

# Organize outputs
subfinder -d target.com -o recon/subdomains/subfinder.txt
httpx -l domains.txt -o recon/hosts/live.txt
nuclei -l hosts.txt -o recon/vulns/nuclei.txt
```

### Filtering Results
```bash
# Extract high/critical vulnerabilities
grep -E "critical|high" vulns.txt > critical_vulns.txt

# Get unique domains
cat *.txt | sort -u > all_domains.txt

# Extract IPs
grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" file.txt | sort -u
```

## 🔄 Tool Updates

```bash
# Update Go tools
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Update Nuclei templates
nuclei -update-templates

# Update Python tools
pip3 install --upgrade sqlmap dirsearch arjun

# Update all Go tools
cd ~/go/bin && go get -u all
```

## 🐛 Troubleshooting

### Common Issues and Fixes

```bash
# Tool not found
export PATH=$PATH:~/go/bin:~/tools
source ~/.bashrc

# Permission denied on scanning
sudo setcap cap_net_raw+ep $(which nmap)
sudo setcap cap_net_raw+ep $(which masscan)

# Proxy not working
# Check if proxy is running
netstat -tulpn | grep 8080
ps aux | grep ssh | grep 8080

# Nuclei templates missing
nuclei -update-templates
git clone https://github.com/projectdiscovery/nuclei-templates ~/.config/nuclei/templates

# Go modules issues
go clean -modcache
go mod tidy
```

## 🎮 Quick Tool Aliases

Add to `~/.bashrc` or `~/.zshrc`:

```bash
# Reconnaissance aliases
alias recon='subfinder -d'
alias quick-scan='subfinder -d $1 -silent | httpx -silent | nuclei -severity high,critical'
alias deep-scan='amass enum -d $1 | httpx -status-code -title | nuclei'

# Proxy aliases
alias proxy-on='export http_proxy=socks5://127.0.0.1:8080 && export https_proxy=socks5://127.0.0.1:8080'
alias proxy-off='unset http_proxy && unset https_proxy'
alias tor-on='sudo service tor start && export http_proxy=socks5://127.0.0.1:9050'

# Update aliases
alias update-tools='nuclei -update-templates && go get -u all'
alias update-wordlists='cd ~/wordlists && git pull'
```

## 📚 Additional Resources

- **SecLists**: https://github.com/danielmiessler/SecLists
- **Nuclei Templates**: https://github.com/projectdiscovery/nuclei-templates
- **Bug Bounty Wordlists**: https://github.com/fuzzdb-project/fuzzdb
- **OWASP Testing Guide**: https://owasp.org/www-project-web-security-testing-guide/

## 🚨 Legal Disclaimer

These tools are for authorized security testing only. Always ensure you have:
- Written permission to test the target
- Clear scope definition
- Proper authorization from system owners
- Understanding of applicable laws in your jurisdiction

**Never use these tools on systems you don't own or lack authorization to test.**