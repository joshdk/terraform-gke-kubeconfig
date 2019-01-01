.PHONY: artifact
artifact:
	@mkdir -p artifacts
	@tar -czvf artifacts/module.tgz ./LICENSE.txt -C module .
	@cd artifacts; sha256sum --binary --tag * | tee checksums.txt

.PHONY: docs
docs:
	@terraform-docs markdown document module > module/README.md

.PHONY: docs-check
docs-check: docs
	@! git ls-files -m | grep -q module/README.md

.PHONY: format
format:
	@terraform fmt -list -write module

.PHONY: format-check
format-check:
	@terraform fmt -list -check module
