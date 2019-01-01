.PHONY: docs
docs:
	@terraform-docs markdown document module > module/README.md

.PHONY: docs-check
docs-check: docs
	@! git ls-files -m | grep -q module/README.md
