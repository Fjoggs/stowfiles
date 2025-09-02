## Useful apps for i3

- arandr
- lxappearenace
- xev

## Changing dpi
Make ~/.Xresources file and add: Xft.dpi: number

96 looks good on 15” 4k screen

## Natural scrolling
xinput --set-prop inputID "libinput Natural Scrolling Enabled" 1

  

Touchpad tapping (mouselick when hitting touchpad)

xinput --set-prop 16 "libinput Tapping Enabled" 1


## Wacom graphics tablet
- https://wiki.archlinux.org/title/Graphics_tablet

1. Install driver `xf86-input-wacom`
2. Run `xsetwacom list devices` to verify insallation
3. Create file `/etc/X11/xorg.conf.d/10-tablet.conf`
	1. `VIP:PID` is the USB ID from `lsbusb` cmd
	2. ```
```
	Section "InputClass"
	    Identifier "Tablet"
	    Driver "wacom"
	    MatchDevicePath "/dev/input/event*"
	    MatchUSBID "_VID:PID_"
	EndSection
```

3. Restart X / Reboot
4. Run `xsetwacom list devices` and verify that tablet and stylus is showing up
5. Download the mapwacom script
	1. https://gist.github.com/tom-galvin/6c19fe907945d735c045
6. run `mapwacom --list-screens` and find the tablet name (usually `HDMI-A-0`)
7. Run the script with the `-d` flag and add the name of the stylus, the eraser and the screen to map the area
	1. Example: `sh mapwacom.sh -d "Wacom Cintiq 16 Pen stylus" -d "Wacom Cintiq 16 Pen eraser" -s "HDMI-A-0"`
8. Tablet shold now work!