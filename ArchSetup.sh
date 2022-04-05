#!/bin/bash

#Made by Simone

#Multicore compiling in pacman
	#https://wiki.archlinux.org/title/makepkg#Improving_compile_times

#To install matlab
	#xhost +SI:localuser:root
	#unzip -X -K
	# https://wiki.archlinux.org/title/MATLAB#Installing_from_the_MATLAB_installation_software

#Gnome extension  and shortcut (attached dconf file)
	#These two lines used to export the config
	#dconf dump '/org/gnome/desktop/wm/keybindings/' > keybindings.dconf
	#dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' > custom-keybindings.dconf
	
	#List of extensions
	# user-theme@gnome-shell-extensions.gcampax.github.com
	# sound-output-device-chooser@kgshank.net
	# clipboard-indicator@tudmotu.com
	# Vitals@CoreCoding.com
	# AlphabeticalAppGrid@stuarthayhurst
	# app-grid-tweaks@Selenium-H
	# blur-my-shell@aunetx
	# floating-dock@nandoferreira_prof@hotmail.com
	# gnome-ui-tune@itstime.tech
	# nightthemeswitcher@romainvigier.fr
	# pop-shell@system76.com


############
#  SCRIPT  #
############

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 500
    kill -0 "$$" || exit
  done 2>/dev/null &
}

echo "Starting Arch Linux post-install script..."
	sleep 2s
		bypass

	clear


echo "Updating system..."
	sleep 2s
		sudo pacman -Syu

	clear


echo "Installing packages..."
#Steam pkg need [multilib] repository uncommented in /etc/pacman.conf
#for pure Arch add os-prober firefox
	sleep 2s
		sudo sed -i 's/ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
		sudo pacman -S linux-zen linux-zen-headers pigz pbzip2 baobab micro s-tui htop \
		wl-clipboard code gnome-boxes chromium piper vlc bat fragments \
		telegram-desktop papirus-icon-theme helvum guitarix steam discord \
		vlc
		sudo grub-mkconfig -o /boot/grub/grub.cfg
	clear

#echo "Installing AUR helper"
#	sleep 2s
#		cd
#		sudo pacman -S --needed base-devel
#		cd ~/GitHub && git clone https://aur.archlinux.org/paru.git && cd paru
#		makepkg -si
#
#	clear		

echo "Tuning system..."
#USARE : sed -i 's/riga da canellare/riga da aggiungere/' path/to/file
	sleep 2s
	#makepkg
		sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz -c -f -n)/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(pbzip2 -c -f)/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/' /etc/makepkg.conf
	#pacman
		#sudo sed -i 's/#Color/Color/' /etc/pacman.conf
	#paru
		#sudo sed -i "/BottomUp/s/^#//g" /etc/paru.conf
	# #grub
	 	#echo "" | sudo tee -a /etc/default/grub
	 	#echo "#For Windows" | sudo tee -a /etc/default/grub
	 	#echo "GRUB_DISABLE_OS_PROBER=false" | sudo tee -a /etc/default/grub
	 	#sudo grub-mkconfig -o /boot/grub/grub.cfg	
	#/etc/env
	#sudo sed -i 's/EDITOR=nano/	EDITOR=micro/' /etc/environment
	#echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment
	clear
	

echo "Installing GitHub Theme Files..."
	sleep 1s
		cd ~/GitHub && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git && cd WhiteSur-gtk-theme
		./install.sh -t red -i arch -N glassy -HD 
		sudo ./tweaks.sh -g -c dark -t red
		
	sleep 1s
		cd ~/GitHub && git clone https://github.com/vinceliuice/Vimix-cursors.git && cd Vimix-cursors
		sudo ./install.sh
		
	clear
	

echo "Installing AUR pkg..."
#EndevourOS has default yay. Uncomment Paru line and change yay with paru if u want it
	sleep 2s
		yay -S topgrade spotify droidcam minecraft-launcher \
		zoom gnome-shell-extension-pop-shell-git marktext-bin \
		onlyoffice papirus-folders-git gnome-text-editor \
		whatsdesk-bin bash-pipes noisetorch timeshift chrome-gnome-shell-git \
		nerd-fonts-complete popsicle
		
		sleep 1s 
		papirus-folders -C yaru

	clear
read -p "Done! See script comment to manual install gnome extension and shortcut. Press ENTER to reboot."
	reboot
