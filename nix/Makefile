default: help

.PHONY: deploy
deploy: ## Bootstrap
	nix build .#darwinConfigurations.aarch64-darwin.system \
		--experimental-features "nix-command flakes" \
		--accept-flake-config

	./result/sw/bin/darwin-rebuild switch --flake .#aarch64-darwin

.PHONY: fmt
fmt: ## Format code
	nix fmt

.PHONY: lint
lint: ## Lint code
	nix fmt -- --check .
	nix run github:astro/deadnix -- --fail
	nix flake check --all-systems

.PHONY: help
help: Makefile ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
