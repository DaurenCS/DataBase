Create table if not exists Custumers(
id Integer Primary key,
ful_name varchar(255) Not Null,
timestamp timestamp not null,
deliver_address text not null
);

alter table Custumers
add check ( timestamp > '1960-01-01');

alter table custumers
alter column id set not null;

-- insert into Custumers
-- values (12,'Vito-Scaletto', '1954-11-12','USA');

select  * from Custumers;


Create table if not exists Orders(
code Integer Primary key,
custumer_id integer,
total_sum double precision not null,
is_paid boolean not null

);
delete from Orders where custumer_id is null;

alter table Orders
add check (custumer_id is not null);

select * from  Orders;


Create Table order_items(
   order_code INTEGER,
   product_id varchar,
   quantity INTEGER NOT NULL,
   Primary key (order_code, product_id),
   Foreign key (order_code) REFERENCES orders,
   Foreign key (product_id) REFERENCES products
);

Create table if not exists students(
id serial,
full_name varchar(255),
birth_date date,
gender gender,
gpa real,
info_about text,
need_dom boolean,
addition_info text,
primary key(id, full_name)
);
select * from Orders;

alter table students
add check ( id > 0 );

SELECT * from students cross join instructor;

SELECT * from students cross join instructor
where instructor.name = 'Wu' or instructor.name = 'Mozart';

Select * from Custumers inner join orders o on Custumers.id =o.custumer_id;

Select custumer_id, ful_name,deliver_address,code from Orders inner join Custumers c on Orders.custumer_id =c.id;

Select * from Custumers left join orders o on Custumers.id =o.custumer_id;

Select custumer_id, ful_name,deliver_address,code from Orders left join Custumers c on Orders.custumer_id =c.id;

Select * from Custumers right join orders o on Custumers.id =o.custumer_id;

Select custumer_id, ful_name,deliver_address,code from Orders right join Custumers c on Orders.custumer_id =c.id;










Create table instructors(
full_name varchar(255),
s_language varchar,
experience integer default 10,
online boolean

);
