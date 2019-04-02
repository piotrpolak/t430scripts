#!/bin/bash

sudo apt-get update

# TODO
# https://github.com/timrichardson/Prime-Ubuntu-18.04 / https://github.com/matthieugras/Prime-Ubuntu-18.04

# Battery https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html

sudo apt-get install tp-smapi-dkms acpi-call-dkms
sudo tlp setcharge 60 90 BAT0 
#  sudo tlp-stat -b

# Nvidia - http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux

sudo apt-get purge -y nvidia*
sudo add-apt-repository -y ppa:graphics-drivers

sudo apt-get update
 
sudo apt-get install -y nvidia-390 nvidia-prime nvidia-settings nvidia-prime-applet
sudo apt-mark hold nvidia-390

# See also https://github.com/linuxmint/nvidia-prime-applet

# Extras

sudo apt-get install -y ubuntu-restricted-extras gedit git

# TLP - https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
sudo add-apt-repository -y ppa:linrunner/tlp && \
    sudo apt-get update && \
    sudo apt-get install -y tlp tlp-rdw && \
    sudo tlp start && \
    sudo bash -c 'echo "# Customizations" >> /etc/default/tlp' && \
    sudo bash -c 'echo CPU_SCALING_GOVERNOR_ON_BAT=powersave >> /etc/default/tlp' && \
    sudo bash -c 'echo "DEVICES_TO_DISABLE_ON_BAT=\"bluetooth wwan\"" >> /etc/default/tlp' && \
    sudo bash -c 'echo START_CHARGE_THRESH_BAT0=60 >> /etc/default/tlp' && \
    sudo bash -c 'echo STOP_CHARGE_THRESH_BAT0=90 >> /etc/default/tlp' && \
    sudo tlp start
    
# sudo gedit /etc/default/tlp
    
# Powertop
sudo apt-get install -y powertop

## Post install
#sudo powertop --calibrate

sudo bash -c 'cat > /etc/systemd/system/powertop.service << EOF
[Unit]
Description=Powertop tunings

[Service]
Type=idle
ExecStart=/usr/sbin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF'

sudo systemctl enable powertop





