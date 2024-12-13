#!/bin/bash


echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
systemctl restart sshd.service

yum install httpd php -y

mkdir -p /var/www/html/billing/

echo "testing" > /var/www/html/billing/health.html

cat <<EOF > /var/www/html/billing/index.php
<?php
\$output = shell_exec('echo $HOSTNAME');
echo "<h1><center><pre>\$output</pre></center></h1>";
echo "<h1><center>Demo Website Version3</center></h1>";
?>
EOF


systemctl restart httpd.service php-fpm.service
systemctl enable httpd.service php-fpm.service
