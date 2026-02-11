#!/bin/bash

# Claude Security Agents - Complete Tools Setup Script
# This script installs all required tools for security reconnaissance and testing
# Compatible with: macOS, Linux (Ubuntu/Debian), and Kali Linux

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        echo -e "${BLUE}[*] Detected macOS${NC}"
    elif [[ -f /etc/debian_version ]]; then
        OS="debian"
        echo -e "${BLUE}[*] Detected Debian/Ubuntu${NC}"
    elif [[ -f /etc/redhat-release ]]; then
        OS="redhat"
        echo -e "${BLUE}[*] Detected RedHat/CentOS${NC}"
    else
        OS="linux"
        echo -e "${BLUE}[*] Detected Generic Linux${NC}"
    fi
}

# Create tools directory
setup_directories() {
    echo -e "${GREEN}[+] Setting up directories...${NC}"
    mkdir -p ~/tools
    mkdir -p ~/wordlists
    mkdir -p ~/.config/nuclei
    mkdir -p ~/.config/amass
    mkdir -p ~/.proxychains
    cd ~/tools
}

# Install package managers and basics
install_basics() {
    echo -e "${GREEN}[+] Installing basic dependencies...${NC}"
    
    if [[ "$OS" == "macos" ]]; then
        # Install Homebrew if not present
        if ! command -v brew &> /dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew update
        brew install wget curl git python3 go rust nodejs npm jq
        brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
    elif [[ "$OS" == "debian" ]]; then
        sudo apt-get update
        sudo apt-get install -y wget curl git python3 python3-pip golang nodejs npm jq build-essential
        sudo apt-get install -y libssl-dev libffi-dev python3-dev
    fi
}

# Install Go tools
install_go_tools() {
    echo -e "${GREEN}[+] Installing Go-based security tools...${NC}"
    
    # Set up Go environment
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    
    # Core reconnaissance tools
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install -v github.com/projectdiscovery/katana/cmd/katana@latest
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
    go install -v github.com/resistanceisuseless/subscope/cmd/subscope@latest
    go install -v github.com/resistanceisuseless/webscope@latest
    go install -v github.com/ResistanceIsUseless/ProxyHawk/cmd/proxyhawk@latest
    
    # Asset discovery
    go install -v github.com/OWASP/Amass/v4/...@latest
    go install -v github.com/tomnomnom/assetfinder@latest
    go install -v github.com/tomnomnom/waybackurls@latest
    go install -v github.com/tomnomnom/gf@latest
    go install -v github.com/tomnomnom/anew@latest
    go install -v github.com/tomnomnom/fff@latest
    go install -v github.com/tomnomnom/gron@latest
    go install -v github.com/tomnomnom/meg@latest
    go install -v github.com/tomnomnom/httprobe@latest
    
    # Web scanning
    go install -v github.com/ffuf/ffuf/v2@latest
    go install -v github.com/OJ/gobuster/v3@latest
    go install -v github.com/jaeles-project/gospider@latest
    go install -v github.com/hakluke/hakrawler@latest
    go install -v github.com/lc/gau/v2/cmd/gau@latest
    go install -v github.com/s0md3v/smap/cmd/smap@latest
    
    # Additional tools
    go install -v github.com/d3mondev/puredns/v2@latest
    go install -v github.com/glebarez/cero@latest
    go install -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
}

# Install Python tools
install_python_tools() {
    echo -e "${GREEN}[+] Installing Python-based security tools...${NC}"
    
    # Upgrade pip
    python3 -m pip install --upgrade pip
    
    # Core tools
    pip3 install --user requests beautifulsoup4 lxml
    pip3 install --user sqlmap
    pip3 install --user dirsearch
    pip3 install --user arjun
    pip3 install --user wfuzz
    pip3 install --user impacket
    pip3 install --user crackmapexec
    pip3 install --user bloodhound
    pip3 install --user mitm6
    pip3 install --user responder
    pip3 install --user certipy-ad
    pip3 install --user shodan
    pip3 install --user censys
    
    # Additional reconnaissance
    pip3 install --user dnsgen
    pip3 install --user fierce
    pip3 install --user dnspython
    pip3 install --user netaddr
}

# Install Ruby tools
install_ruby_tools() {
    echo -e "${GREEN}[+] Installing Ruby-based tools...${NC}"
    
    if [[ "$OS" == "macos" ]]; then
        brew install ruby
    elif [[ "$OS" == "debian" ]]; then
        sudo apt-get install -y ruby-full
    fi
    
    # WPScan for WordPress scanning
    sudo gem install wpscan
    
    # Other useful gems
    sudo gem install aquatone
}

# Install Node.js tools
install_nodejs_tools() {
    echo -e "${GREEN}[+] Installing Node.js-based tools...${NC}"
    
    # Security tools
    npm install -g retire
    npm install -g npm-audit
    npm install -g snyk
    npm install -g localtunnel
}

# Install reconnaissance frameworks
install_recon_frameworks() {
    echo -e "${GREEN}[+] Installing reconnaissance frameworks...${NC}"
    
    cd ~/tools
    
    # Install ReconFTW
    git clone https://github.com/six2dez/reconftw.git
    cd reconftw
    ./install.sh
    cd ~/tools
    
    # Install LazyRecon
    git clone https://github.com/nahamsec/lazyrecon.git
    cd ~/tools
    
    # Install Osmedeus
    go install -v github.com/j3ssie/osmedeus@latest
}

# Install custom tools (subscope, webscope, etc.)
install_custom_tools() {
    echo -e "${GREEN}[+] Installing custom reconnaissance tools...${NC}"
    
    cd ~/tools
    
    # Create subscope wrapper
    cat > ~/tools/subscope << 'EOF'
#!/bin/bash
# Subscope - Rapid subdomain enumeration wrapper

TARGET=$1
OUTPUT_FILE=${2:-subdomains.txt}

echo "[*] Starting subdomain enumeration for $TARGET"

# Run multiple subdomain enumeration tools
subfinder -d $TARGET -silent | anew $OUTPUT_FILE
assetfinder --subs-only $TARGET | anew $OUTPUT_FILE
amass enum -passive -d $TARGET -norecursive | anew $OUTPUT_FILE
findomain -t $TARGET -q | anew $OUTPUT_FILE

# Sort and deduplicate
sort -u $OUTPUT_FILE -o $OUTPUT_FILE

echo "[+] Found $(wc -l < $OUTPUT_FILE) unique subdomains"
EOF
    chmod +x ~/tools/subscope
    
    # Create webscope wrapper
    cat > ~/tools/webscope << 'EOF'
#!/bin/bash
# Webscope - Live host identification wrapper

INPUT_FILE=$1
OUTPUT_FILE=${2:-live_hosts.txt}

echo "[*] Checking for live hosts..."

# Check for live hosts
cat $INPUT_FILE | httpx -silent -threads 100 -timeout 3 -o $OUTPUT_FILE

echo "[+] Found $(wc -l < $OUTPUT_FILE) live hosts"
EOF
    chmod +x ~/tools/webscope
}

# Install proxy and OPSEC tools
install_proxy_tools() {
    echo -e "${GREEN}[+] Installing proxy and OPSEC tools...${NC}"
    
    if [[ "$OS" == "macos" ]]; then
        brew install proxychains-ng tor
    elif [[ "$OS" == "debian" ]]; then
        sudo apt-get install -y proxychains4 tor
    fi
    
    # Configure proxychains
    cat > ~/.proxychains/proxychains.conf << 'EOF'
strict_chain
proxy_dns
tcp_read_time_out 15000
tcp_connect_time_out 8000

[ProxyList]
# Tor
socks5 127.0.0.1 9050
# SSH tunnel (when configured)
socks5 127.0.0.1 8080
EOF
}

# Install web application testing tools
install_webapp_tools() {
    echo -e "${GREEN}[+] Installing web application testing tools...${NC}"
    
    cd ~/tools
    
    # Burp Suite (manual download required)
    echo -e "${YELLOW}[!] Please download Burp Suite manually from: https://portswigger.net/burp${NC}"
    
    # OWASP ZAP
    if [[ "$OS" == "macos" ]]; then
        brew install --cask owasp-zap
    else
        wget https://github.com/zaproxy/zaproxy/releases/download/v2.14.0/ZAP_2.14.0_Linux.tar.gz
        tar -xvf ZAP_2.14.0_Linux.tar.gz
        rm ZAP_2.14.0_Linux.tar.gz
    fi
    
    # SQLMap is already installed via pip
    
    # XSStrike
    git clone https://github.com/s0md3v/XSStrike.git
    cd XSStrike
    pip3 install -r requirements.txt
    cd ~/tools
    
    # Nikto
    git clone https://github.com/sullo/nikto.git
}

# Install network scanning tools
install_network_tools() {
    echo -e "${GREEN}[+] Installing network scanning tools...${NC}"
    
    if [[ "$OS" == "macos" ]]; then
        brew install nmap masscan rustscan
        brew install netcat socat
        brew install arp-scan
    elif [[ "$OS" == "debian" ]]; then
        sudo apt-get install -y nmap masscan
        sudo apt-get install -y netcat socat
        sudo apt-get install -y arp-scan
        
        # Install RustScan
        wget https://github.com/RustScan/RustScan/releases/download/2.1.1/rustscan_2.1.1_amd64.deb
        sudo dpkg -i rustscan_2.1.1_amd64.deb
        rm rustscan_2.1.1_amd64.deb
    fi
}

# Install exploitation frameworks
install_exploit_tools() {
    echo -e "${GREEN}[+] Installing exploitation frameworks...${NC}"
    
    cd ~/tools
    
    # Metasploit
    if [[ "$OS" == "macos" ]]; then
        brew install metasploit
    elif [[ "$OS" == "debian" ]]; then
        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
        chmod 755 msfinstall
        ./msfinstall
        rm msfinstall
    fi
    
    # SearchSploit
    git clone https://github.com/offensive-security/exploitdb.git
    ln -sf ~/tools/exploitdb/searchsploit /usr/local/bin/searchsploit
}

# Download wordlists
install_wordlists() {
    echo -e "${GREEN}[+] Downloading wordlists...${NC}"
    
    cd ~/wordlists
    
    # SecLists
    git clone https://github.com/danielmiessler/SecLists.git
    
    # Common wordlists
    wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-5000.txt
    wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt
    wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100000.txt
}

# Update Nuclei templates
update_nuclei_templates() {
    echo -e "${GREEN}[+] Updating Nuclei templates...${NC}"
    nuclei -update-templates
    
    # Install custom templates
    cd ~/.config/nuclei/templates
    git clone https://github.com/projectdiscovery/nuclei-templates.git
    git clone https://github.com/geeknik/the-nuclei-templates.git
}

# Configure environment
configure_environment() {
    echo -e "${GREEN}[+] Configuring environment...${NC}"
    
    # Add tools to PATH
    echo 'export PATH=$PATH:~/tools:~/go/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:~/tools:~/go/bin' >> ~/.zshrc
    
    # Create aliases
    cat >> ~/.bashrc << 'EOF'

# Security tool aliases
alias recon='cd ~/tools && ./subscope'
alias nuclei-scan='nuclei -t ~/.config/nuclei/templates/ -severity critical,high,medium'
alias proxy-on='export http_proxy=socks5://127.0.0.1:8080 && export https_proxy=socks5://127.0.0.1:8080'
alias proxy-off='unset http_proxy && unset https_proxy'
EOF
    
    if [[ -f ~/.zshrc ]]; then
        cat >> ~/.zshrc << 'EOF'

# Security tool aliases
alias recon='cd ~/tools && ./subscope'
alias nuclei-scan='nuclei -t ~/.config/nuclei/templates/ -severity critical,high,medium'
alias proxy-on='export http_proxy=socks5://127.0.0.1:8080 && export https_proxy=socks5://127.0.0.1:8080'
alias proxy-off='unset http_proxy && unset https_proxy'
EOF
    fi
}

# Verify installation
verify_installation() {
    echo -e "${GREEN}[+] Verifying tool installation...${NC}"
    
    tools=(
        "subfinder"
        "nuclei"
        "httpx"
        "ffuf"
        "amass"
        "nmap"
        "sqlmap"
        "gobuster"
    )
    
    for tool in "${tools[@]}"; do
        if command -v $tool &> /dev/null; then
            echo -e "${GREEN}✓ $tool installed${NC}"
        else
            echo -e "${RED}✗ $tool not found${NC}"
        fi
    done
}

# Main installation flow
main() {
    echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}   Claude Security Agents - Tools Installation${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
    echo ""
    
    detect_os
    setup_directories
    install_basics
    install_go_tools
    install_python_tools
    install_ruby_tools
    install_nodejs_tools
    install_recon_frameworks
    install_custom_tools
    install_proxy_tools
    install_webapp_tools
    install_network_tools
    install_exploit_tools
    install_wordlists
    update_nuclei_templates
    configure_environment
    verify_installation
    
    echo ""
    echo -e "${GREEN}[+] Installation complete!${NC}"
    echo -e "${YELLOW}[!] Please restart your terminal or run: source ~/.bashrc${NC}"
    echo -e "${YELLOW}[!] Some tools may require additional manual setup${NC}"
}

# Run main function
main