#!/bin/bash

# Install apache

/usr/bin/yum install httpd -y

# Putting the Hello World html in place

cat > /var/www/html/index.html <<EOD
<html><head><title>${HOSTNAME}</title></head><body><h1>${HOSTNAME}</h1>
<p>Hello World by ${HOSTNAME}.</p>
</body></html>
EOD

# Restarting apache

/usr/bin/systemctl restart httpd
