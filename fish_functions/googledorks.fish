#!/bin/bash
# GoogD0rker v0.1
# ZephrFish
#
# Google D0rker - Multiple Search Terms for OSINT on a Domain
# Based on Goohak(https://github.com/1N3/Goohak), however adopted for OSX & Tweaked
# Designed for OSX

function googledorks
    echo "Designed for OSX"

    open 2> /dev/null &
    sleep 5

    # Google Dorks
    echo "Opening Browser with search terms per tab"

    # FIND LOGIN PAGES:
    open "https://www.google.com/search?q=site:$argv+username+OR+password+OR+login+OR+root+OR+admin" --args --incognito 2> /dev/null
    open "https://www.google.com/search?q=site:$argv+inurl:login" --args --incognito 2> /dev/null
    # SEARCH FOR BACKDOORS:
    open "https://www.google.com/search?q=site:$argv+inurl:shell+OR+inurl:backdoor+OR+inurl:wso+OR+inurl:cmd+OR+shadow+OR+passwd+OR+boot.ini+OR+inurl:backdoor" --args --incognito 2> /dev/null
    # FIND SETUP OR INSTALL FILES:
    open "https://www.google.com/search?q=site:$argv+inurl:readme+OR+inurl:license+OR+inurl:install+OR+inurl:setup+OR+inurl:config" --args --incognito 2> /dev/null
    # FIND WORDPRESS PLUGINS/UPLOADS/DOWNLOADS:
    open "https://www.google.com/search?q=site:$argv+inurl:wp-+OR+inurl:plugin+OR+inurl:upload+OR+inurl:download" --args --incognito 2> /dev/null
    # FIND OPEN REDIRECTS:
    open "https://www.google.com/search?q=site:$argv+inurl:redir+OR+inurl:url+OR+inurl:redirect+OR+inurl:return+OR+inurl:src=http+OR+inurl:r=http" --args --incognito 2> /dev/null
    # FIND FILES BY EXTENSION:
    open "https://www.google.com/search?q=site:$argv+ext:cgi+OR+ext:php+OR+ext:asp+OR+ext:aspx+OR+ext:jsp+OR+ext:jspx+OR+ext:swf+OR+ext:fla+OR+ext:xml" --args --incognito 2> /dev/null
    # FIND DOCUMENTS BY EXTENSION:
    open "https://www.google.com/search?q=site:$argv+ext:doc+OR+ext:docx+OR+ext:csv+OR+ext:pdf+OR+ext:txt+OR+ext:log+OR+ext:bak" --args --incognito 2> /dev/null
    # FIND APACHE STRUTS RCE's:
    open "https://www.google.com/search?q=site:$argv+ext:action+OR+ext:struts+OR+ext:do" --args --incognito 2> /dev/null
    # FIND PASTEBIN POSTS FOR DOMAIN:
    open "https://www.google.com/search?q=site:pastebin.com+$argv" --args --incognito 2> /dev/null
    # FIND EMPLOYEES ON LINKEDIN:
    open "https://www.google.com/search?q=site:linkedin.com+employees+$argv" --args --incognito 2> /dev/null
    # FIND Subdomains
    open "https://www.google.com/search?q=site:*.$argv+-site:www.$argv" --args --incognito 2> /dev/null
    # FIND Sub-subdomains
    open "https://www.google.com/search?q=site:*.*.$argv+-site:www.$argv" --args --incognito 2> /dev/null
    # FIND PHPINFO Files
    open "https://www.google.com/search?q=inurl:'/phpinfo.php'+$argv" --args --incognito 2> /dev/null
    # FIND .htaccess & sensitive fields
    open "https://www.google.com/search?q=inurl:'/phpinfo.php'+OR+inurl:'.htaccess'+OR+inurl:'/.git'+$argv+-github" --args --incognito 2> /dev/null
    #FIND Documents
    open "https://www.google.com/search?q=site:$argv++ext%3Axml+|+ext%3Aconf+|+ext%3Acnf+|+ext%3Areg+|+ext%3Ainf+|+ext%3Ardp+|+ext%3Acfg+|+ext%3Atxt+|+ext%3Aora+|+ext%3Aini" --args --incognito 2> /dev/null
    #FIND PHP Pages
    open "https://www.google.com/search?q=site:$argv+ext%3Aphp" --args --incognito 2> /dev/null
    #FIND Database Info
    open "https://www.google.com/search?q=site:$argv+intext%3A"sql+syntax+near"+|+intext%3A"syntax+error+has+occurred"+|+intext%3A"incorrect+syntax+near"+|+intext%3A"unexpected+end+of+SQL+command"+|+intext%3A"Warning%3A+mysql_connect()"+|+intext%3A"Warning%3A+mysql_query()"+|+intext%3A"Warning%3A+pg_connect()"" --args --incognito 2> /dev/null
    #FIND Robots
    open "https://www.google.com/search?q=site:$argv+inurl%3Arobots" --args --incognito 2> /dev/null
    #FIND Database Files
    open "https://www.google.com/search?q=site:$argv++ext%3Abkf+|+ext%3Abkp+|+ext%3Abak+|+ext%3Aold+|+ext%3Abackup" --args --incognito 2> /dev/null
    #FIND Development pages
    open "https://www.google.com/search?q=site:$argv+inurl:dev|inurl:staging|inurl:uat|inurl:preprod|inurl:stg|inurl:qa|inurl:staging" --args --incognito 2> /dev/null
    #FIND Log Files
    open "https://www.google.com/search?q=site:$argv+ext:log" --args --incognito 2> /dev/null
    #FIND cgi
    open "https://www.google.com/search?q=site:$argv+inurl:cgi-bin+|+ext:pl+OR+ext:pl+OR+inurl:cgi-bin" --args --incognito 2> /dev/null
    #FIND Apache Pages
    open "https://www.google.com/search?q=site:$argv+/server-status intext:"Apache server status for"" --args --incognito 2> /dev/null
    open "https://www.google.com/search?q=site:$argv+inurl:"server-status"+"Server+Version:+Apache/"+"Server+Built:+"+"Server+uptime:"+"Total+accesses"+"CPU+Usage:"" --args --incognito 2> /dev/null
    open "https://www.google.com/search?q=site:$argv+intitle:apache+couchdb+-+futon:+overview inurl:/_utils" --args --incognito 2> /dev/null

end
