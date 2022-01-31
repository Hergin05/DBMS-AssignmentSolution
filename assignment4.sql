create database greatLearning;

1)
create table greatLearning.PASSENGER
 (Passenger_name varchar(20), 
  Category               varchar(20),
   Gender                 varchar(20),
   Boarding_City      varchar(20),
   Destination_City   varchar(20),
  Distance                int,
  Bus_Type             varchar(20)
);

create table greatLearning.PRICE
(
             Bus_Type   varchar(20),
             Distance    int,
              Price      int
          );
          
2)
insert into greatLearning.passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into greatLearning.passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into greatLearning.passenger values('Pallavi','AC','F','panaji','Bengaluru',600,'Sleeper');
insert into greatLearning.passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into greatLearning.passenger values('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into greatLearning.passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into greatLearning.passenger values('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into greatLearning.passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into greatLearning.passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from greatLearning.passenger;

insert into greatLearning.price values('Sleeper',350,770);
insert into greatLearning.price values('Sleeper',500,1100);
insert into greatLearning.price values('Sleeper',600,1320);
insert into greatLearning.price values('Sleeper',700,1540);
insert into greatLearning.price values('Sleeper',1000,2200);
insert into greatLearning.price values('Sleeper',1200,2640);
insert into greatLearning.price values('Sleeper',350,434);
insert into greatLearning.price values('Sitting',500,620);
insert into greatLearning.price values('Sitting',500,620);
insert into greatLearning.price values('Sitting',600,744);
insert into greatLearning.price values('Sitting',700,868);
insert into greatLearning.price values('Sitting',1000,1240);
insert into greatLearning.price values('Sitting',1200,1488);
insert into greatLearning.price values('Sitting',1500,1860);

select * from greatLearning.price;

3)
select Gender, count(Gender) 
from greatLearning.Passenger 
where Distance>=600 
group by Gender ;

4) 
select min(Price) 
from greatLearning.Price 
where Bus_Type = 'Sleeper';

5)
select Passenger_Name 
from greatLearning.Passenger 
where Passenger_Name like 'S%' 
order by Passenger_Name;

6)
select a.Passenger_name,a.Boarding_City,a.Destination_City,a.Bus_type,b.Price 
from greatLearning.Passenger a , greatLearning.Price b 
where (a.Bus_Type = b.Bus_Type and a.Distance = b.Distance);

7)       
select a.Passenger_name,b.Price 
from greatLearning.Passenger a ,greatLearning.Price b 
where (a.Bus_Type = "Sitting" and b.Bus_Type = "Sitting" and a.Distance = 700 and b.Distance=700);

8)
select Price 
from greatLearning.Price 
where distance=(select Distance 
				from greatLearning.Passenger 
                where passenger_name = "Pallavi");

9) 
select distinct(Distance) 
from greatLearning.Passenger 
order by distance desc;

10) 
with total as ( select sum(distance) as total 
				from greatLearning.Passenger)
    select passenger_Name,(distance / total.total)*100 as percentage_travel 
    from greatLearning.Passenger,total ;

11)
select Distance,Price,
CASE 
WHEN
 Price > 1000 THEN "Expensive"
 WHEN Price <1000 and Price > 500 THEN "Average Cost"
 ELSE "cheap" END as Cost FROM greatLearning.price;



