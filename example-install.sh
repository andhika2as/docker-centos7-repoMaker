#!/bin/sh

echo "===== Installing required extras repo ====="
  yum install epel-release yum-utils -y
  yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
  yum-config-manager --enable remi-php73
  yum install  https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm -y
#  yum install https://extras.getpagespeed.com/release-el7-latest.rpm -y

echo "===== yumdownloader in folder: ====="
mkdir repo
cd repo
pwd
echo ""
yumdownloader --resolve epel-release git nginx \
  php php-common php-cli php-fpm
