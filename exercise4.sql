create database employee;

use employee;

create table jobs(job_id int,job_title varchar(20),min_salary int,max_salary int,primary key(job_id));

create table employees(employee_id int,first_name varchar(20),last_name varchar(20),email varchar(20),phone_number int,hire_date varchar(10),job_id int,salary int,manager_id int,department_id int,primary key(employee_id));

create table dependents(dependent_id int,first_name varchar(20),last_name varchar(20),relationship varchar(20),employee_id int,primary key(dependent_id));

create table departments(department_id int,department_name varchar(20),location_id int,primary key(department_id));

create table regions(region_id int,region_name varchar(20),primary key(region_id));

create table countries(country_id varchar(10),country_name varchar(20),region_id int,primary key(country_id));

create table locations(location_id int,street_address varchar(20),postal_code varchar(20),city varchar(20),state_province varchar(20),country_id varchar(10),primary key(location_id));

desc jobs;
desc employees;
desc dependents;
desc departments;
desc regions;
desc countries;
desc locations;

alter table countries add constraint foreign key countries(region_id) references regions(region_id);

alter table locations add constraint foreign key locations(country_id) references countries(country_id);

alter table departments add constraint foreign key departments(location_id) references locations(location_id);

alter table employees add constraint foreign key employees(department_id) references departments(department_id);

-- alter table employees add constraint foreign key employees(job_id) references jobs(job_id);

alter table dependents add constraint foreign key dependents(employee_id) references employees(employee_id);


insert into regions values(1,"europe"),(2,"america"),(3,"asia"),(4,"africa"),(5,"middle east");

insert into countries values("ar","argentina",1),("au","australia",1),("be","belgium",2),("br","brazil",2),("ca","canada",3),("ch","switzerland",3),("cn","china",4),("de","germany",4),("dk","denmark",5),("eg","egypt",5);

insert into locations values(1000,"jabberwocky road","26192","southlake","texas","au"),(1001,"interiors blvd","99236","san francisco","california","ar"),(1002,"emperior road","80925","munich","bavaria","de"),(1003,"magdalen centre","89087","oxford","oxford park","cn"),(1004,"spandina ave","56432","toronto","ontario","ca");

insert into jobs values(10,"public accountant",35000,55000),(20,"sales accountant",25000,45000),(30,"manager",30000,45000),(40,"poen",15000,26000),(50,"clerk",2000,35000),(60,"programer",10000,50000);

insert into departments values(501,"administration",1000),(502,"marketing",1001),(503,"hr",1002),(504,"it",1004),(505,"finance",1003);
 
insert into employees values(123,"neena","kochhar","neena@gmail.com",86316,"1989-09-21",10,36000,11,501),(234,"rhys","larsen","rhys@gmail.com",56210,"2010-08-11",20,40000,12,502),(345,"stella","harper","stella@gmail.com",91202,"1999-11-23",30,37000,13,503),(456,"rose","elizabeth","rose@gmail.com",61230,"2021-01-02",40,20000,14,504),(567,"kesav","banerjee","kesav@gmail.com",21780,"2008-03-30",60,45000,15,505);

insert into dependents values(1243,"john","kochhar","father",123),(2341,"mathew","chen","husband",345),(2354,"fred","austin","uncle",456),(4536,"uma","urman","mother",234),(7869,"joe","sacaria","mother",567);


select * from regions;

select * from countries;
 
select * from locations;

select * from jobs;

select * from departments;

select * from dependents;


alter table departments rename  to Dept;
select * from Dept;

alter table employees add commission float;
select * from employees;

alter table employees modify salary smallint;
desc employees;



 
