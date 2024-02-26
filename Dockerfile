FROM raesene/bwapp

RUN apt-get update -y
RUN apt install mysql-server -y
 #   apt-get install php-mysqlnd -y
#RUN apt-get install apache2 -y
#RUN apt-get install php libapache2-mod-php -y
#RUN a2enmod mpm_prefork && a2enmod php7.4

RUN mysql -u root -e "CREATE USER 'bwapuser'@'localhost' IDENTIFIED BY 'password';"
RUN mysql -u root -e "CREATE DATABASE bWAPP;"
RUN mysql -u root -e "GRANT ALL PRIVILEGES ON bWAPP.* TO 'bwapuser'@'localhost';"

RUN mkdir -p /var/www/html/bWAPP

COPY /bWAPP /var/www/html/bWAPP

COPY /evil /var/www/html/bWAPP

COPY ClientAccessPolicy.xml /var/www/html/bWAPP

COPY crossdomain.xml /var/www/html/bWAPP

COPY apache2/default  /etc/apache2/sites-available/000-default.conf

COPY apache2/httpd.conf /etc/apache2/conf-available/

RUN service apache2 restart

EXPOSE 80
