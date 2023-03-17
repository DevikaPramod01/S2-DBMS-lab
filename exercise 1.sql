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

