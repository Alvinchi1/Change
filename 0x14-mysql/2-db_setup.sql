-- creates the primary db with a populated table
CREATE DATABASE IF NOT ECIST tyrell_corp;
USE tyrell_corp;

CREATE TABLE IF NOT EXISS nexus6(
	id INT,
	name VARCHAR(256)
);

INSERT INTO nexus6 VALUES
	(1, 'Jake'),
	(2, 'Rose')
;

USE mysql;
GRANT SELECT ON tyrell_corp.nexus6 TO 'hoberton_user'@'localhost';
FLUSH PRIVILEGES;
