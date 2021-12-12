#!/usr/bin/env sh

## installation of language servers
check () {
	if ! command -V npm ; then
		printf "npm package manager not installed"
		return 1
	fi
}

instals () {
	npm i -g \
		# bash language server
		bashls \
		# html/css language server
		vscode-langservers-extracted \
		# python language server
		pyright \
		# golang language server
		gopls \
		# typescript language server
		typescript typescript-language-server \
	# installing clangd via packages manager
	case "$(uname -a)" in
		*[aA]rch*) pacman -Sy clangd ;;
		*[Dd]ebian*) apt-get install clangd-12 ;;
		*BSD*) : ;;
		*) printf "Unkown operating system" 2>/dev/null
	esac
}

## package installation
bsds()
{
	# mpg123 sndio libshout openbsd-netcat
	getbsdspackages=''
	:
}

debian()
{
	getdebpackages='
		luarocks npm dictd dict info
	'
	# wayland-protocols libwlroots6 libgles2-mesa-dev libwlroots-dev libinput-dev
	apt-get upgrade && apt-get install "$getdebpackages"
}

archlinux()
{
	getarchpackages='
		usb_modeswitch vim sudo man
		psutils xorg libglvnd xorg xorg-xinit
		git tmux pulsemixer pulseaudio-alsa
		alsa-utils make gcc pkgconf wget w3m
		lynx htop feh xcb neovim vis
		awk lua perl ffmpeg luarocks
		npm scrot flameshot conky zathura bmon
		zathura-pdf-mupdf zathura-cb zathura-ps
		telegram-desktop bluez bluez-utils openssh dhcp
		wireshark-cli dhclient acpi ntfs-3g
		wifite macchanger iwd libxss pandoc nc
		hashcat cowpatty reaver bully hcxpcapngtool
		xclip texinfo pip python python-pip dictd
		wpa_supplicant e2fsprogs gptfdisk youtube-dl
		cronie kakoune surfraw xautolock cups
		gutenprint gnuplot lsof usbutils psmisc
		hdparm dosfstools parted
		lsof fzf telegram-desktop sysstat 
		libvirt vagrant qemu dnsmasq ebtables
	'
	pacman -ySu && pacman --no-confirm -S "$getarchpackages"
}

case "$(uname -a)" in
	*[Dd]ebian*) debian;;
	*[a|A]rch*) archlinux ;;
	*[bB][sS][dD]*) bsds ;;
	*) printf "Unknown operating system" >&2 ;;
esac

## auto configuration
# no sanity check, I assume all the files are
# there, so be sure to run it in the right place


if test -z "$XDG_CONFIG_HOME"; then
	XDG_CONFIG_HOME="$HOME/.config"
	mkdir -p "$XDG_CONFIG_HOME"
fi
if test "$(basename "$PWD")" != simpledots; then
	echo "Error: please run this script from its cwd!"
	exit 1
fi

lbin="$HOME/.local/bin" && mkdir -p "$lbin"
confcopy() {
	if test $# -ne 2; then
		echo invalid number of arguments >&2
		return 1
	fi
	local source="$1"
	local destinat="$2"
	test -e "$source" && cp -rv "$source" "$destinat" || return 1
	return 0
}

confcopy "./tmux/tmux.conf" "$HOME/.tmux.conf"
confcopy "./bash/bashrc" "$HOME/.bashrc"
confcopy "./bash/bashrc0" "$HOME/.bashrc0"
confcopy "./bash/inputrc" "$HOME/.inputrc"
confcopy "./xorg/Xresources" "$HOME/.Xresources"
confcopy "./xorg/xinitrc" "$HOME/.xinitrc"
confcopy "./vim/vimrc" "$HOME/.vimrc"
mkdir -p "$XDG_CONFIG_HOME/zathura/"		&& confcopy "./zathura/zathurarc" "$XDG_CONFIG_HOME/zathura/"
mkdir -p "$XDG_CONFIG_HOME/dunst/"		&& confcopy "./dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
mkdir -p ~/.dwm					&& confcopy "./dwm/autostart.sh" "$HOME/.dwm"
mkdir -p "$XDG_CONFIG_HOME/conky"		&& confcopy "./conky/conkyrc_*" "$XDG_CONFIG_HOME/conky"
ls scripts/* >/dev/null 2>&1			&& confcopy "scripts/*" "$lbin"
