#!/bin/sh

mkdir -p /var/www/html

adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /var/www/html

echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

echo "FTP started on port 21..."

vsftpd /etc/vsftpd/vsftpd.conf