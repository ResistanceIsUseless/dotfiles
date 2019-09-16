function urlencode $argv
#command /opt/w3af/tools/urlencode -s '&%' -e '$1argv'
command hURL -U $argv
end

function urldecode $argv
command hURL -u $argv
end

function urlencodex2 $argv
command hURL -D $argv
end

function urldecodex2 $argv
command hURL -d $argv
end
