#!/bin/sh

# check we have tput
if ! [ -x "$(command -v tput)" ]
then
	echo "no tput found"
	exit 1
fi

# fetch info
hostname="$(hostname)"
kernel="$(uname -r)"
uptime="$(uptime -p | sed 's/up //g')"
shell="${SHELL}"
WM="${DESKTOP_SESSION}"

# tput values
bold="$(tput bold)"
rev="$(tput rev)"
black="$(tput setaf 0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"
removeattr="$(tput sgr0)"

labels="${removeattr}${bold}${cyan}"
info="${removeattr}${bold}${white}"	

cat <<EOF

  ${labels}KERNEL    ${info}${kernel}${removeattr}
  ${labels}UPTIME    ${info}${uptime}${removeattr}

  ${rev}${black}  ${red}  ${green}  ${yellow}  ${blue}  ${magenta}  ${cyan}  ${white}  ${removeattr}

EOF
