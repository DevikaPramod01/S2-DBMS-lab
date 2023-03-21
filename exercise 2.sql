select * from person where name like "a%";
select * from participated where damage_amt>10000;
select * from accident where date between "2021-01-01" and "2023-12-31";
select person.*,vehicle.*from person,vehicle,owns where person.driver_id=owns.driver_id and vehicle.license=owns.license;


