function findsubs --description 'checksubs path-to/subs.txt path-to/output.txt' --argument-names input output 
  /opt/Whatweb/whatweb -a 3 -i $input --log-brief=$output && cat $input | httprobe | tee -a $output
end
