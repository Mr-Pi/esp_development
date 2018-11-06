LOGIT "Generate scripts and symlinks for the toolchains"

RUN_BG mkdir -pv ./scripts
RUN_BG cd ./scripts
RUN_BG ln -sf "$(which python2)" python
