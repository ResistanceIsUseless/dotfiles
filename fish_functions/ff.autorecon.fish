function ff.waybackrobots --argument-names input 
    echo "python3 /home/static/Tools/Scripts/AutoRecon/autorecon.py $input"
    cd /home/static/Tools/Scripts/AutoRecon/
    python3 /home/static/Tools/Scripts/AutoRecon/autorecon.py $input
end
