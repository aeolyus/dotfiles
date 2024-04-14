default: help

DARWIN_REBUILD := ./result/sw/bin/darwin-rebuild
HOST := $(shell hostnamectl hostname)

.PHONY: aarch64-darwin
aarch64-darwin: $(DARWIN_REBUILD) ## Configure aarch64-darwin machine
	$(DARWIN_REBUILD) switch \
		--flake .#aarch64-darwin \
		--option accept-flake-config true

.PHONY: nixos
nixos: ## Configure NixOS machine
	sudo nixos-rebuild switch --flake ".#$(HOST)" \
		--option accept-flake-config true

.PHONY: home
home: ## Configure home-manager
	nix run home-manager/master switch -- --flake ".#$${USER}.home"

.PHONY: home-gui
home-gui: ## Configure home-manager, including GUI configs
	nix run home-manager/master switch -- --flake ".#$${USER}.home.gui"

.PHONY: fmt
fmt: ## Format code
	nix fmt --accept-flake-config

.PHONY: lint
lint: ## Lint code
	nix fmt --accept-flake-config -- --check .
	nix run github:astro/deadnix/main -- --fail
	nix flake check --all-systems --accept-flake-config

.PHONY: help
help: Makefile ## Print this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

$(DARWIN_REBUILD):
	nix build .#darwinConfigurations.aarch64-darwin.system \
		--experimental-features "nix-command flakes" \
		--accept-flake-config

