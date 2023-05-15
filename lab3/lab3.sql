-- DDL statements create, modify, and remove database objects such as tables, indexes, and users.
-- Common DDL statements are CREATE, ALTER, and DROP
-- Data Manipulation Language and is typically used to add, retrieve or update data.


Create table if not exists Custumers(
	id Integer Primary key,
	ful_name varchar Not Null,
	timestamp timestamp not null,
	deliver_address text not null
);

Select * From Custumers;

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(123123, 'Pablo Escobar','1978-04-21','Mexico');

UPDATE Custumers SET deliver_address = 'USA'
WHERE deliver_address = 'Mexico';

-- Drop table  Orders;

Create table if not exists Orders(
	code Integer Primary key,
	custumer_id integer,
	total_sum double precision not null,
	is_paid boolean not null,
	FOREIGN KEY (custumer_id) REFERENCES Custumers

);


insert into Orders(code,custumer_id,total_sum,is_paid)
values(87787856,123123,3,true);

insert into Orders(code,custumer_id,total_sum,is_paid)
values(87787857,123123,2,true);

Select * From Orders;

Create table if not exists products(
	id varchar primary key,
	name varchar unique,
	description text,
	price double precision not null
);
-- drop table products;

insert into products(id, name, description, price)
values('21bd030840','chicken', 'so good', 7600 );

insert into products(id, name, description, price)
values('21bd030841','hamburger', 'so so good', 7600 );

Select * From products;

Create Table order_items(
    order_code INTEGER,
    id varchar,
    quantity INTEGER NOT NULL,
    Primary key (order_code,id),
    Foreign key (order_code) REFERENCES orders,
    Foreign key (id) REFERENCES products
);

insert into order_items(order_code,id,quantity)
values(87787856,'21bd030840',5);

insert into order_items(order_code,id,quantity)
values(87787857,'21bd030841',1);


Select * from order_items;


Create type gender as Enum('MALE', 'FAMALE');


Create table if not exists students(
	id serial,
	full_name varchar(255),
	birth_date date,
	gender gender,
	gpa real,
	info_about text,
	need_dorm boolean,
	addition_info text,
	primary key(id, full_name)
);


Create table instructor(
	full_name varchar,
	s_language varchar,
	experience integer default 10,
	online boolean


);

ALTER TABLE instructor
ADD PRIMARY KEY (full_name);

Create table Lesson(
	room integer,
	title varchar,
	teaching_instructor varchar,
	studying_students varchar[],
	foreign key (teaching_instructor) References instructor

);

drop table students;

INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Dauren','2004-01-08','MALE',3.44,'OPTIMIST',false,'have a glass');

INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Aigu','2002-08-04','FAMALE',3.2,'model',false,'beautiful');


INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Ainur','2004-02-02','FAMALE',3.1,'None',false,'hot');

INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Aizhan','2004-01-08','FAMALE',2.25,'Singer',false,'lover');


INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Aidos','2005-01-06','MALE',3.1,'Karatist',false,'good Karatist');


INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Aida','2001-01-03','FAMALE',3.2,'dancer',false,'good girl');


INSERT INTO students(full_name, birth_date, gender,
					 gpa, info_about, need_dorm, addition_info)
VALUES ('Ansar','2004-04-24','MALE',4.0,'Footballer',true,'GOAT');

select * from students;
delete from students where full_name = 'Dauren';


INSERT INTO instructor(full_name, s_language, experience, online)
VALUES ('Ilon Musk', 'english', 25, true);
SELECT * FROM instructor;


INSERT INTO custumers(id, ful_name, timestamp, deliver_address)
VALUES (23, 'Gauhar ', '2004-05-07', 'tole bi');


select * from custumers;

select * from orders;

INSERT INTO orders(code, total_sum, is_paid)
VALUES (1233, 12,  true);

DELETE FROM orders WHERE custumer_id is NULL;



SELECT * FROM custumers;


insert into Custumers(id,ful_name,timestamp,deliver_address)
values(10, 'Lionel Messi','1985-06-24','Argentina');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(7, 'Cristiano Ronaldo','1984-03-22','Portugal');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(9, 'Karim Benzema','1989-01-12','France');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(11, 'Neymar Jr.','1991-02-05','Brazil');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(1, 'Ter Stegen','1993-05-03','Germany');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(5, 'Sergio Busquets','1987-05-14','Spain');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(4, 'Ivan Rakitic','1993-02-12','Crotia');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(8, 'Andres Iniesta','1984-05-11','Spain');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(6, 'Xavi Ernandes','1984-03-01','Spain');

insert into Custumers(id,ful_name,timestamp,deliver_address)
values(3, 'Jerar Pique','1988-12-31','Spain');



insert into Orders(code,custumer_id,total_sum,is_paid)
values(123,123123,3,true),
	(124,1,14,false),
	(125,3,1,true),
	(126,5,6,false),
	(127,7,3,true),
	(128,8,6,true),
	(129,9,1,true),
	(130,10,34,true),
	(131,11,12,false),
	(132,10,23,false);


SELECT * FROM Orders;


insert into products(id, name, description, price)
values('21bd0308450','Sosiska', 'fried', 1300 );

insert into products(id, name, description, price)
values('21bd030842','Water', 'fresh', 150 );


insert into products(id, name, description, price)
values('21bd030843','Fanta', 'orange', 300 );


insert into products(id, name, description, price)
values('21bd030844','Twiks', 'choose one', 260 );


insert into products(id, name, description, price)
values('21bd030845','Bounty', 'Sweety', 245 );


insert into products(id, name, description, price)
values('21bd030846','M&Ms', 'supeer', 250 );



SELECT * FROM products order by id ASC;



Update products
set price = 1500
Where name = 'hamburger';

Update products
set id = '21bd030850'
Where name = 'Sosiska';

insert into order_items(order_code,id,quantity)
values(123,'21bd030842',3);

insert into order_items(order_code,id,quantity)
values(125,'21bd030841',1);

insert into order_items(order_code,id,quantity)
values(127,'21bd030845',1);

insert into order_items(order_code,id,quantity)
values(130,'21bd030843',1);



update order_items
set order_code = 131
where id = '21bd030840';



update Orders
set custumer_id = 10
where code = 123;

update Orders
set code = 133
where custumer_id = 11 and total_sum = 3 ;

update Orders
set custumer_id = 11
where code = 87787856;

update Orders
set custumer_id = 7
where code = 87787857;

update custumers
set ful_name = 'Askar'
where id = 21;

update custumers
set id = 12
where deliver_address = 'USA';

Update products
set price = 1500
Where name = 'hamburger';

Update products
set id = '21bd030850'
Where name = 'Sosiska';

delete from order_items
where order_code = 87787857;

delete from Orders
where code = 87787857;

delete from Orders
where code = 87787856;

select distinct on (order_code) *
from order_items;

select * from order_items;
SELECT * FROM products order by id ASC;
SELECT * FROM Orders;
SELECT * FROM custumers;

alter table order_items
add price Integer ;

alter table products
add mass float;


alter table products
drop mass ;

alter table products
add mass float
default 1.0;

alter table order_items
drop price;

select * from order_items



