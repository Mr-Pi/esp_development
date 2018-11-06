# shellcheck disable=SC2034
case $1 in
	"-r"|"--rtos")
		PROJECT_NAME="$2"
		START_RTOS
		;;
	"-n"|"--noos")
		PROJECT_NAME="$2"
		START_NONOS
		;;
	*)
		PROJECT_NAME="$1"
		START_RTOS
		;;
esac
$SHELL
