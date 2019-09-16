function gobuster $argv
  echo "dir -w /opt/Wordlists/danielmiessler/Discovery/Web-Content/raft-large-words.txt -s 200,300,307 -t 100 -b 2019 --wildcard -u $argv[1]"
  dir -w /opt/Wordlists/danielmiessler/Discovery/Web-Content/raft-large-words.txt -s 200,300,307 -t 100 -b 2019 --wildcard -u $argv[1]
end
