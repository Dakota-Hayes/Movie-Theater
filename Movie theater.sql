create table movie (
	movie_id serial primary key,
	movie_name varchar(100)	
);

insert into movie (movie_id,movie_name) values (0,'movie_0');
insert into movie (movie_id,movie_name) values (1,'movie_1');
insert into movie (movie_id,movie_name) values (2,'movie_2');
insert into movie (movie_id,movie_name) values (3,'movie_3');
insert into movie (movie_id,movie_name) values (4,'movie_4');

create table ticket (
	ticket_id serial primary key,
	movie_id int,
	foreign key (movie_id) references movie(movie_id)
);

insert into ticket (ticket_id,movie_id) values (0,0);
insert into ticket (ticket_id,movie_id) values (1,0);
insert into ticket (ticket_id,movie_id) values (2,0);
insert into ticket (ticket_id,movie_id) values (3,0);
insert into ticket (ticket_id,movie_id) values (4,0);

create table brand (
	brand_id serial primary key,
	brand_rep varchar(100),
	brand_contact varchar(150)
);

insert into brand (brand_id, brand_rep, brand_contact) values (0,'brand_rep_0','brand_contact_0');
insert into brand (brand_id, brand_rep, brand_contact) values (1,'brand_rep_1','brand_contact_1');
insert into brand (brand_id, brand_rep, brand_contact) values (2,'brand_rep_2','brand_contact_2');
insert into brand (brand_id, brand_rep, brand_contact) values (3,'brand_rep_3','brand_contact_3');
insert into brand (brand_id, brand_rep, brand_contact) values (4,'brand_rep_4','brand_contact_4');

create table concession (
	concession_id serial primary key,
	brand_id int,
	foreign key (brand_id) references brand(brand_id)
);

insert into concession (concession_id,brand_id) values (0,0);
insert into concession (concession_id,brand_id) values (1,1);
insert into concession (concession_id,brand_id) values (2,2);
insert into concession (concession_id,brand_id) values (3,3);
insert into concession (concession_id,brand_id) values (4,4);

create table product (
	product_id serial primary key,
	description varchar(150),
	ticket_id int,
	concession_id int,
	foreign key (ticket_id) references ticket(ticket_id),
	foreign key (concession_id) references concession(concession_id)
);

insert into product (product_id,description,ticket_id,concession_id) values (0,'product_0',0,0);
insert into product (product_id,description,ticket_id,concession_id) values (1,'product_1',1,1);
insert into product (product_id,description,ticket_id,concession_id) values (2,'product_2',2,2);
insert into product (product_id,description,ticket_id,concession_id) values (3,'product_3',3,3);
insert into product (product_id,description,ticket_id,concession_id) values (4,'product_4',4,4);

create table inventory (
	inventory_id serial primary key,
	upc varchar(100),
	price numeric(5,2),
	quantity_available int,
	product_id int,
	description varchar(150),
	foreign key (product_id) references product(product_id)
);

insert into inventory (inventory_id,upc,price,quantity_available,product_id,description) values (0,'0',00.00,0,0,'description_0');
insert into inventory (inventory_id,upc,price,quantity_available,product_id,description) values (1,'1',11.11,1,1,'description_1');
insert into inventory (inventory_id,upc,price,quantity_available,product_id,description) values (2,'2',22.22,2,2,'description_2');
insert into inventory (inventory_id,upc,price,quantity_available,product_id,description) values (3,'3',33.33,3,3,'description_3');
insert into inventory (inventory_id,upc,price,quantity_available,product_id,description) values (4,'4',44.44,4,4,'description_4');

create table order_ (
	order_id serial primary key,
	quantity_requested integer,
	total_price numeric (10,2),
	tax numeric (5,2),
	sub_total numeric (10,2),
	change_ numeric (5,2),
	inventory_id int,
	foreign key (inventory_id) references inventory (inventory_id)
);

insert into order_ (order_id,quantity_requested,total_price,tax,sub_total,change_,inventory_id) values (0,0,00.00,00.00,00.00,00.00,0);
insert into order_ (order_id,quantity_requested,total_price,tax,sub_total,change_,inventory_id) values (1,1,11.11,11.11,11.11,11.11,1);
insert into order_ (order_id,quantity_requested,total_price,tax,sub_total,change_,inventory_id) values (2,2,22.22,22.22,22.22,22.22,2);
insert into order_ (order_id,quantity_requested,total_price,tax,sub_total,change_,inventory_id) values (3,3,33.33,33.33,33.33,33.33,3);
insert into order_ (order_id,quantity_requested,total_price,tax,sub_total,change_,inventory_id) values (4,4,44.44,44.44,44.44,44.44,4);

create table customer (
	customer_id serial primary key,
	first_name varchar(100),
	last_name varchar(100),
	payment_amount numeric(10,2)
);

insert into customer (customer_id,first_name,last_name,payment_amount) values (0,'customer_first_name_0','customer_last_name_0',00.00);
insert into customer (customer_id,first_name,last_name,payment_amount) values (1,'customer_first_name_1','customer_last_name_1',11.11);
insert into customer (customer_id,first_name,last_name,payment_amount) values (2,'customer_first_name_2','customer_last_name_2',22.22);
insert into customer (customer_id,first_name,last_name,payment_amount) values (3,'customer_first_name_3','customer_last_name_3',33.33);
insert into customer (customer_id,first_name,last_name,payment_amount) values (4,'customer_first_name_4','customer_last_name_4',44.44);

create table checkout (
	checkout_id serial primary key,
	date_of_purchase date,
	order_id int,
	customer_id int,
	foreign key (order_id) references order_(order_id),
	foreign key (customer_id) references customer(customer_id)
);

insert into checkout (checkout_id,date_of_purchase,order_id,customer_id) values (0,now(),0,0);
insert into checkout (checkout_id,date_of_purchase,order_id,customer_id) values (1,now(),1,1);
insert into checkout (checkout_id,date_of_purchase,order_id,customer_id) values (2,now(),2,2);
insert into checkout (checkout_id,date_of_purchase,order_id,customer_id) values (3,now(),3,3);
insert into checkout (checkout_id,date_of_purchase,order_id,customer_id) values (4,now(),4,4);

select * from brand;
select * from checkout;
select * from concession;
select * from customer;
select * from inventory;
select * from movie;
select * from order_;
select * from product;
select * from ticket;