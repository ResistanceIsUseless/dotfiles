function dirsearch $argv
  echo "python3 /opt/dirsearch/dirsearch.py -u $argv[1] -e asp,aspx,htm,html,jsp,php,pl,cgi --random-agents -x 500,501,503,404"
  python3 /opt/dirsearch/dirsearch.py -u $argv[1] -e asp,aspx,htm,html,jsp,php,pl,cgi --random-agents -x 500,501,503,404
end
