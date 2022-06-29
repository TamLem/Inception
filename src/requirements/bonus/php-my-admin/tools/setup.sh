#!/bin/sh

if [ ! -d /var/www/html/phpmyadmin ]; then
	echo "=> Installing phpMyAdmin"
	cd /tmp
	wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz 1>/dev/null 
	tar -xf phpMyAdmin-5.0.2-all-languages.tar.gz
	mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
	chmod -R 777 /var/www/html/phpmyadmin
	rm -rf phpMyAdmin-*	
	cd /var/www/html/phpmyadmin
	cp config.sample.inc.php config.inc.php
	chmod 644 config.inc.php
	sed -i "s/localhost/db/g" config.inc.php
fi

