LOGIT "Generate Project"

function PROJECT_NAME {
	if [ -z "$1" ]; then
		echo -en "\n\e[1;75mPlease enter a name for the new Project: \e[0m"
		read -r project
		export PROJECT_NAME="$project"
	else
		export PROJECT_NAME="$1"
	fi
}

function GENERATE_PROJECT {
	if [ "$PROJECT_SDK" = "NONOS" ]; then
		PROJECT_DIR="${BASE_DIR}ESP8266_NONOS_SDK/$PROJECT_NAME"
		RUN_BG mkdir -pv "$PROJECT_DIR/include"
		RUN_BG mkdir -pv "$PROJECT_DIR/user"
		RUN_BG cp -Lv "${BASE_DIR}ESP8266_NONOS_SDK/examples/at/Makefile" "$PROJECT_DIR/"
		RUN_BG cp -Lv "${BASE_DIR}ESP8266_NONOS_SDK/examples/at/user/Makefile" "$PROJECT_DIR/user"
		RUN_BG touch "$PROJECT_DIR/user/user_main.c"
	elif [ "$PROJECT_SDK" = "RTOS" ]; then
		PROJECT_DIR="${BASE_DIR}ESP8266_RTOS_SDK/projects/$PROJECT_NAME"
		[[ ! -f "$PROJECT_DIR/Makefile" ]] || return 0
		RUN_BG cp -rv "${BASE_DIR}ESP8266_RTOS_SDK/examples/get-started/project_template/" "$PROJECT_DIR"
		RUN_BG rm -v "$PROJECT_DIR/readme.txt"
	fi
}

case $1 in
	"-r"|"--rtos")
		PROJECT_SDK="RTOS"
		PROJECT_NAME "$2"
		;;
	"-n"|"--noos")
		PROJECT_SDK="NONOS"
		PROJECT_NAME "$2"
		;;
	*)
		PROJECT_SDK="NONOS"
		PROJECT_NAME "$1"
		;;
esac
GENERATE_PROJECT
