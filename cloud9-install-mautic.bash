#!/bin/bash
#
# Mautic Installation Shell to Cloud9:
# ----------
# Version 0.1
# By katzueno
# INSTRUCTION:
# ----------
# https://github.com/katzueno/mautic-install-shell
# USE IT AT YOUR OWN RISK!
# LICENSE: GPL V2

# VARIABLES
# ----------
DOWNLOAD_URL="https://github.com/mautic/mautic/archive/2.12.0.zip"
DESTINATION="/home/ubuntu/workspace"
VERSION="2.12.0"
INSTALL_LEMP="yes"
LEMP_NGINX_CONFIG="https://raw.githubusercontent.com/katzueno/mautic-install-shell/master/conf/cloud9-nginx.conf"

# EXEC
# ----------
cd ${DESTINATION}
if [ "$INSTALL_LEMP" = "yes" ]; then
    curl -L https://raw.githubusercontent.com/GabrielGil/c9-lemp/master/install.sh | bash
    sudo rm -f /etc/nginx/sites-enabled/c9
    sudo rm -f /etc/nginx/sites-available/c9
    sudo wget ${LEMP_NGINX_CONFIG} --output-document=/etc/nginx/sites-available/c9
    sudo chmod 755 /etc/nginx/sites-available/c9
    sudo ln -s /etc/nginx/sites-available/c9 /etc/nginx/sites-enabled/c9
    sudo apt-get -qq install mcrypt php7.0-mcrypt php7.0-bcmath
    lemp restart
    lemp status
fi
wget ${DOWNLOAD_URL}
unzip ${VERSION}.zip
mv mautic-${VERSION}/* ./
rm -rf mautic-${VERSION}
rm ${VERSION}.zip
composer install
