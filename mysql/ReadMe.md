# MySQL 

## Connect to server
```bash
mysql -h {hostname} -P 3306 -u{username} -p{password}
```

## Create DB
```bash
create database nodered;
```

## Create user
```bash
create user 'nodered'@'localhost' IDENTIFIED BY 'nodered';
```
## Grant all privileges to user
```bash
grant all privileges on nodered.* to 'nodered'@'localhost';
flush privileges;
```

## Dump database to sql file
```bash
mysqldump -u {username} -p{password} -h {hostname} -P 3306 {db} > db.sql 
```

## Import DB from a sql file
```bash
mysql -u{username} -p{password} < db.sql
```

