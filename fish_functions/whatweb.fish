function f_whatweb --argument-names input output
     echo "whatweb -a 3 -i $input --log-brief=$output"
     f_whatweb -a 3 -i $input --log-brief=$output
end
