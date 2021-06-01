-- Script para PostgreSQL 10
-- Crear el usuario devuser/password
-- Modificar la seguridad pg_hba.conf

create table sportshop.order(
   id serial,
   created date not null, 
   customerid integer not null, 
   mount numeric(7,2) , 
   constraint order_pk primary key(id) 
);

create table sportshop.customer(
   id serial, 
   name varchar(32) not null, 
   address varchar(64), 
   email varchar(32) not null,
   constraint customer_pk primary key(id)
);

create table sportshop.product(
   id serial,
   name varchar(32) not null,
   price numeric(7,2) not null,
   stock integer not null,
   constraint product_pk primary key(id)
);

create table sportshop.item(
  id serial,
  idorder integer not null references sportshop.order(id),
  idproduct  integer not null references sportshop.product(id),
  count integer not null,
  price numeric(7,2),
  discount numeric(7,2),
  constraint item_pk primary key(id) 
);

insert into sportshop.product(name, price,stock)
values('trousers', 120,500);

insert into sportshop.product(name, price,stock)
values('shirt', 80,500);

insert into sportshop.product(name, price,stock)
values('t-shirt', 60,500);

insert into sportshop.product(name, price,stock)
values('sneakers', 170,500);

insert into sportshop.product(name, price,stock)
values('shoes', 180,500);

insert into sportshop.product(name, price,stock)
values('tights', 30,500);

insert into sportshop.product(name, price,stock)
values('cap', 50,500);

insert into sportshop.product(name, price,stock)
values('sock', 45,500);

insert into sportshop.product(name, price,stock)
values('sweater', 160,500);


insert into sportshop.customer(name, address,email)
values('Juan Gonzales', 'Av. R. Navarrete 183 San Isidro','jgonzales@gmail.com');

insert into sportshop.customer(name, address,email)
values('Alfonso Ramirez', 'Av. Las Begonias 164 San Isidro','aramirez@gmail.com');

insert into sportshop.customer(name, address,email)
values('Jose de Marzo', 'Av. Los Jazmines 175 San Isidro','jdemarzo@gmail.com');

insert into sportshop.customer(name, address,email)
values('Carlos Vermejo', 'Av. JC Tello 145 Miraflores','cvermejo@gmail.com');

insert into sportshop.customer(name, address,email)
values('Miguel Rodriguez', 'Av. Ricardo Palma 567 Miraflores','mrodriguez@gmail.com');



insert into sportshop.order(created, customerid)
values('2021-05-10', 1);

insert into sportshop.order(created, customerid)
values('2021-05-11', 1);

insert into sportshop.order(created, customerid)
values('2021-05-12', 1);

insert into sportshop.order(created, customerid)
values('2021-05-10', 2);

insert into sportshop.order(created, customerid)
values('2021-05-11', 2);

insert into sportshop.order(created, customerid)
values('2021-05-12', 3);

insert into sportshop.order(created, customerid)
values('2021-05-10', 3);

insert into sportshop.order(created, customerid)
values('2021-05-13', 3);

insert into sportshop.order(created, customerid)
values('2021-05-10', 4);

insert into sportshop.order(created, customerid)
values('2021-05-11', 4);

insert into sportshop.order(created, customerid)
values('2021-05-12', 4);

insert into sportshop.order(created, customerid)
values('2021-05-10', 4);

insert into sportshop.order(created, customerid)
values('2021-05-11', 5);

insert into sportshop.order(created, customerid)
values('2021-05-12', 6);



insert into sportshop.item(idorder,idproduct, count)
values(1,1,10);

insert into sportshop.item(idorder,idproduct, count)
values(1,2,12);

insert into sportshop.item(idorder,idproduct, count)
values(1,3,11);

insert into sportshop.item(idorder,idproduct, count)
values(1,4,9);


insert into sportshop.item(idorder,idproduct, count)
values(2,1,10);

insert into sportshop.item(idorder,idproduct, count)
values(2,2,12);

insert into sportshop.item(idorder,idproduct, count)
values(2,3,18);

insert into sportshop.item(idorder,idproduct, count)
values(2,4,19);



insert into sportshop.item(idorder,idproduct, count)
values(3,1,12);

insert into sportshop.item(idorder,idproduct, count)
values(3,2,20);

insert into sportshop.item(idorder,idproduct, count)
values(3,5,17);

insert into sportshop.item(idorder,idproduct, count)
values(3,6,19);

