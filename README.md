Simple usage:

Create mysql container:
$ make dockermysql NAME="wp.db" PASS="wppass"

Import db from sql file (You need to have CREATE DATABASE within)
$ make mysqlrestoredb  NAME="wp.db" PASS="wppass" SQLFILE="wordpress.sql" DATABASE="wordpress"


Full mysql backup 
$ make mysqlbackupfull NAME="wp.db" PASS="wppass" FULLSQLFILE="wpdb.sql"

Full mysql restore
$ make mysqlrestorefull NAME="wp.db" PASS="wppass" FULLSQLFILE="wpdb.sql-20150203012651"

Backup one database from your mysql server
$ make mysqlbackupdb NAME="wp.db" PASS="wppass" SQLFILE="wordpress.sql" DATABASE="wordpress"

Restore one database from your mysql server
$ make mysqlrestoredb  NAME="wp.db" PASS="wppass" SQLFILE="wordpress.sql-20150203023814" DATABASE="wordpress"


