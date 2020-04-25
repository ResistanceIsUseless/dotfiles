function ff.whatweb --argument-names input output
     echo "whatweb -a 3 -i $input --log-brief=$output"
     whatweb -a 3 -i $input --log-brief=$output
end
