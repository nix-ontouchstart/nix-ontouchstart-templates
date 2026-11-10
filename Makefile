all:	flakes templates metadata run

flakes:	flake.nix bash-hello/flake.nix c-hello/flake.nix compat/flake.nix

templates:
	nix flake show templates

flake.nix:
	nix flake init --template templates#empty
	nix flake show

metadata: flake.nix bash-hello/flake.nix c-hello/flake.nix
	nix flake metadata 
	nix flake metadata ./bash-hello
	nix flake metadata ./c-hello
	nix flake metadata ./compat

run: bash-hello/flake.nix
	nix run ./bash-hello
	nix run ./c-hello

bash-hello/flake.nix:
	nix flake new --template templates#bash-hello bash-hello
	nix flake show ./bash-hello

c-hello/flake.nix:
	nix flake new --template templates#c-hello c-hello
	nix flake show ./c-hello

compat/flake.nix:
	nix flake new --template templates#compat compat
	nix flake show ./compat

clean:
	rm -rf flake.nix bash-hello c-hello
