function ff.checksubs --description 'check subdomains for content and info' --argument-names input output 
  whatweb -a 3 -i $input --log-brief=$output && cat $input | httprobe | tee -a $output
end
