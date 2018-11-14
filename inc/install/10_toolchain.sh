function INSTALL_TOOLCHAIN {
	LOGIT "Download xtensa toolchain"
	[[ ! -f "$latest_toolchain_file" ]] || RUN_BG rm -v "$latest_toolchain_file"
	[[ ! -d "./xtensa-lx106-elf" ]] || RUN_BG rm -rv "./xtensa-lx106-elf"
	RUN_BG wget "$latest_toolchain_url"
	RUN_BG tar xvf "$latest_toolchain_file"
	RUN_BG touch "./xtensa-lx106-elf/$latest_toolchain_file.version.txt"
	RUN_BG rm -v "$latest_toolchain_file"
}

latest_toolchain_url="$(curl https://raw.githubusercontent.com/espressif/ESP8266_RTOS_SDK/master/README.md 2>/dev/null | grep "https://dl.espressif.com/dl/xtensa-lx106-elf-${TOOLCHAIN_VERSION:=linux64}" | sed 's/.*\(http[s]*:\/\/[-./%@0-9A-Za-z]\+\).*/\1/g')"
latest_toolchain_file="xtensa-lx106-elf-${latest_toolchain_url//*xtensa-lx106-elf-}"
[[ -f "./xtensa-lx106-elf/$latest_toolchain_file.version.txt" ]] || INSTALL_TOOLCHAIN
