function whatweb --argument-names input output
     echo "/opt/Whatweb/whatweb -a 3 -i $input --log-brief=$output"
     /opt/Whatweb/whatweb -a 3 -i $input --log-brief=$output
end
