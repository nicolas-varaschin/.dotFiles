# Fetch the Colors

CD="~/.config/lemonbar/frost"
BG="#1C1C23"
FG="#9BBBC6"

BLACK="#323246"
BBLACK="#323246"

RED="#FF7882"
BRED="#FF7800"

GREEN="#8C8CA0"
BGREEN="#8C8CA0"

YELLOW="#ffdf00"
BYELLOW="#ffdf00"

BLUE="#3C788C"
BBLUE="#3C788C"

MAGENTA="#6EA0B4"
BMAGENTA="#6EA0B4"

CYAN="#6E8CA0"
BCYAN="#6E8CA0"

WHITE="#96BEC8"
BWHITE="#96BEC8"


menu(){ # Useless for now ..
    hostname=`hostname | tr '[:lower:]' '[:upper:]'`
    echo "%{B$BBLUE}%{$bold} $hostname %{$normal} %{B-}"
}

 clock(){ # Clock, obv ..
  clock=`date "+%b %d %Y %I:%M:%S"`
    echo "${clock}"
}

 vol(){ # Volume, Sets to Headset when switched ..
  switch=`amixer get Master | awk '/Front Left:/ {print $6}'`
  vol=`amixer  get Master | awk '/Front Left:/ {print $5}' | tr -d '[],'`

  if [ "$switch" = "[on]" ]; then
    echo "%{F$BG}  ${vol} %{F-} "
  elif [ "$switch" = "[off]" ]; then
    echo "%{F$RED} MUTE %{F-}"
  fi
}
getip(){
  ip1=`ip a | grep inet | grep eth0| awk '{print $2}' | awk 'sub(/\/24/,"")'`
  echo "%{F$BBLACK}$ip1%{F-}"
}

getmem(){
  memvar=`python -c "import psutil;import numpy;print(round(numpy.array(psutil.virtual_memory().percent).mean(),1))"`
  echo " %{F$BBLACK}${memvar}%%{F-}"
}

getcpu(){
  cpuvar=`mpstat | awk '$12 ~ /[0-9.]+/ { print $4+$6+$7"%" }'`
  echo " %{F$BBLACK}${cpuvar} %{F-}"
}


net(){ # Connected or nah? ..
  ping=`ping 8.8.8.8 -c 1 | awk '/rtt/ {printf("%d\n",$4 + 0.5)}'`
  test -n "${ping}" && echo " %{F$BBLACK} ${ping}ms %{F-}" || echo "%{F$RED} No Connection %{F-}"
}
while :; do
    echo "$(menu)|%{B$BMAGENTA} CPU: $(getcpu) %{B-}|%{B$BCYAN} RAM: $(getmem) %{B-}| %{c} $(clock) %{r} |%{B$BBLUE} VOL: $(vol) %{B-}|%{B$BWHITE} IP:$(getip) %{B-}|%{B$BGREEN} PING:$(net) %{B-}"
    sleep 1
done | lemonbar -p -g 1000x20+460
