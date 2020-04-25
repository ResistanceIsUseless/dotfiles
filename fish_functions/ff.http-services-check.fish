function ff.http-services-check --description 'nmap http-services-check path-to/input.txt path-to/output.txt' --argument-names input output 
   nmap -sT -Pn -T5 -p 80,443,808,1080,3128,4180,4443,4480,5490,7443,8000-8088,8443 -iL $input -oG $output
end

function ff.http-servchk --description 'http-servck host.domain path-to/output.txt' --argument-names input output
     nmap -sT -Pn -T5 -p 80,443,808,1080,3128,4180,4443,4480,5490,7443,8000-8088,8443 $input -oG $output
end
