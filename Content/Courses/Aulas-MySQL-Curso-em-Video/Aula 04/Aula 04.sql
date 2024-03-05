create database register
default character set utf8
default collate utf8_general_ci;

CREATE TABLE
people (
id int not null auto_increment,
name varchar(30) not null, 
birth date,
gender enum ('M','F'),
weight decimal (5,2),
nacionality varchar (20) default 'Brasil',
primary key (id)
) default charset = utf8;