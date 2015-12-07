#!/usr/bin/env bash
# Provisioning File for Vagrant
# Installs everything needed for the HiveManagement App
#
# http://blog.osteel.me/posts/2015/01/25/how-to-use-vagrant-on-windows.html
# Setting up Vagrant for SSH if its not working
#

#Start with everything updated
sudo apt-get update

#Install Python3 with Pip
sudo apt-get -y install python3-pip

# Install GIT
sudo apt-get -y install git


#Setup a virtual environment
# - Make Folder
cd /
mkdir /venv
# - Install Virtual Environment
sudo -H pip3 install virtualenv
# - Configure Virtual Environment to use Python3
sudo -H virtualenv /venv -p python3
# Begin using the virtual environment 
source /venv/bin/activate


#Install django
pip3 install django

#Psycopg2 is a tool that lets Python talk to PostgreSQL
# - First, install its dependencies
sudo apt-get -y install libpq-dev python-dev
# - Install Psycopg2
pip3 install psycopg2

#Install REST API
pip3 install djangorestframework

#Install PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib postgresql-9.3-postgis-scripts

echo '===== Creating PostgreSQL databases and users'
sudo -u postgres << EOF
psql "
ALTER USER postgres PASSWORD 'password';
"															
EOF
sudo -u postgres createdb BeeManagement

#Install its GEO-Library 
sudo apt-get install -y PostGIS

#Configure this Django superuser
#python manage.py createsuperuser																	# Need to re-run this
 #admin
 #password

cd /vagrant/
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'password')" | python manage.py shell

python manage.py migrate

python manage.py runserver 0.0.0.0:8000 --noreload;


