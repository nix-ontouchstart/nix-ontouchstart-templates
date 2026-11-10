
all:	flake.nix
	nix flake metadata

flake.nix:
	nix flake init --template templates#empty

clean:
	rm flake.nix
