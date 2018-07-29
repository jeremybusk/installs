#!/usr/bin/env bash
wget https://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+bionic_all.deb
dpkg -i zabbix-release_3.4-1+bionic_all.deb
apt update

apt install zabbix-server-pgsql zabbix-frontend-php php-pgsql zabbix-agent

sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix
zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
