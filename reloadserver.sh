#!/bin/bash

case "$OSTYPE" in
    darwin*)
        DEST_DIR="/opt/homebrew/var/www"

        sudo rm -rf $DEST_DIR/*
        sudo cp -r * $DEST_DIR
        sudo cp .htaccess $DEST_DIR
        sudo rm $DEST_DIR/reload_server.sh
        sudo rm $DEST_DIR/dns_update.sh
        ;; 
    linux*)
        DEST_DIR="/srv/http"

        sudo rm -rf $DEST_DIR/*
        sudo cp -r * $DEST_DIR
        sudo cp .htaccess $DEST_DIR
        sudo rm $DEST_DIR/reload_server.sh
        sudo rm $DEST_DIR/dns_update.sh
        ;;
esac

