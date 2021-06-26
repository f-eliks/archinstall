read -p "install desktop applications[yY]" desktop
read -p "install plasma[yY]" plasma
read -p "install xorg[yY]" xorg
read -p "install yay[yY]" yay
read -p "install zsh " zsh

install="sudo pacman -Syyu wget curl python go dnsutils mlocate vim nano openssh ranger htop tree which nmap zip unzip"
case $xorg in
	[yY])
		install+="xorg xorg-xinit"
	;;
esac
case $plasma in
	[yY])
		install+="pipewire pipewire-pulse plasma sddm dolphin ark ntfs-3g"
	;;
esac
case $desktop in
	[yY])
		install+="code docker docker-compose mpv nomacs firefox thunderbird discord flatpak torbrowser-launcher alacritty neofetch"
	;;
esac
case $yay in
	[yY])
		sudo git clone https://aur.archlinux.org/yay.git /opt
		sudo chown -R $USER /opt/yay
		makepkg -si /opt/yay
		;;
esac
$install
case $zsh in [yY])
	install+="zsh zsh-syntax-highlighting zsh-autosuggestions exa awesome-terminal-fonts"
	;;
esac
updatedb
