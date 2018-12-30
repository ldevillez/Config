#!/bin/bash
# declare STRING variable
echo "Nettoyage de la vielle config"
echo ""
rm -rf /home/westornd/Config/backup
mkdir backup
echo "Backup de la config"
echo "- I3"
cp /home/westornd/.config/i3 /home/westornd/Config/backup/i3 -r
echo "- MPD"
cp /home/westornd/.config/mpd /home/westornd/Config/backup/mpd -r
echo "- polybar"
cp /home/westornd/.config/polybar /home/westornd/Config/backup/polybar -r
echo "- rofi"
cp /home/westornd/.config/rofi /home/westornd/Config/backup/rofi -r
echo "- conky"
cp /home/westornd/.config/conky /home/westornd/Config/backup/conky -r
echo "- ZSHRC"
cp /home/westornd/.zshrc /home/westornd/Config/backup/zshrc -r
echo "- Compton"
cp /home/westornd/.config/compton /home/westornd/Config/backup/compton -r
echo "- Conky"
cp /home/westornd/.config/conky /home/westornd/Config/backup/conky -r
echo "- Ranger"
cp /home/westornd/.config/ranger /home/westornd/Config/backup/ranger -r
echo "- URxvt"
cp /home/westornd/.Xresources /home/westornd/Config/backup/xresources
