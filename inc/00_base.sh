function LOGIT {
	printf "\n\n\e[1;35m%*s \e[0;37m_%s_\e[1;35m===\e[0m" "$((${COLUMNS:-$(tput cols)}-14))" "" "$(date +%H:%M:%S)" | tr " " "=" | tr "_" " "
	printf "\r\e[1;35m===\e[1;37m %s \n\e[0m\n" "$@"
	printf "\n\n=== %s === %s\n\n" "$(date +%H:%M:%S)" "$@" >&3
}
function WRITE_TO_FILE {
	file_name="$1"
	echo "=== Write to File $file_name ===" >&3
	shift
	echo "$@" | tee -a "$file_name" >&3
}
function RUN_FG {
	echo "=== Execute $* ===" >&3
	printf "\e[1;37m%*s" "${COLUMNS:-$(tput cols)}" "" | tr " " "-"
	echo -e "\r- \e[1;32m$ \e[0;33m$* "
	"$@"
	ret=$?
	printf "\e[1;37m%*s" "${COLUMNS:-$(tput cols)}" "" | tr " " "-"
	echo -e "\r- \e[1;33m → →  $ret  ← ←  \e[0m\n"
}
function RUN_BG {
	echo "=== Execute in background $* ===" >&3
	if [ "$1" = "-i" ]; then
		ignore_err="1"; shift
	else
		ignore_err="0"
	fi
	echo -en "\e[1;37m [\e[0;33m....\e[1;37m]  Run »\e[0;33m $* \e[1;37m« in background...\e[0m"
	if "$@" 2>&3 >&3; then
		echo -e "\r\e[1;37m [\e[1;32mOKAY\e[1;37m]\e[0m"
	else
		echo -e "\r\e[1;37m [\e[1;31mFAIL\e[1;37m]\e[0m"
		if [ "$ignore_err" = "1" ]; then
			return 1
		else
			exit 1
		fi
	fi
}
