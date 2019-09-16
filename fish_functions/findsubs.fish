function findsubs --description 'findsubs domain.com path-to/output.txt' --argument-names domain output 
  amass enum -d $domain -o $output && assetfinder $domain | tee -a $output && subfinder -d $domain -o $output -w wordlist && aquatone-discover -d $domain;
end

#function findsubs --description 'findsubs domain.com path-to/output.txt path-to/wordlist' --argument-names domain output wordlist 
#  amass enum -d $domain -o $output -w wordlist && assetfinder $domain | tee -a $output && subfinder -d $domain -o $output && aquatone-discover -d $domain --wordlist $wordlist;
#end
