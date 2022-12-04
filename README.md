# ArchStuff

Simple bash script to tune a few things after a fresh arch installation. Based on EndeavourOS
Here two line to execute it:

```bash
cd $HOME 
mkdir GitHub && cd GitHub
git clone https://github.com/Akamarai/ArchStuff.git && cd ArchStuff
chmod +x ArchSetup.sh
./ArchSetup.sh
```

##### Preview of Day-theme



##### Preview of Night-theme

#### After manually install the extension use this two line to load my shortcut and settings

> Alphabetical App Grid
> 
> AppIndicator and KstatusNotifierltem Support
> 
> Aylur's Widgets
> 
> Blur my Shell
> 
> Dash to Dock
> 
> Gnome 4x UI Improvements
> 
> Just Perfections
> 
> Night Theme Switcher
> 
> Rounded Windows Corners
> 
> Vitals
> 
> User Themes

```bash
dconf load /org/gnome/shell/extensions/ < /$HOME/GitHub/ArchStuff/extension-settings.dconf
dconf load /org/gnome/desktop/wm/keybindings/ < /$HOME/GitHub/ArchStuff/keybindings.dconf
dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ < /$HOME/GitHub/ArchStuff/custom-keybindings.dconf
```

##### To be Fixed

In NightThemeSwitcher extension not able to add general path like  `file:///$HOME/GitHub/Pictures/89206202_p0.jpg` to set background, so you have to modify like this: `file:///home/(your username)/GitHub/Pictures/89206202_p0.jpg`

##### Wallpaper Credit :

- https://www.pixiv.net/en/users/33638616
- https://www.pixiv.net/en/artworks/89174478
