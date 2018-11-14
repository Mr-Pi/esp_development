# ESP development

This repository provides a simple script `dev.sh` to make the development for the ESP8266 or the ESP32 a bit more handful.

After you cloned this repository you need to run `./dev.sh install` once to initiate the SDK and to download the official espressif toolchain.


## What the script does

All command are available for both SDKs RTOS and NONOS(non os). For a full list of available commands simple run `./dev.sh` without arguments or `./dev.sh --help`.


### install command

 1. Install the xtensa-lx106-elf-linux64 toolchain, you can specify the version with the environment variable `TOOLCHAIN_VERSION` or via `TOOLCHAIN_VERSION` in `config.inc.sh`.
 2. Initiate git submodules, if required
 3. Update to the latest version 3 NONOS and RTOS SDK or the selected branch by `*_SDK_BRANCH`, see `inc/install/15_submodule.sh` for details
 4. Generate a symlink for python2 for the PATH environment variable, since some official simple invoke `python` not `python2`
 5. Fix [shebank](https://en.wikipedia.org/wiki/Shebang_(Unix)) on all python files (They use and require python2)
 6. Create a project directory inside of the RTOS SDK


### run command

 1. Set the `$PATH` variable to contain the `python` symlink and the toolchain
 2. Set the `$IDF_PATH` variable to the selected SDK root
 3. Set the `$PS1_EXPAND` variable to an indicator string for the selected SDK
 4. Changes to the SDK root directory or the selected project(if specified via command line argument)
 5. Start a new shell with all variables set


### gen command

 1. Ask for the project name if not provided via command line argument
 2. Generate a new directory for the new project
 3. Generate required directory structure for the new project
 4. Copy all required Makefiles and so on
 5. Run `git init` inside of the new create project
 6. Get a proper `.gitignore` and make initial commit
 7. All things the `run` command does


## USAGE

Simple run `./dev.sh` without argument to see all avail options.


## HINTS

Add `$PS1_EXPAND` anywhere to your shell PROMPT/PS1 in your local `.bashrc` or `.zshrc`. This will show you in indicator, when developing :) .


## License
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).


## Author Information
- [Markus Mroch (Mr. Pi)](https://github.com/Mr-Pi) _git-contact@mr-pi.de_
