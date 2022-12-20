drop database if exists verkkokauppatesti1;

create database verkkokauppatesti1;

use verkkokauppatesti1;


CREATE TABLE user(  
    id int primary key AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    passwd VARCHAR(255) NOT NULL,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    address varchar(50) not null,
    zip varchar(10) not null,
    city varchar(30) not null
) DEFAULT CHARSET UTF8 COMMENT '';

create table category (
  id int primary key auto_increment,
  name varchar(50) not null
);

create table product (
  id int primary key auto_increment,
  name varchar(100) not null,
  brewery varchar(255),
  price double (10,2) not null,
  percent double (10,2),
  image varchar(50),
  description varchar(255),
  category_id int not null,
  index category_id(category_id),
  foreign key (category_id) references category(id)
  on delete restrict
);


/* create table customer (
  id int primary key AUTO_INCREMENT,
  firstname varchar(50) not null,
  lastname varchar(50) not null,
  address varchar(50) not null,
  zip varchar(10) not null,
  city varchar(30) not null,
  email varchar(255) not null
); */

create table `order` (
  id int PRIMARY key AUTO_INCREMENT,
  order_date timestamp default CURRENT_TIMESTAMP,
  user_id int not null,
  index user_id(user_id),
  foreign key (user_id) references user(id)
  on delete restrict
);

create table order_row (
  order_id int not null,
  index order_id(order_id),
  foreign key (order_id) references `order`(id)
  on delete restrict,
  product_id int not null,
  index product_id(product_id),
  foreign key (product_id) references product(id)
  on delete restrict,
  amount int not null
);

insert into category (name) values ('Vaaleat oluet');
insert into category (name) values ('Tummat oluet');
insert into category (name) values ('Erikoisoluet');
insert into category (name) values ('Oheistuotteet');

insert into product (name, brewery, price, category_id, percent, image, description) values ('PHP-Lager', 'PBC', 4.20, 1, 4.6, '1.png', 'Perinteinen lagerolut, joka on tuotevakimoimamme suosituin!');
insert into product (name, brewery, price, category_id, percent, image, description) values ('JavascrIPA', 'PBC', 5.00, 1, 6.0, '2.png', 'Voimakkaan humalainen ja raikas IPA olut');
insert into product (name, brewery, price, category_id, percent, image, description) values ('React Porter', 'PBC', 5.50, 2, 6.2, '9.png', 'Tumma ja erittäin maltainen pintahiiva olut, joka sopii erinomaisesti ruokajuomaksi');
insert into product (name, brewery, price, category_id, percent, image, description) values ('DebuGOSE', 'PBC', 4.2, 3, 3.5, '11.png', 'Perinteinen saksalaistyyppinen vehnäolut, jossa ripaus korianteria');
insert into product (name, brewery, price, category_id, percent, image, description)values ('Tuoppi', 'PBC', 10.00, 4, NULL, '14.png', 'Tähän tyylikkääseen tuoppiin mahtuu kokonaisen pintin verran');
insert into product (name, brewery, price, category_id, percent, image, description) values ('FullStack Double Ipa', 'PBC', 9.40, 1, 10.5, '3.png', 'Tämä amerikkalaistyylinen, erittäin maukas pintahiivaolut on valikoimamme vahvin!');
insert into product (name, brewery, price, category_id, percent, image, description) values ('Node Stout', 'PBC', 8.00, 2, 9.0, '10.png', 'Erittäin tumma ja maltaisen maukas pintahiivaolut');
insert into product (name, brewery, price, category_id, percent, image, description) values ('T-paita', 'PBC', 20.00, 4, NULL, '15.png', 'Tämän tyylikkäämmin ei olutta voi nauttia! Koot: S - XXXXXL');
insert into product (name, brewery, price, category_id, percent, image, description) values ('MySqLager', 'PBC', 4.00, 1, 5.0, '4.png', 'Tässä raikkaassa lageroluessa makua tuo pieni sitruunan vivahde');
insert into product (name, brewery, price, category_id, percent, image, description) values ('HTML Pilsner', 'PBC', 4.50, 1, 4.6, '5.png', 'Tuhdisti humaloitu täysmallasolut');
insert into product (name, brewery, price, category_id, percent, image, description) values ('C# Sour', 'PBC', 4.50, 3, 5.5, '12.png', 'Raikas ja sopivan kirpeä hapanolut saa lisäpotkua käyneistä pihlajanmarjoista');
insert into product (name, brewery, price, category_id, percent, image, description) values ('Pirkka Lager', 'Kesko', 2.00, 1, 4.5, '6.png', 'Yleisön pyynnöstä valikoimaamme lisätty Pirkka Lager ei esittelyä kaipaa');
insert into product (name, brewery, price, category_id, percent, image, description) values ('Koff Lager', 'Sinebrychoff', 2.00, 1, 4.5, '7.png', 'Yhteistyökumppanimme suosittua lagerolutta löytyy nyt myös meidän valokoimastamme!');
insert into product (name, brewery, price, category_id, percent, image, description) values ('Karhu Lager', 'Sinebrychoff', 2.00, 1, 4.6, '8.png', 'Yhteistyökumppanimme suosittua lagerolutta löytyy nyt myös meidän valokoimastamme!');
insert into product (name, brewery, price, category_id, percent, image, description) values ('Python Pale Ale', 'PBC', 6.00, 1, 6.0, '13.png', 'Vuoden 2022 olutpalkinnon voittaja on ykkösvalinta illanviettoon!');