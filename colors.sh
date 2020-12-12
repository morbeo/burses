_black="\e[30m"
_red="\e[31m"
_green="\e[32m"
_yellow="\e[33m"
_blue="\e[34m"
_magenta="\e[35m"
_cyan="\e[36m"
_white="\e[37m"
_bblack='\e[30;1m'
_bred='\e[31;1m'
_bgreen='\e[32;1m'
_byellow='\e[33;1m'
_bblue='\e[34;1m'
_bmagenta='\e[35;1m'
_bcyan='\e[36;1m'
_bwhite='\e[37;1m'
_reset="\e[0m"

_bg_black='\e[40m'
_bg_red='\e[41m'
_bg_green='\e[42m'
_bg_yellow='\e[43m'
_bg_blue='\e[44m'
_bg_magenta='\e[45m'
_bg_cyan='\e[46m'
_bg_white='\e[47m'

_bg_bblack='\e[40;1m'
_bg_bred='\e[41;1m'
_bg_bgreen='\e[42;1m'
_bg_byellow='\e[43;1m'
_bg_bblue='\e[44;1m'
_bg_bmagenta='\e[45;1m'
_bg_bcyan='\e[46;1m'
_bg_bwhite='\e[47;1m'

_bold='\e[1m'
_underline='\e[4m'
_reversed='\e[7m'

_fg_colors=(${_reset} ${black} ${red} ${green} ${yellow} ${blue} ${magenta} ${cyan} ${white} ${bblack} ${bred} ${bgreen} ${byellow} ${bblue} ${bmagenta} ${bcyan} ${bwhite})
_bg_colors=(${_reset} ${_bg_black} ${_bg_red} ${_bg_green} ${_bg_yellow} ${_bg_blue} ${_bg_magenta} ${_bg_cyan} ${_bg_white} ${_bg_bblack} ${_bg_bred} ${_bg_bgreen} ${_bg_byellow} ${_bg_bblue} ${_bg_bmagenta} ${_bg_bcyan} ${_bg_bwhite}) 
_c=(${_colors[@]})
_bc=(${_bg_colors[@]})