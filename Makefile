PASS="pass"
NAME="mydb"
FULLSQLFILE="alldata.sql"
NOW := $(shell /bin/date "+%Y%m%d%H%M%S")
DATABASE="wordpress"
SQLFILE="wordpress.sql"

test:
	echo mysqlcontainer fullmysqlrestore fullmysqlbackup

mysqlcontainer:
	sudo docker run -ti -d --name $(NAME)-$(NOW) -e MYSQL_ROOT_PASSWORD=$(PASS) mysql

mysqlrestorefull:
	sudo docker run -ti --rm --link $(NAME):db -v $(shell pwd):/backup mysql mysql -h db -u root -p$(PASS) --execute="source /backup/$(FULLSQLFILE)" 

mysqlbackupfull:
	sudo docker run -ti --rm --link $(NAME):db -v $(shell pwd):/backup mysql /bin/bash -c "/usr/bin/mysqldump -h db -u root  -p$(PASS) --all-databases > /backup/$(FULLSQLFILE)-$(NOW)"

mysqlbackupdb:
	sudo docker run -ti --rm --link $(NAME):db -v $(shell pwd):/backup mysql /bin/bash -c "/usr/bin/mysqldump -h db -u root  -p$(PASS) --add-drop-database --databases $(DATABASE) > /backup/$(SQLFILE)-$(NOW)"

mysqlrestoredb:
	sudo docker run -ti --rm --link $(NAME):db -v $(shell pwd):/backup mysql mysql -h db -u root -p$(PASS) --execute="source /backup/$(SQLFILE)" $(DATABASE)



