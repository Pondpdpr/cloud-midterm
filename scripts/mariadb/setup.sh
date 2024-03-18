#!/bin/bash
git clone https://github.com/Pondpdpr/cloud-midterm.git
cd cloud-midterm/scripts/mariadb
export DB_NAME=wordpress-db
export DB_USER=wordpress-user
export DB_PASS=admin

sudo apt update
sudo apt install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
python3 gen_setup_sql.py -n $DB_NAME -u $DB_USER -p $DB_PASS
sudo mysql -u root < mariadb_wp_setup.sql
sudo python3 mariadb_binding_addr.py
sudo systemctl restart mariadb