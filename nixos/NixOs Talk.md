![[Pasted image 20240904155340.png]]
NixOs

---
# Get The Slides

[github.com/maixnor/talks](https://github.com/maixnor/talks)

notes:
Everything you see in this talk from the script to the images are part of a markdown document available on github under a public domain license.

---
## Disclaimer
Some viewers might experience discomfort when being shown too much terminal content. Photosensitive viewers are advised to be cautions of extremely fast typing and flickering lights. Should you experience nausea, headaches or the urge to use a terminal yourself please seek professional attention.

---
#### 1. OS specifics
#### 2. Some Goodies

---
The 
### Operating System
which isn't*
<br>
<br>
<br>
<span style="font-size: 20px">*but it is<span> 

notes:
herzeigen non-Filesystem Hierarchy Standard ([[FHS]]) und `nix store`

---
https://github.com/NixOS/nixpkgs

notes:
herzeigen nixpkgs mit time travel
			search.nixos.org
			major releases alle 6 monate 24.05, 24.11, etc
erklaeren cache.nixos.org
herzeigen repo ranking bzw absolute package count
			https://repology.org/repositories/statistics/total
			
herzeigen unstable (vergleich mit arch) und partly unstable

---
LEGACY vs TOMORROW

notes:
herzeigen legacy projekt mit alter Postgres db 
vs neues Pilotprojekt: cutting edge alpha version

---
## Docker? 

notes:
herzeigen `nix-shell` und `nix develop`
herzeigen in jede `package` shell hinein mit nix develop
	herzeigen wir bauen cowsay selber
herzeigen am server meine eigene nixvim config, nachher weg

---
## Yummy Corn *flakes*

notes: 
herzeigen version pinning und reproducible builds
herzeigen es muss in git eingecheckt sein, sollte es ein git repo sein
anbringen 

---
## Operating System

- Nix Store & Symlinks
- nixpkgs & Unstable
- Time Travel
- Ethereal Environments
- Flakes

---
## Options

notes:
herzeigen services.ollama, services.searx, services.nextcloud

---
## home-manager

notes:
herzeigen: multi-user install
herzeigen: firefox mit extensions
herzeigen: nixvim mit lsps
herzeigen: home-manager muss nicht auf nixos seinear

---
## Flakes again

notes:
herzeigen something

---
## `.iso` & cross compile

notes:
herzeigen https://github.com/nix-community/nixos-generators#user-content-cross-compiling

---
## Tests

notes:
herzeigen simple nginx / curl vm test
herzeigen https://nix.dev/tutorials/nixos/integration-testing-using-virtual-machines#tests-with-multiple-virtual-machines
herzeigen cache of test

---
## hier, da, dort

notes:
nixos-anywhere
air-gapped systeme
config-only maschine: kein ssh, kein gar nichts, nur eine config die sich von einem internen git server/web server gezogen wird und automatisch applied wird

---
## Goodies & Tools

- Options
- home-manager
- Flakes <span style="font-size: 20px">again</span>
- `.iso` & cross compiling
- Tests
- nixos-anywhere

---
# Resources
- [what nix can do (docker doesn't)](https://www.youtube.com/watch?v=6Le0IbPRzOE) 2h talk
- https://www.youtube.com/@vimjoyer
- https://www.youtube.com/@IogaMaster
- https://github.com/nix-community/awesome-nix

---
# Inspiration
- https://search.nixos.org
- https://mynixos.com
- https://discourse.nixos.org
- https://github.com/nix-community

---
# Stuff I

- nixvim
- disko & impermanence
- stylix
- NUR

---
# Stuff II

- nix-init & nurl
- nix-direnv
- plasma-manager
- raspberry-pi-nix
- mineflake
- nix-on-droid
- terraform-nixos
- nix-index
