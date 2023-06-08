create database bank;

use bank;

create table branch(branch_name varchar(50),branch_city varchar(50),assets int,primary key(branch_name));
create table customer(customer_name varchar(50),customer_street varchar(50),customer_city varchar(50),primary key(customer_name));
create table loan(loan_number int,branch_name varchar(50),amount float,primary key(loan_number));
create table borrower(customer_name varchar(50),loan_number int,primary key(customer_name,loan_number));
create table accountt(account_number varchar(50),branch_name varchar(50),balance float,primary key(account_number));
create table depositor(customer_name varchar(50),account_number varchar(50),primary key(customer_name,account_number));

alter table loan add constraint foreign key loan(branch_name) references branch(branch_name);

alter table borrower add constraint foreign key borrower(customer_name) references customer(customer_name);

alter table borrower add constraint foreign key borrower(loan_number) references loan(loan_number);

alter table accountt add constraint foreign key accountt(branch_name) references branch(branch_name);
 
alter table  depositor add constraint foreign key depositor(account_number) references accountt(account_number);

desc loan;
desc borrower;
desc customer;
desc branch;
desc accountt;
desc depositor;

insert into branch values("sbik","kollam",95000),("sbit","tvm",99000),("indk","kottayam",90000),("icici","idukki",98000),("indw","wayanad",97000);
insert into customer values("smith","kottarakara","kollam"),("raj","sreekaryam","trivandrum"),("susan","kottarakara","kollam"),("mary","harrison","america"),("peter","harrison","america");
insert into loan values(1023,"sbik","56000"),(5098,"sbit",45291),(3421,"indk",34000),(6755,"icici",10000),(9870,"indw",86550);
insert into borrower values("smith",1023),("raj",5098),("susan",3421),("mary",6755),("peter",9870);
insert into accountt values("sbi7768","sbik",2500),("sbi1045","sbit",10000),("ind0045","indk",20000),("ic1010","icici",40000),("ind0195","indw",6000);
insert into depositor values("smith","sbi7768"),("raj","sbi1045"),("susan","ind0045"),("mary","ic1010"),("peter","ind0195");

select * from branch; 
select * from customer;
select * from loan;
select * from borrower;
select * from accountt;
select * from depositor;



select c.customer_name from customer c inner join borrower b inner join loan l on b.customer_name = c.customer_name and l.loan_number = b.loan_number = b.loan_number where amount=0;

select customer_name from customer where customer_street="kottarakara" and customer_city="kollam";

select c.customer_name, a.branch_name from customer c inner join depositor d inner join accountt a on a.account_number = d.customer_name where customer_city = "harrison";
