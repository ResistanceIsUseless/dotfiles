function nmapssl --description 'nmapssl port ip'
 nmap --script ssl-enum-ciphers -p $argv $argv1
end
