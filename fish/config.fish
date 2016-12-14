function cd
    builtin cd $argv; and ls
end

function ls
	lsicons.py -l $argv
end

function vim
    if count $argv > /dev/null
        gvim  -S ~/Session.vim --remote-silent  $argv
    else

        gvim  -S ~/Session.vim 
    end
end

function jss
    cd /home/nvaraschin/dev/sigehos-dev-environment/sources/sigehos-js
end

function dj
    cd /home/nvaraschin/dev/sigehos-dev-environment/sources/sigehos-django
end

function dev
    cd /home/nvaraschin/dev/sigehos-dev-environment/
end

function web
    dev;./sigehos.py -e web
end

function front
    dev;./sigehos.py -e front
end

function token
    http POST http://127.0.0.1/oauth2/access_token/ Content-Type:application/x-www-form-urlencoded \
    grant_type=password client_id=2c947d53e5a857e1805f \
    client_secret=6b46cb5fe78a9d811e8b2b93b95d2562d3a4fc40 \
    username=ypereyra@buenosaires.gob.ar password=pocoyo10 --form | awk '{print $2}' | cut -d '"' -f2
end

export GIT_EDITOR="vim"

