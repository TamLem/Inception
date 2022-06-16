/usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --verbose=0 --skip-networking=0 --bootstrap < /init.sql

/usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql
# while !(mysqladmin ping -S /tmp/mysqld.sock)
# do
#    sleep 3
#    echo "waiting for mysql ..."
# done
# echo "starting the inital script" 
# cat init.sql | mariadb -S /tmp/mysqld.sock
