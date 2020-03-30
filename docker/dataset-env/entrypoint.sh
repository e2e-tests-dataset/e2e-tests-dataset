#!/bin/bash
/usr/bin/Xvfb :99 -screen 0 1024x768x16 > /var/log/xvfb 2>&1 &
x11vnc -forever -usepw -create > /var/log/x11vnc 2>&1 &
/bin/bash