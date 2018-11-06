# shellcheck disable=SC2154
function PRINT_HELP_MSG {
	[[ -z "$command" ]] || echo -e "\e[1mCommand »\e[0m $command \e[1m« not found!\e[0m\n"
	echo -e "\e[1mUSAGE: \e[0m$0 <command> [arguments]"
	echo ""
	echo "       <command> can be one of:"
	for file in ./inc/*; do
		[[ -d "$file" ]] || continue
		echo -e "          * \e[1m${file/.\/inc\/}\e[0m"
		[[ -f "$file/help.txt" ]] || continue
		while read -r line; do
			echo -e "               $line"
		done <"$file/help.txt"
	done
}

if [ -z "$command" ] || [ ! -d "./inc/$command" ]; then
	PRINT_HELP_MSG
	[[ -z "$command" ]] || exit 1
fi
