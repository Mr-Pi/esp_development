function INIT_GIT_SUBMODULE {
	LOGIT "Init git submodules"

	RUN_BG git submodule update --recursive --init
}

if ! git submodule status | grep -q "^-"; then
	INIT_GIT_SUBMODULE
fi
