Create database if not exists id8872570_icnt;
Create database if not exists id8872570_cordeiro;
Create database if not exists rodDB;

CREATE USER 'id8872570_cordeiro'@'localhost' IDENTIFIED BY "@C0rdeiro";
GRANT ALL PRIVILEGES ON 'id8872570_icnt'.* TO 'id8872570_cordeiro'@'localhost';

CREATE USER 'tester'@'localhost' IDENTIFIED BY "@Testing";
GRANT ALL PRIVILEGES ON *.* TO 'tester'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

use rodDB;
Drop table `Person`;
CREATE TABLE `Person` (
    `id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO 
    `Person` (`id`, `name`)
VALUES
    (1, 'William'),
    (2, 'Marc'),
    (3, 'John'),
    (4,'RodCordeiro')
;

use id8872570_cordeiro;
CREATE TABLE if Not exists `Person` (
    `id` int(11) NOT NULL,
    `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO 
    `Person` (`id`, `name`)
VALUES
    (4,'RodCordeiro')
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
