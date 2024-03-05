desc people;

alter table people add column profession varchar (10);

alter table people drop column profession;

alter table people add column profession varchar (10) after name;

alter table people add column code int first;

alter table people modify column profession varchar (35) not null default '';

alter table people rename to peopletable;

create table if not exists course (
name varchar (30) not null unique,
description text,
workload int unsigned,
classes int unsigned,
year year default '2023') default charset=utf8;

describe course;

alter table course add column courseid int first;

alter table course add primary key (courseid);

