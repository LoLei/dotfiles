cd /etc/httpd/conf
cp httpd.conf httpd-bak.conf
sed -i '510d' httpd.conf
systemctl start httpd
cp httpd-bak.conf httpd.conf
