---
name: ssh-config-examples
description: Examples and templates for SSH connection string configurations in reconnaissance workflows
allowed-tools: Read
argument-hint: ""
---

# SSH Connection String Examples for Security Assessment Commands

This document provides comprehensive examples for using SSH connection strings with security assessment commands to enhance operational security.

## Basic SSH Connection Formats

### Standard Connection Strings
```bash
# Basic format with default port (22)
/quick-recon target.com --ssh-connection "user@proxy.example.com"

# Explicit port specification
/deep-recon target.com --ssh-connection "user@proxy.example.com:2222"

# Using different username
/auto-recon target.com --ssh-connection "recon-user@vpn-exit.company.com:443"
```

### SSH Config Integration
```bash
# Using SSH config alias (defined in ~/.ssh/config)
/setup-proxy-chain --ssh-connection "recon-proxy"

# Where ~/.ssh/config contains:
# Host recon-proxy
#   HostName proxy.example.com
#   Port 2222
#   User recon-user
#   IdentityFile ~/.ssh/recon-key
#   ServerAliveInterval 60
```

## Advanced OPSEC Configurations

### Multi-Hop SSH Tunnels
```bash
# Jump host configuration
/stealth-mode --ssh-connection "user@jump.example.com"

# With SSH config for jump hosts:
# Host final-proxy
#   HostName final-proxy.internal
#   User recon-user
#   ProxyJump jump.example.com:2222
#   IdentityFile ~/.ssh/recon-key
```

### Geographic Distribution
```bash
# European exit point
/quick-recon target.com --ssh-connection "user@eu-proxy.example.com"

# Asian exit point
/deep-recon target.com --ssh-connection "user@asia-proxy.example.com:8022"

# US-based proxy for domestic targets
/auto-recon target.com --ssh-connection "user@us-proxy.example.com"
```

## Command-Specific Examples

### Reconnaissance Commands
```bash
# Quick reconnaissance with SSH proxy
/quick-recon example.com --ssh-connection "recon@proxy1.vpn.com:2222"

# Deep reconnaissance with stealth SSH configuration
/deep-recon example.com --stealth --ssh-connection "user@stealth.proxy.com"

# Automated reconnaissance with high-anonymity proxy
/auto-recon example.com --ssh-connection "anon-user@high-anonymity.proxy.com:443"
```

### OPSEC Setup Commands
```bash
# Proxy chain with custom SSH server
/setup-proxy-chain --layers tor,ssh,vpn --ssh-connection "user@proxy.company.com:8022"

# Stealth mode with geographic SSH exit
/stealth-mode --intensity maximum --ssh-connection "user@exit-node.example.org"

# CDN bypass with specialized proxy
/cdn-bypass target.com --ssh-connection "bypass-user@cdn-bypass.proxy.com:9022"
```

### Security Testing Commands
```bash
# Vulnerability scanning with SSH proxy
/vulnerability-scan targets.txt --ssh-connection "scanner@scan-proxy.com:2222"

# Web application testing with anonymization
/web-app-test https://target.com --ssh-connection "webapp-user@web-proxy.com"

# Code review with secure connection
/code-security-review repo.git --ssh-connection "code-user@secure-proxy.com:443"
```

## SSH Configuration Best Practices

### SSH Client Configuration (~/.ssh/config)
```
# Reconnaissance proxy configuration
Host recon-proxy-1
    HostName proxy1.example.com
    Port 2222
    User recon-user
    IdentityFile ~/.ssh/recon-key-1
    ServerAliveInterval 60
    ServerAliveCountMax 3
    TCPKeepAlive yes
    Compression yes

Host recon-proxy-2
    HostName proxy2.example.com
    Port 8022
    User anon-user
    IdentityFile ~/.ssh/recon-key-2
    ServerAliveInterval 30
    ProxyJump recon-proxy-1

# High-anonymity multi-hop configuration
Host final-exit
    HostName exit.proxy.com
    User final-user
    IdentityFile ~/.ssh/final-key
    ProxyJump recon-proxy-1,recon-proxy-2
```

### Key Management
```bash
# Generate reconnaissance-specific SSH keys
ssh-keygen -t ed25519 -f ~/.ssh/recon-key-1 -C "recon-user@assessment"
ssh-keygen -t rsa -b 4096 -f ~/.ssh/recon-key-2 -C "anon-user@proxy"

# Set appropriate permissions
chmod 600 ~/.ssh/recon-key-*
chmod 644 ~/.ssh/recon-key-*.pub
```

## Workflow Integration Examples

### Bug Bounty Assessment Workflow
```bash
# Phase 1: Initial discovery with SSH proxy
/quick-recon target.com --ssh-connection "bounty@proxy-eu.com:2222"

# Phase 2: Deep analysis with different exit point
/deep-recon target.com --aggressive --ssh-connection "bounty@proxy-us.com:8022"

# Phase 3: Automated handoff with shared configuration
/auto-recon target.com --ssh-connection "bounty@proxy-asia.com:443"
```

### Red Team Operation
```bash
# Setup advanced proxy infrastructure
/setup-proxy-chain --layers tor,ssh,vpn --ssh-connection "redteam@op-proxy.internal:9022"

# Execute reconnaissance with maximum stealth
/stealth-mode --intensity maximum --ssh-connection "redteam@stealth-exit.internal"

# Launch automated assessment
/auto-recon target.internal --ssh-connection "redteam@final-proxy.internal:2222"
```

### Penetration Testing Engagement
```bash
# Client-approved proxy configuration
/setup-proxy-chain --ssh-connection "pentest@client-approved-proxy.com:2222"

# Comprehensive assessment with approved infrastructure
/auto-recon client-target.com --ssh-connection "pentest@client-approved-proxy.com:2222"

# Generate report with proxy usage documentation
/generate-report assessment-data --format technical --ssh-connection "pentest@client-approved-proxy.com:2222"
```

## Dynamic SSH Configuration

### Runtime SSH Configuration
```bash
# Environment variable support
export RECON_SSH_CONNECTION="user@proxy.example.com:2222"
/quick-recon target.com --ssh-connection "$RECON_SSH_CONNECTION"

# Configuration file support
echo "user@proxy.example.com:2222" > ~/.claude/ssh-connection.conf
/deep-recon target.com --ssh-connection "$(cat ~/.claude/ssh-connection.conf)"
```

### Conditional SSH Usage
```bash
# Use SSH proxy only for external targets
if [[ "$TARGET" =~ \.(com|org|net)$ ]]; then
    SSH_OPT="--ssh-connection user@external-proxy.com:2222"
else
    SSH_OPT=""
fi

/auto-recon "$TARGET" $SSH_OPT
```

## Troubleshooting SSH Connections

### Connection Testing
```bash
# Test SSH connection before using in commands
ssh -T user@proxy.example.com -p 2222 "echo 'SSH connection successful'"

# Test dynamic port forwarding
ssh -D 8080 -f -N user@proxy.example.com -p 2222
curl --socks5 127.0.0.1:8080 https://httpbin.org/ip
```

### Common Issues and Solutions
```bash
# Permission denied - check key permissions
chmod 600 ~/.ssh/recon-key
ssh-add ~/.ssh/recon-key

# Connection timeout - verify proxy server and port
telnet proxy.example.com 2222

# Authentication failure - verify username and key
ssh -v user@proxy.example.com -p 2222 -i ~/.ssh/recon-key
```

## Security Considerations

### SSH Key Security
- Use Ed25519 keys for better security and performance
- Implement key rotation policies for long-term engagements
- Store keys in secure locations with proper permissions
- Use SSH agent forwarding cautiously in untrusted environments

### Proxy Server Security
- Verify proxy server ownership and security posture
- Use only approved proxy infrastructure for client engagements
- Implement logging and monitoring of proxy usage
- Maintain operational security throughout assessment lifecycle

### Legal and Compliance
- Ensure SSH proxy usage complies with engagement scope
- Document all proxy infrastructure used in assessments
- Maintain audit trails of SSH connections and activities
- Follow responsible disclosure practices for any proxy-related findings

This configuration enables enhanced operational security while maintaining flexibility and performance in security assessment workflows.