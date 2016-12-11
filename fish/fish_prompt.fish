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

