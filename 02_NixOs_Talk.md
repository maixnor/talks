
![[nixos_logo.png]]
NixOS

---
# Hi 👋
- Benjamin Meixner
- BBE @ WU Wien
- Computer Science @ Uni Wien
---
# Get The Slides 📯
[github.com/maixnor/talks](https://github.com/maixnor/talks)

---
## Disclaimer 🚧
Some viewers might experience discomfort when being shown too much terminal content. Should you experience nausea, headaches or the urge to use a terminal yourself please seek professional attention.

---
#### 1. OS specifics 🖥️
#### 2. Some Goodies 🍭
---
### nix vs nix vs nix ☢️
- nix packages
- NixOS
- nix package manager
- nix lang

---
![[nix_is_not_nix.png]]

---
## nixpkgs 📦
https://github.com/NixOS/nixpkgs

notes:
herzeigen channels
	search.nixos.org
	major releases (channels) alle 6 monate 24.05, 24.11, etc
erklaeren
	unstable ist rolling release channel
	direkt an commit/branch haengen

---
## Statistics 📈
https://repology.org/repositories/statistics/total

notes:
herzeigen repo ranking bzw absolute package count
herzeigen unstable (vergleich mit arch) und partly unstable

---
## Restaurant vs Me 👩‍🍳
chaotic vs declarative 

notes:
ich hau einfach nur alles in die Pfanne und es kommt schon was Gutes raus
Restaurant hat klare Rezepte, die immer gleich sind
ich mach mein Zeug, Restaurant macht Masse
herzeigen configuration.nix

---
The 
### Operating System 🖥️
which isn't*
<br>
<br>
<br>
<span style="font-size: 20px">*but it is</span> 

notes:
erklaeren FHS fuer alle nicht-Linux Menschen
herzeigen non-Filesystem Hierarchy Standard ([[FHS]]) und `nix store`
erklaeren symlinks
herzeigen symlinks

---
## Docker? 🐳

notes:
erklaeren 
	docker teilt sich meinen kernel, gaukelt aber ein volles OS mit vor
	nix-shell linked einfach nur andere binaries und configs herein
herzeigen `nix-shell` und `nix develop`
herzeigen find /nix/store -type f -name node
herzeigen in jede `package` shell hinein mit nix develop

---
## So many Files

![[pre_flakes.png]]

notes: 
erklaeren einzelne files erzeugen einzelne outcomes
**frage** und was macht man gegen zu viele Files?
		richtig! noch mehr files!

---
## Even more files!!

![[post_flakes.png]]

notes: 
erklaeren mit einer flake kann ich alles zusammenfassen
erklaeren version pinning ueber alle systeme

---
# OS 🖥️

- Nix Store & Symlinks
- nixpkgs
- Ethereal Environments (shells)
- Flakes

---
# Goodies 🍭

---
## Options ❓

- services.serx
- services.ollama
- services.nextcloud

notes:
herzeigen services.ollama, services.searx, services.nextcloud

---
```nix
services.searx.enable = true;
services.searx.settings = {
  server.port = 6666;
  server.bind_address = "0.0.0.0";
  server.secret_key = "definetelysecret";
};
```
---
```nix
services.ollama = {
  enable = true;
  acceleration = "cuda"; #cuda drivers
  environmentVariables = {
    HOME = "/tmp/ollama";
    FLAKE = "/home/maixnor/repo/dotfiles";
  };
};
```
---
```nix
services.nextcloud = { # shortened for presentation
  package = pkgs.nextcloud27;
  configureRedis = true;
  maxUploadSize = "1G";
  config.dbtype = "pgsql";
  extraApps = with config.services.nextcloud.package.packages.apps; {
	inherit news contacts calendar tasks onlyoffice notes deck;
  };
};
services.onlyoffice = {
  enable = true;
  hostname = "localhost";
};
```
---
## LEGACY 🧑‍🌾

![[java_what_screams_legacy.png]]

---
## LEGACY 🧑‍🌾 vs TOMORROW 👩‍🎓

- java 8 vs java 22
- javafx vs spring 

notes:
**frage** wer hat schon mal SDKman verwendet / wer verwendet es jetzt gerade?
herzeigen legacy projekt mit altem und altem java stack
	maven 3.3.9 (2015-11-14) & java 1.8
vs 
	latest maven & java 22 pre-release

---
## Automate the World ⚗️

notes:
herzeigen meine uni wien umgebung mit den jupyter notebooks
	nur kurz, das muss relativ schnell gehen

---
## anywhere, anytime 🏔️

![[nixos-anywhere.png.png]]

notes:
disclaimer: jetzt wird es bisschen technischer
erklaeren kexec + passwordless sudo + ssh = fertiger nixos server
		host-OS, disk partitioning, etc egal
erklaeren air-gapped systeme
anektode zerotier VPN mit 100kb transfer, dauert schon etwas

---
# Goodies & Tools 🍬
- Options
- legacy 
- Tests
- nixos-anywhere

---
# Inspiration
- https://www.youtube.com/@noboilderplate
- https://www.youtube.com/@vimjoyer
- https://www.youtube.com/@IogaMaster
- [what nix can do (docker doesn't)](https://www.youtube.com/watch?v=6Le0IbPRzOE) 2h talk
- https://github.com/nix-community/awesome-nix

---
# Resources
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
- mineflake
- plasma-manager
- raspberry-pi-nix
- nix-on-droid
- terraform-nixos
- nix-index
