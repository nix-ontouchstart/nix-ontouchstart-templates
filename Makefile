all:	templates metadata run
	
templates:
	nix flake show templates

flake.nix:
	nix flake init --template templates#empty

clean:
	rm flake.nix

metadata: flake.nix bash-hello/flake.nix
	nix flake metadata 
	nix flake metadata ./bash-hello

run: bash-hello/flake.nix
	nix run ./bash-hello

bash-hello/flake.nix:
	nix flake new --template templates#bash-hello bash-hello
