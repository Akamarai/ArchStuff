# ArchStuff
Simple bash script to tune a few things after a fresh arch installation.
Here two line to execute it:
```bash
cd $HOME 
mkdir GitHub && cd GitHub
git clone https://github.com/Akamarai/ArchStuff.git && cd ArchStuff
chmod +x ArchSetup.sh
./ArchSetup.sh
```


##### Preview of Day-theme
![Screenshot from 2022-02-04 10-34-01](https://user-images.githubusercontent.com/87226280/152510107-69fa05da-cef3-41b8-ae6f-b3a14cb508d0.png)

##### Preview of Night-theme
![Screenshot from 2022-02-04 10-34-20](https://user-images.githubusercontent.com/87226280/152510144-5e2040b0-1b62-433f-8f46-5ec6d596a205.png)

#### After manually install the extension use this two line to load my shortcut and settings
```bash
dconf load /org/gnome/shell/extensions/ < /$HOME/GitHub/ArchStuff/extension-settings.dconf
dconf load /org/gnome/desktop/wm/keybindings/ < /$HOME/GitHub/ArchStuff/keybindings.dconf
dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ < /$HOME/GitHub/ArchStuff/custom-keybindings.dconf
```

##### To be Fixed
In NightThemeSwitcher extension not able to add general path like  `file:///$HOME/GitHub/Pictures/89206202_p0.jpg` to set background, so you have to modify like this: `file:///home/(your username)/GitHub/Pictures/89206202_p0.jpg`

##### Wallpaper Credit :

- https://www.pixiv.net/en/users/33638616
- https://www.pixiv.net/en/artworks/89174478
