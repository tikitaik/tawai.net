#!/bin/bash

case "$OSTYPE" in
    darwin*)
        rm -rf /opt/homebrew/var/www/*
        cp -r * /opt/homebrew/var/www
        cp .htaccess /opt/homebrew/var/www
        ;; 
    linux*)
        rm -rf /srv/http/*
        cp -r * /srv/http
        cp -r .htaccess /srv/http
        ;;
esac
