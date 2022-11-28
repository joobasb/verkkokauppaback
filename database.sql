drop database if exists verkkokauppatesti1;

create database verkkokauppatesti1;

use verkkokauppatesti1;

create table category (
  id int primary key auto_increment,
  name varchar(50) not null
);

create table product (
  id int primary key auto_increment,
  name varchar(100) not null,
  price double (10,2) not null,
  percent double (10,2),
  image varchar(50),
  category_id int not null,
  index category_id(category_id),
  foreign key (category_id) references category(id)
  on delete restrict
);

insert into category (name) values ('Vaaleat oluet');
insert into category (name) values ('Tummat oluet');
insert into category (name) values ('Erikoisoluet');
insert into category (name) values ('Oheistuotteet');

insert into product (name, price, category_id, percent, image) values ('PHP-Lager', 4.20, 1, 4.6, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('JavascrIPA', 5.00, 1, 6.0, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('React Porter', 5.50, 2, 6.2, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('DebuGOSE', 4.2, 3, 3.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image)values ('Tuoppi', 10.00, 4, NULL, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('FullStack Double Ipa', 9.40, 1, 10.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('Node Stout', 8.00, 2, 9.0, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('T-paita', 20.00, 4, NULL, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('MySqLager', 4.00, 1, 5.0, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('HTML Pilsner', 4.50, 1, 4.6, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('C# Sour', 4.50, 3, 5.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('Pirkka Lager', 2.00, 1, 4.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('Koff Lager', 2.00, 1, 4.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('Karhu Lager', 2.00, 1, 4.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('Pirkka Lager', 2.00, 1, 4.5, 'placeholder.png');
insert into product (name, price, category_id, percent, image) values ('Python Pale Ale', 6.00, 1, 6.0, 'placeholder.png');