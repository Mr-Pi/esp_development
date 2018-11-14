function CLEAN_GIT_SUBMODULE {
	for sdk in *SDK; do
		RUN_BG cd "$sdk"
		git status --untracked-files=no --porcelain=v1 | grep '^ M ' | cut -c4- | grep '.py$' \
		| while read -r file; do
			RUN_BG git checkout -- "$file"
		done || true
		RUN_BG cd ..
	done
}

function INIT_GIT_SUBMODULE {
	LOGIT "Init git submodules"

	git config --file .gitmodules --get-regexp path | cut -d ' ' -f 2 \
	| while read -r submodule; do
		local url="${submodule}_URL"
		local branch="${submodule}_BRANCH"
		[[ -n "${!url}" ]] && RUN_BG git config --file .gitmodules "submodule.${submodule}.url" "${!url}"
		[[ -n "${!branch}" ]] && RUN_BG git config --file .gitmodules "submodule.${submodule}.branch" "${!url}"
	done

	RUN_BG git submodule sync --recursive
	RUN_BG git submodule update --recursive --init
}

cd "$BASE_DIR" || exit 1
if git submodule status | grep "^-" &>/dev/null; then
	CLEAN_GIT_SUBMODULE
	INIT_GIT_SUBMODULE
fi
