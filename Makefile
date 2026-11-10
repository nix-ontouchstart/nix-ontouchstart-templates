all:	metadata run

templates: flake.nix bash-hello c-hello compat devshell dotnet full python rust rust-web-server
	nix flake show templates

flake.nix:
	nix flake init --template templates#empty
	nix flake show

metadata: templates
	nix flake metadata 
	nix flake metadata ./bash-hello
	nix flake metadata ./c-hello
	nix flake metadata ./compat
	nix flake metadata ./devshell
	nix flake metadata ./dotnet
	nix flake metadata ./full
	nix flake metadata ./python
	nix flake metadata ./rust
	nix flake metadata ./rust-web-server

run: metadata
	nix run ./bash-hello
	nix run ./c-hello
	nix develop ./devshell --command hello

bash-hello:
	nix flake new --template templates#bash-hello bash-hello
	nix flake show ./bash-hello

c-hello:
	nix flake new --template templates#c-hello c-hello
	nix flake show ./c-hello

compat:
	nix flake new --template templates#compat compat
	nix flake show ./compat

devshell:
	nix flake new --template templates#devshell devshell
	nix flake show ./devshell

dotnet:
	nix flake new --template templates#dotnet dotnet
	nix flake show ./dotnet

full:
	nix flake new --template templates#full full
	nix flake show ./full

python:
	nix flake new --template templates#python python
	nix flake show ./python

rust:
	nix flake new --template templates#rust rust
	nix flake show ./rust

rust-web-server:
	nix flake new --template templates#rust-web-server rust-web-server
	nix flake show ./rust-web-server

clean:
	rm -rf flake.nix bash-hello c-hello compat devShell dotnet full python rust rust-web-server
