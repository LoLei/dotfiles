#!/bin/sh
cd /tmp
wget https://raw.githubusercontent.com/endeavoursc/firefox-overlay-scrollbars-win10/master/userChrome.css
wget https://raw.githubusercontent.com/endeavoursc/firefox-overlay-scrollbars-win10/master/userChrome.js
wget https://raw.githubusercontent.com/endeavoursc/firefox-overlay-scrollbars-win10/master/userChrome.xml

cd ~/.mozilla/firefox/qrbjv3fn.default/chrome
mv /tmp/userChrome.css .
mv /tmp/userChrome.js .
mv /tmp/userChrome.xml .
