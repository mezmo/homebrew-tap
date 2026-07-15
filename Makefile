IMAGE ?= aura-tap-test

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN{FS=":.*?## "} {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

.PHONY: test-mac
test-mac: ## Style, audit, install and test every formula using local Homebrew
	./scripts/test-formulae.sh

.PHONY: docker-build
docker-build: ## Build the Linux (Homebrew) test image
	docker build -t $(IMAGE) .

.PHONY: test-linux
test-linux: docker-build ## Run the formula tests inside the Linux container
	docker run --rm --user linuxbrew -e GITHUB_TOKEN \
		-v "$(CURDIR)":/tap:ro -w /tap $(IMAGE) \
		bash -c "git config --global --add safe.directory '*' && exec ./scripts/test-formulae.sh"
