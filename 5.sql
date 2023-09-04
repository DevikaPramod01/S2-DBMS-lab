######TRIGGERS#######
  
create database p;
use p;
#drop database p;
create table prd(pid int,pname varchar(20),price int,qtyinstk int,primary key(pid));
create table sale(sid int,address varchar(10),primary key(sid));
create table saleitem(Sid int,Pid int,qty int,primary key(Sid,Pid));

alter table saleitem add constraint foreign key saleitem(Pid) references prd(pid), add constraint foreign key (Sid) references sale(sid);

DELIMITER //
create trigger valupdate after insert on saleitem for each row 
begin
update prd,saleitem set prd.qtyinstk=prd.qtyinstk-saleitem.qty where saleitem.Pid=prd.pid;
end //
DELIMITER ;

insert into prd values(1,"pen",30,100),(2,"soap",30,50);
insert into sale values(5,"kollam"),(10,"tvm");
insert into saleitem values(5,1,40),(10,2,10);
