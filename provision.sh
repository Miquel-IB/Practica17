#!/bin/bash

# Actualizamos e instalamos la aplicaciones de lamp y adminer

apt-get update
apt install -y apache2
apt-get install -y php5 libapache2-mod-php5 php5-mysql
sudo systemctl restart apache2

# Agregamos el prorama adminer de github a nuestra página apache2
cd /var/www/html
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysql.php
mv adminer-4.3.1-mysql.php adminer.php

# En esta parte instalamos mysql-server y creamos un usuario con la contraseña root para poder acceder a mysql
apt-get -y install debconf-utils

DB_ROOT_PASSWD=root
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

apt-get install -y mysql-server
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos el servicio de mysql
/etc/init.d/mysql restart

mysql -uroot mysql -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$DB_ROOT_PASSWD'; FLUSH PRIVILEGES;"
