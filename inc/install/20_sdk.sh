LOGIT "Update all SDK"

function CHECKOUT_V3 {
	latest_v3="$(git branch | cut -c3- | grep "3" | sort -V -r | head -n1)"
	currect_branch="$(git rev-parse --abbrev-ref HEAD)"
	[[ "$currect_branch" = "$latest_v3" ]] || RUN_BG git checkout "$latest_v3"
}

for sdk in *SDK; do
	RUN_BG cd "$sdk"
	sdk_branch="${sdk}_BRANCH"
	if [ -z "${!sdk_branch}" ]; then
		CHECKOUT_V3 git checkout
	else
		RUN_BG git checkout "${!sdk_branch}"
	fi
	unset sdk_branch
	RUN_BG git pull
	RUN_BG cd "$BASE_DIR"
done
