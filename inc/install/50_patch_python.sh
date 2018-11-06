LOGIT "Patch python files"
find . -name '*.py' | while read -r file; do
	if ! head -n 1 "$file" | grep -q '^#!'; then
		RUN_BG sed -i '1i #!/usr/bin/env python2' "$file"
	else
		head -n1 "$file" | grep -q '^#!/usr/bin/env python2$' ||
			RUN_BG sed -i '1c #!/usr/bin/env python2' "$file"
	fi
done

