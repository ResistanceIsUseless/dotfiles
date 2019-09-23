function crtsh --description 'search cert.sh for subdomains' --argument-names host1 
    command curl -s "https://crt.sh/?q=%.$host1"  | awk '{gsub("<[^>]*>", "")}1' | grep $host1
end

