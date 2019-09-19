function ipinfo --argument-names ip
     eval command curl http://ipinfo.io/$ip
end

function whatsmyip 
    eval command curl ifconfig.me/ip
end 

function whatsmyip-detailed
    eval command echo "curl ifconfig.me/all"
    eval command curl ifconfig.me/all
end
