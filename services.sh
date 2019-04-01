#!/bin/bash
cd /usr/share/nginx/backend/ && python3 . &
nginx -g 'daemon off;'