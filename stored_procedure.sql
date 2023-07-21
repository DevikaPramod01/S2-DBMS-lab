create database stores;

use stores;
create table prd(id int,pnmae varchar(10),price int,qty int);

DELIMITER //
create procedure insertprd(in barcode int,in pdname varchar(20),in price int,in qtyinstk int)
begin
if price >0 and qtyinstk >=0 
then 
insert into prd values(barcode,pdname,price,qtyinstk);
end if;
end //
DELIMITER ;

call insertprd(1,"pen",30,50);
call insertprd(2,"pencil",30,0);
call insertprd(2,"pencil",0,80);

select * from prd;


