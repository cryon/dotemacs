#!/bin/sh
set -e

while true; do
    read -p "Do you wish to keep emacs' source code after installation [y/n]? " yn
    case $yn in
        [Yy]* ) KEEP_SRC=true; break;;
        [Nn]* ) KEEP_SRC=false; break;;
        * ) echo "Please answer 'y' or 'n'";;
    esac
done

sudo apt install -y	   \
     autoconf		   \
     make		   \
     gcc		   \
     texinfo		   \
     libgtk-3-dev	   \
     libxpm-dev		   \
     libjpeg-dev	   \
     libgif-dev		   \
     libgnutls28-dev	   \
     libncurses5-dev	   \
     libjansson-dev	   \
     libharfbuzz-dev	   \
     libharfbuzz-bin	   \
     libxml2-dev	   \
     libtiff-dev	   \
     libacl1-dev	   \
     libwebkit2gtk-4.0-dev \
     librsvg2-dev	   \
     libmagickcore-dev	   \
     libmagick++-dev	   \
     libgpm-dev		   \
     libselinux1-dev	   \
     libm17n-dev	   \
     libotf-dev		   \
     libsystemd-dev	   \
     libcairo2-dev

if [ "$KEEP_SRC" = true ]; then
    read -p "Where do you want to keep the source (default ./emacs-src/)? " path
    if [ "${path}" = "" ]; then
	EMACS_SRC_DIR="emacs-src"
    else
	EMACS_SRC_DIR="${path}"
    fi
else
    EMACS_SRC_DIR=$(mktemp -d -t emacs-src-XXXXXXXX)
fi

git clone	      \
    --single-branch   \
    --branch emacs-27 \
    --depth 1	      \
    https://github.com/emacs-mirror/emacs.git "${EMACS_SRC_DIR}"

cd "${EMACS_SRC_DIR}"

./autogen.sh
./configure

make
sudo make install

if [ ! "$KEEP_SRC" = true ]; then
    rm -rf "${EMACS_SRC_DIR}"
fi
