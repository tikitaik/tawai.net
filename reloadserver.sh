#!/bin/bash

case "$OSTYPE" in
    darwin*)
        sudo rm -rf /opt/homebrew/var/www/*
        sudo cp -r * /opt/homebrew/var/www
        sudo cp .htaccess /opt/homebrew/var/www
        ;; 
    linux*)
        sudo rm -rf /srv/http/*
        sudo cp -r * /srv/http
        sudo cp .htaccess /srv/http
        ;;
esac
