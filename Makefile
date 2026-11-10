all:	flake.nix
	nix flake metadata
	nix flake metadata github:nix-ontouchstart/nix-ontouchstart-templates/main

flake.nix:
	nix flake init --template templates#empty

clean:
	rm flake.nix
