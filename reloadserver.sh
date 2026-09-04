#!/bin/bash

case "$OSTYPE" in
    darwin*)
        DEST_DIR="/opt/homebrew/var/www"

        sudo rm -rf $DEST_DIR/*
        sudo cp -r * $DEST_DIR
        sudo cp .htaccess $DEST_DIR
        sudo rm $DEST_DIR/reloadserver.sh
        sudo rm $DEST_DIR/updatedns.sh
        ;; 
    linux*)
        DEST_DIR="/srv/http"

        sudo rm -rf $DEST_DIR/*
        sudo cp -r * $DEST_DIR
        sudo cp .htaccess $DEST_DIR
        sudo rm $DEST_DIR/reloadserver.sh
        sudo rm $DEST_DIR/updatedns.sh
        ;;
esac

