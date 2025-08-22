#!/bin/bash

sudo dnf update -y
sudo dnf autoremove -y
sudo dnf clean all -y

sudo flatpak update -y
sudo flatpak uninstall --unused -y

sudo fstrim -av
