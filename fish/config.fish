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


export GIT_EDITOR="subl --wait"

