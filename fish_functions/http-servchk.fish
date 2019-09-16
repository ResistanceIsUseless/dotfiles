function findsubs --description 'http-servck path-to/input.txt path-to/output.txt' --argument-names input output 
  sudo nmap -sSV -Pn -T5 -p 80,443,808,1080,3128,4180,4443,4480,5490,7443,8000-8088,8443 -iL testbs.txt $input -oG $output
end
