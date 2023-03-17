create database Insurance;

use Insurance;

create table person (driver_id int, name varchar(20), address varchar(20), primary key(driver_id)); 
create table car (license int, model varchar(20), year int, primary key(license));
create table accident(report_no int, date date, location varchar(20), primary key(report_no));
create table owns(driver_id int, license int, primary key(driver_id,license));
create table participated(report_no int , license int, driver_id int, damage_amt int, primary key(report_no, license));

alter table owns add constraint foreign key owns(driver_id) references person(driver_id),add constraint foreign key owns(license) references car(license); 

alter table participated add constraint foreign key participated(report_no) references accident(report_no), add constraint foreign key participated(license) references car(license);

alter table car rename vehicle;

alter table accident change column report_no report_number int;

alter table person add gender varchar(20);

alter table accident drop location;

alter table participated modify damage_amt numeric(7,2);

insert into person (driver_id,name,address,gender)values("101","akshay","ak house","m"),("202","anusha","an vila","f"),("303","catherine","ca house","f"),("401","kiran","kk nivas","m"),("451","raj","raj nivas","m");

insert into accident(report_no,date)values("4563","2019-11-28"),("5671","2022-09-12"),("8230","2005-03-11"),("9056","2023-07-14"),("5633","2005-05-19");

insert into accident(report_number,date)values("4563","2014-11-28"),("5671","2022-09-12"),("8230","2005-03-11"),("9056","2019-07-14"),("5633","2005-05-19");

insert into owns(driver_id,license)values("101","1001"),("202","6002"),("303","3567"),("401","5008"),("451","7622");

insert into participated (report_no ,license ,driver_id ,damage_amt)values("4563","1001","101","15650.55"),("5671","6002","202","09830.75"),("8230","3567","303","24892.88"),("9056","5008","401","08450.90"),("5633","7622","451","06500.25");

select * from person where name like "a%";
select * from participated where damage_amt>10000;
select * from accident where date between "2021-01-01" and "2023-12-31";

