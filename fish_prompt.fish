function fish_prompt
    set_color -o red
    echo -n "("
    echo -n (python -c "import psutil;import numpy;print(round(numpy.array(psutil.virtual_memory().percent).mean(),1))")
    echo -n "%)"
    set_color -o 4B7D14
    echo -n '['
    set_color normal
    set_color C9B963
    echo -n (basename (pwd))
    set_color -o 4B7D14
    echo -n ']'
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
      echo -n '('
      echo -n (git rev-parse --abbrev-ref HEAD)
      echo -n ')'
    end
    set_color -o 168FC9
    echo -n (whoami)
    set_color -o purple
    echo " ➜ "
end
function cd
	builtin cd $argv; and ls -al
end

function ls
	command ls -al --color=auto $argv
end


export GIT_EDITOR="subl --wait"

function man
    env \
        LESS_TERMCAP_mb=(printf "\e[1;31m") \
        LESS_TERMCAP_md=(printf "\e[1;31m") \
        LESS_TERMCAP_me=(printf "\e[0m") \
        LESS_TERMCAP_se=(printf "\e[0m") \
        LESS_TERMCAP_so=(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=(printf "\e[0m") \
        LESS_TERMCAP_us=(printf "\e[1;32m") \
            man $argv
end
