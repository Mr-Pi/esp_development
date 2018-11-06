# shellcheck disable=SC2034
export PATH="${BASE_DIR}xtensa-lx106-elf/bin:${BASE_DIR}scripts:$PATH"
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
		START_NONOS
		;;
esac
zsh
