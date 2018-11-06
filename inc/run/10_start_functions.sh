# shellcheck disable=SC2154
function START_RTOS {
	LOGIT "Start ESP8266_RTOS_SDK"
	export IDF_PATH="${BASE_DIR}ESP8266_RTOS_SDK"
	RUN_FG cat "${BASE_DIR}inc/run/info.txt"
	cd "$IDF_PATH/projects/$PROJECT_NAME" || cd "$IDF_PATH" || true
	PS1_EXPAND="$( echo -e "\e[1;37m(RTOS)\e[0m " )"
	export PS1_EXPAND
}
function START_NONOS {
	LOGIT "Start ESP8266_NONOS_SDK"
	export IDF_PATH="${BASE_DIR}ESP8266_NONOS_SDK"
	RUN_FG cat "${BASE_DIR}inc/run/info.txt"
	cd "$IDF_PATH/$PROJECT_NAME" || cd "$IDF_PATH" || true
	PS1_EXPAND="$( echo -e "\e[1;37m(NONOS)\e[0m " )"
	export PS1_EXPAND
}
