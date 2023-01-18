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
	#dconf dump /org/gnome/desktop/wm/keybindings/ > keybindings.dconf
	#dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ > custom-keybindings.dconf
	
############
#  SCRIPT  #
############

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 1000
    kill -0 "$$" || exit
  done 2>/dev/null &
}

echo "Starting Arch Linux post-install script..."
	sleep 2s
		bypass

echo "Updating system..."
	sleep 2s
		sudo pacman -Syu

echo "Installing packages..."
#Steam pkg need [multilib] repository uncommented in /etc/pacman.conf
	sleep 2s
		sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
		sudo pacman -S bat micro git firefox papirus-icon-theme wl-clipboard bash-completion ttf-roboto ttf-ubuntu-font-family ttf-jetbrains-mono alacritty neofetch pigz lbzip2  gnome-boxes linux-zen linux-zen-headers linux-headers piper gufw ibva-mesa-driver mesa-vdpau powertop htop s-tui os-prober reflector obsidian steam discord os-prober ntfs-3g
	
echo "Tuning system..."
#USARE : sed -i 's/riga da canellare/riga da aggiungere/' path/to/file
	sleep 2s
	#makepkg
		sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz -c -f -n)/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(lbzip2 -c -f)/' /etc/makepkg.conf
		sudo sed -i 's/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/' /etc/makepkg.conf
	#pacman
		sudo sed -i 's/#Color/Color/' /etc/pacman.conf
		sed -i '33 i ILoveCandy' /etc/pacman.conf
	# #grub
	 	sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
	 	sudo grub-mkconfig -o /boot/grub/grub.cfg	
	#/etc/env
	echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment
	echo "EDITOR=micro" | sudo tee -a /etc/environment
	echo "BROWSER=firefox" | sudo tee -a /etc/environment
	echo "TERMINAL=alacritty" | sudo tee -a /etc/environment
	echo "QT_QPA_PLATFORM=wayland" | sudo tee -a /etc/environment
	
	

echo "Installing AUR helper"
	sleep 2s
		cd
		mkdir GitHub
		#For paru
		sudo pacman -S --needed base-devel
		cd ~/GitHub && git clone https://aur.archlinux.org/paru.git && cd paru
		makepkg -si
		sudo sed -i "/BottomUp/s/^#//g" /etc/paru.conf
		sudo sed -i "/CombinedUpgrade/s/^#//g" /etc/paru.conf
		
		#For yay
		# sudo pacman -S --needed base-devel
		# cd ~/GitHub && git clone https://aur.archlinux.org/yay.git && cd yay
		# makepkg -si
		# sleep 1s
		# yay -Y --devel --combinedupgrade --batchinstall --save

echo "Installing AUR pkg..."
	sleep 2s
		paru -S prismlauncher zoom gnome-shell-extension-pop-shell-git papirus-folders-git visual-studio-code-bin google-chrome extension-manager github-desktop-bin heroic-games-launcher-bin auto-cpufreq
		
		sleep 1s 
		papirus-folders -C pink

echo "Systemd Service"
	sleep 2s
		systemctl enable ufw.service
		systemctl enable auto-cpufreq.service

echo "Tune Electron App"
	sleep 2s
		cd
		cp ~/GitHub/ArchStuff/code-flags.conf .config/
		cp ~/GitHub/ArchStuff/chrome-flags.conf .config/
		sudo cp ~/GitHub/ArchStuff/heroic.desktop usr/share/applications/heroic.desktop


echo "Huawei Settings"
	sleep 2s
		paru -S matebook-applet huawei-wmi
		systemctl enable huawei-wmi-reinstate.service
		systemctl enable huawei-wmi-privilege.service
		sudo usermod -a -G huawei-wmi $USER

echo "Copy Dots"
	sleep 2s
		cd
		mkdir .config/alacritty
		cp ~/GitHub/ArchStuff/alacritty.yml .config/alacritty/alacritty.yml
		

read -p "Done! See script comment to manual install gnome extension and shortcut. Press ENTER to reboot."
	reboot
