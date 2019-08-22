# MySQL 

## Connect to server
```bash
mysql -h {hostname} -P 3306 -u{username} -p{password}
```

## Dump database to sql file
```bash
mysqldump -u {username} -p{password} -h {hostname} -P 3306 {db} > db.sql 
```

## Import DB from a sql file
```bash
mysql -u{username} -p{password} < db.sql
```

