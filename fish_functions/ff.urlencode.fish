function ff.urlencode $argv
#command /opt/w3af/tools/urlencode -s '&%' -e '$1argv'
command hURL -U $argv
end

function ff.urldecode $argv
command hURL -u $argv
end

function ff.urlencodex2 $argv
command hURL -D $argv
end

function ff.urldecodex2 $argv
command hURL -d $argv
end
