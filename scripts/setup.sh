#!/bin/bash

yum install -y httpd
systemctl enable  httpd.service
systemctl start  httpd.service
cd /var/www/html/
sudo wget https://objectstorage.us-ashburn-1.oraclecloud.com/p/u8j40_AS-7pRypC5boQT24w5QFPDTy-0j27BWBOfmsxbERTiuDtJQBIqfcsOH81F/n/idqfa2z2mift/b/bootcamp-oci/o/oci-f-handson-modulo-compute-website-files.zip 
sudo unzip oci-f-handson-modulo-compute-website-files.zip 
sudo chown -R apache:apache /var/www/html
firewall-offline-cmd --add-service=http
systemctl enable  firewalld
systemctl restart  firewalld