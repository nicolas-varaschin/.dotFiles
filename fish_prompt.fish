function fish_prompt
    set_color -o 4B7D14
    echo -n '['
    set_color normal 
    set_color C9B963 
    echo -n (basename (pwd))
    set_color -o 4B7D14
    echo -n ']'
    set_color -o 168FC9
    echo -n (whoami)
    set_color -o purple
    echo " ➜ "
end
function cdd
	cd $argv; and ls -al
end

function las
	command ls -al --color=auto
end

alias ls='las'
alias cat='scat'
export GIT_EDITOR="subl --wait"
