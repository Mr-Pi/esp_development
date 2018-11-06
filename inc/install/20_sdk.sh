LOGIT "Update all SDK"

function CHECKOUT_V3 {
	latest_v3="$(git branch | cut -c3- | grep "3" | sort -V -r | head -n1)"
	currect_branch="$(git rev-parse --abbrev-ref HEAD)"
	[[ "$currect_branch" = "$latest_v3" ]] || RUN_BG git checkout "$latest_v3"
}

for sdk in *SDK; do
	RUN_BG cd "$sdk"
	find . -name '*.py' | while read -r file; do
		git diff --exit-code --name-only "$file" &>/dev/null || RUN_BG git checkout -- "$file"
	done
	CHECKOUT_V3
	RUN_BG git pull
	RUN_BG cd "$BASE_DIR"
done