#!/bin/bash

case "$OSTYPE" in
    darwin*)
        DEST_DIR="/opt/homebrew/var/www"

        sudo rm -rf $DEST_DIR/*
        sudo cp -r * $DEST_DIR
        sudo cp .htaccess $DEST_DIR
        sudo rm -rf $DEST_DIR/scripts
        sudo rm $DEST_DIR/todo.txt
        sudo rm $DEST_DIR/README.md
        ;; 
    linux*)
        DEST_DIR="/srv/http"

        sudo rm -rf $DEST_DIR/*
        sudo cp -r * $DEST_DIR
        sudo cp .htaccess $DEST_DIR
        sudo rm -rf $DEST_DIR/scripts
        sudo rm $DEST_DIR/todo.txt
        sudo rm $DEST_DIR/README.md
        ;;
esac

