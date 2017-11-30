## Install mariadb on CentOS (Not Secured)

* run "sudo yum install -y mariadb*"
* run "sudo systemctl enable mariadb.service"
* run "sudo systemctl start mariadb.service"
* run "mysql_secure_installation"
* --specify the password to be "[your_password]" for the root user
* --allow remote and disable anonimous login 
* run "mysql -u root -p[your_password]" and login as root user
* run the following sql queries:
* --CREATE USER 'root'@'%' IDENTIFIED BY '[your_password]';
* --GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
* --GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
* --CREATE DATABASE [your_database] CHARACTER SET utf8 COLLATE utf8_unicode_ci;
* --SET GLOBAL max_allowed_packet=268435456;

* after quite the mysql console, copy the my.cnf in this folder to /etc/my.cnf
* run "sudo systemctl restart mariadb.service"
