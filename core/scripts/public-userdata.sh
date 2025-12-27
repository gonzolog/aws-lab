#!/bin/bash
set -e

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

echo "<h1>Hello from Ben's Terraform Lab</h1>" > /var/www/html/index.html