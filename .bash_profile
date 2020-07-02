#Credit nahamsec, randomrobbie, venom26
hgrip(){ 
history | grep $1
}



#----- misc -----

ipinfo(){
curl http://ipinfo.io/$1
}

myip(){
curl ifconfig.me/ip
curl canhazipip.com
)

certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s "https://crt.sh/?q=%.$host1"  | awk '{gsub("<[^>]*>", "")}1' | grep $host1
}

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

certbrute(){
cat $1.txt | while read line; do python3 dirsearch.py -e . -u "https://$line"; done
}

#------ Tools ------

dirsearch(){
python3 ~/tools/dirsearch/dirsearch.py -e . -u $1 -e asp,aspx,htm,html,jsp,php,pl,cgi --random-agents -x 500,501,503,404
}

#subdomain finder
findsubs(){
amass enum -d $1 -o $2 && assetfinder $1 | tee -a $1 && subfinder -d $1 -o $2 -w wordlist && aquatone-discover -d $1;
}

#directory bruteforce
gobuster(){
gobuster dir -w /usr/local/share/Wordlists/danielmiessler/Discovery/Web-Content/raft-large-words.txt -s 200,300,307 -t 100 -b 2019 --wildcard -u $1
}

#sqlmap
sqlmap(){
sqlmap -u $1 
}

acstis(){
acstis -c -vp -iic -vrl $1.log -d "$1"
}

#nmap http service check
nmap_httpsrv_check(){
nmap -sT -Pn -T5 -p 80,443,808,1080,3128,4180,4443,4480,5490,7443,8000-8088,8443 -iL $1 -oG $2
}

#knockpy subdomain check
knock(){
cd ~/tools/knock/knockpy
python knockpy.py -w list.txt $1
}

#check http services with whatweb and httprobe
#not sure why i added httprobe
check_http_services(){
whatweb -a 3 -i $1 --log-brief=$2 && cat $1 | httprobe | tee -a $2
}

#netcat
ncx(){
nc -l -n -vv -p $1 -k
}

#Aquatone and Gowitness 
alias reconme='function frecon()
{
         mkdir $1
         $HOME/./gowitness --chrome-path=/usr/bin/google-chrome file --source=$HOME/aquatone/$1/urls.txt -d $1/ -$
         $HOME/./gowitness --chrome-path=/usr/bin/google-chrome -D /var/www/html/recon/$1/.gowitness-$1.db gene$
         mv report.html $1/report-$1.html
         sed -i -e 's%var\/www\/html\/%%g' $1/report-$1.html
         chown -R www-data:www-data /var/www/html/recon
         touch /var/www/html/recon/$1/index.html
}
function reconme()
{
       cd /var/www/html/recon
       if [ -f $HOME/aquatone/$1/urls.txt ]; then
          frecon $1
       else
         aquatone-discover -d $1 --threads 50 && aquatone-scan --threads 50 --ports huge -d $1
         frecon $1
       fi
};reconme'


#----- AWS -------

s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1 
}
s3_upload(){
echo "[*] Now Checking for Open S3 Buckets to upload POC to....[*]"

aws s3 cp poc.txt s3://$1 --acl public-read >/dev/null 2>/dev/null


RESULT=$?
if [ $RESULT -eq 0 ]; then
	echo "[*] POC Uploaded to https://$1.s3.amazonaws.com/poc.txt [*]"
	echo "[*] POC Uploaded to https://$l.s3.amazonaws.com/poc.txt [*]" >> /home/tools/mass-bounty/s3-results/$1-uploads.txt
else
	echo "[*] Failed to upload to bucket: $1 [*]"
}


s3_list(){  
  echo "[*] Now Checking for Open S3 Buckets for listing dirs....[*]"


aws s3 ls s3://$1 --acl public-read >/dev/null 2>/dev/null

	
RESULT=$?
if [ $RESULT -eq 0 ]; then
	echo "[*] Bucket has Dirlistings Enabled [*]"
	echo "[*] Bucket has Dirlistings Enabled https://$1.s3.amazonaws.com [*]" >> /home/tools/mass-bounty/s3-results/$1-dirlistings.txt
else
	echo "[*] Failed to list to bucket: $1 [*]"
fi
}

fd(){
findomain -t $1
}

fuf(){
ffuf -u $1/FUZZ -w ~/tools/dirsearch/db/dicc.txt -mc 200,301,302 -t 50
}

fufapi(){
ffuf -u $1/FUZZ -w ~/tools/dirsearch/db/apiwords.txt -mc 200 -t 50
}

arjun(){
cd ~/tools/Arjun
python3 arjun.py -u $1
cd -
}

ipinfo(){
curl ipinfo.io/$1
}

mscan(){
sudo /home/ubuntu/tools/masscan/bin/masscan -p80,443,8020,50070,50470,19890,19888,8088,8090,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,10000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,7447,7080,8880,8983,5673,7443,19000,19080 --rate=100000 --open -iL $1 --banners -oG famous_ports.txt
}

mscanall(){
sudo /home/ubuntu/tools/masscan/bin/masscan -p0-65535 --rate=100000 --open -iL $1 --banners -oG all_ports.txt
}

crawl(){
echo $1 | hakrawler -depth 3 -plain
}

dirsearch(){
cd ~/tools/dirsearch
sudo python3 dirsearch.py -u $1 -e htm,html,xml,js,json,zip,asp,aspx,php,bak,sql,old,txt,gz,gz.tar -x 301,404,400,429 -t 200
cd -
}

dirapi(){
cd ~/tools/dirsearch
sudo python3 dirsearch.py -u $1 -e htm,html,xml,js,json,zip,asp,aspx,php,bak,sql,old,txt,gz,gz.tar -x 301,429,404,400 -t 200 -w db/apiwords.txt
cd -
}
fuffiles(){
ffuf -u $1/FUZZ -w ~/tools/dirsearch/db/raft-large-files.txt -mc 200,301,302 -t 50
}

fufdir(){
ffuf -u $1/FUZZ -w ~/tools/dirsearch/db/raft-large-directories.txt -mc 200,301,302,403 -t 70
}

dirsearch(){
cd ~/tools/dirsearch
sudo python3 dirsearch.py -u $1 -e htm,html,xml,js,json,zip,asp,aspx,php,bak,sql,old,txt,gz,gz.tar -x 301,502,404,400,429 -t 200
cd -
}

digit(){
dig @8.8.8.8 $1 CNAME
}

wordlist(){
cd ~/tools/dirsearch/db
}
