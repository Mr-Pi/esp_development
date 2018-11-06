function INSTALL_TOOLCHAIN {
	local latest_toolchain="xtensa-lx106-elf-linux64-1.22.0-88-gde0bdc1-4.8.5.tar.gz"
	[[ ! -f "xtensa-lx106-elf-linux64-1.22.0-88-gde0bdc1-4.8.5.tar.gz" ]] || RUN_BG rm -v "$latest_toolchain"
	LOGIT "Download xtensa toolchain"
	RUN_BG wget "https://dl.espressif.com/dl/$latest_toolchain"
	RUN_BG tar xvf "$latest_toolchain"
	RUN_BG rm -v "$latest_toolchain"
}

[[ -d "./xtensa-lx106-elf" ]] || INSTALL_TOOLCHAIN
