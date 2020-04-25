function ff.dirsearch $argv
  echo "python3 /home/static/Tools/dirsearch/dirsearch.py -u $argv[1] -e asp,aspx,htm,html,jsp,php,pl,cgi --random-agents -x 500,501,503,404"
  python3 /home/static/Tools/dirsearch/dirsearch.py -u $argv[1] -e asp,aspx,htm,html,jsp,php,pl,cgi --random-agents -x 500,501,503,404
end
