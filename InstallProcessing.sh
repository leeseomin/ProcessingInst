#!/bin/bash

# To install a newer or older version of Processing, change the version below.
version=3.5.3

echo "This script will install Processing-$version-linux64 on Ubuntu 16.04/18.04."
wget http://download.processing.org/processing-$version-linux64.tgz
mkdir /opt/Processing
tar -xvzf processing-$version-linux64.tgz -C /opt/Processing
mv /opt/Processing/processing-$version /opt/Processing/$version
ln -s /opt/Processing/$version/processing /usr/local/bin/processing
echo "[Desktop Entry]
Version=$version
Name=Processing
Comment=A flexible software sketchbook
Exec=processing
Icon=/opt/Processing/$version/lib/icons/pde-256.png
Terminal=false
Type=Application
Categories=AudioVideo;Video;Graphics;Development;Animation;IDE" >  /usr/share/applications/processing.desktop
echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
<mime-type type="text/x-processing">
<comment>Proecssing PDE sketch file</comment>
<sub-class-of type="text/x-csrc"/>
<glob pattern="*.pde"/>
</mime-type>
</mime-info>' > /usr/share/mime/packages/processing.xml
update-mime-database /usr/share/mime
echo 'text/x-processing=processing.desktop' >> /usr/share/applications/defaults.list
echo 'install complete'
echo 'Script by crazy-logic, edit by AtjonTV'
