create table countries(
state_tag varchar(3) primary key,
state_name varchar(30));

insert into countries
    values('ROM','Romania');
insert into countries
    values('TUR','Turkey');
insert into countries
    values('BLG','Bulgaria');
insert into countries
    values('HUN','Hungary');
insert into countries
    values('SPN','Spain');
insert into countries
    values('FRA','France');
insert into countries
    values('USA','United States of America');
insert into countries
    values('CHN','China');
insert into countries
    values('GER','Germany');
        
select * from countries;

create table cities(
city_tag varchar(3) primary key,
city_name varchar(20),
state_tag varchar(30),
constraint cities_fk foreign key(state_tag) references countries(state_tag));

insert into cities
    values ('BUC','Bucharest','ROM');
insert into cities
    values ('CTN','Constanta','ROM');
insert into cities
    values ('SOF','Sofia','BLG');
insert into cities
    values ('BDP','Budapest','HUN');
insert into cities
    values ('SZG','Szeged','HUN');
insert into cities
    values ('MAD','Madrid','SPN');
insert into cities
    values ('BAR','Barcelona','SPN');
insert into cities
    values ('VAL','Valencia','SPN');
insert into cities
    values ('PAR','Paris','FRA');
insert into cities
    values ('MRS','Marseilles','FRA');
insert into cities
    values ('LYN','Lyon','FRA');
insert into cities
    values ('BRL','Berlin','GER');
insert into cities
    values ('FRK','Frankfurt','GER');
insert into cities
    values ('MUN','Munich','GER');
insert into cities
    values ('HAM','Hamburg','GER');
    
select * from cities;

create table addresses(
address_code number(4) primary key,
city_tag varchar(3) not null,
postal_code varchar(15),
street_name varchar(30) not null,
number_s number(3) not null,
constraint addresses_fk foreign key (city_tag) references cities(city_tag));

create sequence addresses_seq
increment by 20
start with 20
maxvalue 10000
nocycle;

insert into addresses
    values(addresses_seq.nextval,'BUC','030353','Iuliu Maniu',5);
insert into addresses
    values(addresses_seq.nextval,'CTN','139303','Mihai Eminescu',23);
insert into addresses
    values(addresses_seq.nextval,'SOF','45-37-56','Aleksandry Zavdevsky',8);
insert into addresses
    values(addresses_seq.nextval,'BDP','678-205','Erkel',128);
insert into addresses
    values(addresses_seq.nextval,'SZG','723-365','Hatvan',52);
insert into addresses
    values(addresses_seq.nextval,'MAD','ZA56B3','Juan Bravo',12);
insert into addresses
    values(addresses_seq.nextval,'MAD','ZA67C9','Pedro de Valdivia',47);
insert into addresses
    values(addresses_seq.nextval,'VAL','GT49R2','Carrer de Borriana',5);
insert into addresses
    values(addresses_seq.nextval,'BAR','RH79N2','Avinguda Diagonal',34);
insert into addresses
    values(addresses_seq.nextval,'PAR','568230','Louis Rolland',5);
insert into addresses
    values(addresses_seq.nextval,'MRS','137475','Vincent Scotto',8);
insert into addresses
    values(addresses_seq.nextval,'LYN','567459','de Bonnel',76);
insert into addresses
    values(addresses_seq.nextval,'BRL','651246','Hallesches',89);
insert into addresses
    values(addresses_seq.nextval,'HAM','678578','Michelsenweg',35);
insert into addresses
    values(addresses_seq.nextval,'MUN','654345','Rosenheimer',87);
insert into addresses
    values(addresses_seq.nextval,'FRK','975773','Engelthaler',90);
insert into addresses
    values(addresses_seq.nextval,'BUD','498-275','Szytemlen',83);
    
select * from addresses;

create table departments(
id_depart number(3) primary key,
departmentg_name varchar(20) not null,
base_salary number(5) not null);

create sequence departments_seq
increment by 10
start with 20
maxvalue 1000
nocycle;

insert into departments
    values(departments_seq.nextval,'Bakery',2200);
insert into departments
    values(departments_seq.nextval,'Personnel',3500);
insert into departments
    values(departments_seq.nextval,'Sales',2300);
insert into departments
    values(departments_seq.nextval,'Marketing',3700);
insert into departments
    values(departments_seq.nextval,'Customer Service',3000);
insert into departments
    values(departments_seq.nextval,'Grocery',2200);
insert into departments
    values(departments_seq.nextval,'Logistics',3200);
insert into departments
    values(departments_seq.nextval,'Butcher',2200);
insert into departments
    values(departments_seq.nextval,'Board',5000);
    
select * from departments;

create table maintainance_companies(
id_comp number(3) primary key,
company_name varchar(15),
collab_start_date date,
monthly_payment number(5) not null,
company_type varchar(12) not null,
main_specialisation varchar(20),
cleaning_frequency number(2));

create sequence maintainance_seq
increment by 2
start with 10
maxvalue 1000
nocycle;

insert into maintainance_companies
    values(maintainance_seq.nextval,'Luna si Bec','24-Apr-2018',2500,'Cleaning',null,14);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Boris Clean','19-Feb-2019',3000,'Cleaning',null,7);
insert into maintainance_companies
    values(maintainance_seq.nextval,'ROSAFE','02-Sep-2018',3500,'Security','theft',null);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Sparkling','04-May-2020',2700,'Cleaning',null,14);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Feliz Limpio','23-Mar-2021',3200,'Cleaning',null,7);
insert into maintainance_companies
    values(maintainance_seq.nextval,'La Mapadora', '30-Aug-2019',3000,'Cleaning',null,7);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Belle', '27-Oct-2020',2800,'Cleaning',null,14);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Hermannstein', '10-Jun-2021',3500,'Cleaning',null,7);
insert into maintainance_companies
    values(maintainance_seq.nextval,'BGS Bulgaria', '13-Sep-2021',4000,'Security','theft',null);
insert into maintainance_companies
    values(maintainance_seq.nextval,'BGS Hungary', '28-Oct-2020',4200,'Security','safety',null);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Garda Grande', '28-Mar-2019',3700,'Security','safety',null);
insert into maintainance_companies
    values(maintainance_seq.nextval,'Protection Gran', '17-Jul-2018',4300,'Security','safety',null);
insert into maintainance_companies
    values(maintainance_seq.nextval,'BGS Germany', '24-Nov-2020',4500,'Security','safety',null);
    
select * from maintainance_companies;

create table markets(
id_market number(4) primary key,
address_code number(4) not null,
surface number(4) not null,
id_comp_sec number(3),
id_comp_cle number(3),
constraint markets_fk foreign key(address_code) references addresses(address_code),
constraint sec_fk foreign key(id_comp_sec) references maintainance_companies(id_comp),
constraint cle_fk foreign key(id_comp_cle) references maintainance_companies(id_comp));

create sequence markets_seq
increment by 5
start with 10
maxvalue 1000
nocycle;

insert into markets
    values(markets_seq.nextval,20,200,14,10);
insert into markets
    values(markets_seq.nextval,40,300,14,10);
insert into markets
    values(markets_seq.nextval,60,250,26,12);
insert into markets
    values(markets_seq.nextval,380,350,28,16);
insert into markets
    values(markets_seq.nextval,100,300,28,16);
insert into markets
    values(markets_seq.nextval,120,250,30,18);
insert into markets
    values(markets_seq.nextval,140,350,30,20);
insert into markets
    values(markets_seq.nextval,160,300,30,18);
insert into markets
    values(markets_seq.nextval,180,350,30,18);
insert into markets
    values(markets_seq.nextval,200,400,38,22);
insert into markets
    values(markets_seq.nextval,220,300,38,22);
insert into markets
    values(markets_seq.nextval,240,350,38,22);
insert into markets
    values(markets_seq.nextval,260,400,34,24);
insert into markets
    values(markets_seq.nextval,280,350,34,24);
insert into markets
    values(markets_seq.nextval,300,400,34,24);
insert into markets
    values(markets_seq.nextval,320,300,34,24);

select * from markets;

create table employees(
id_emp number(4) primary key,
last_name varchar(20) not null,
first_name varchar(20) not null,
hire_date date,
phone varchar(10) unique,
commission_quoef number(3,2),
id_depart number(3),
id_market number(4),
constraint dep_fk foreign key(id_depart) references departments(id_depart),
constraint market_fk foreign key(id_market) references markets(id_market));

create sequence emp_seq
increment by 1
start with 1
maxvalue 20000
nocycle;

insert into employees
    values(emp_seq.nextval,'Popescu','Alexandru','02-May-2018','07235890',null,40,10);
insert into employees
    values(emp_seq.nextval,'Ionescu','Alina','03-May-2018','07635990',0.15,40,10);
insert into employees
    values(emp_seq.nextval,'Miron','Horatiu','07-May-2018','07635910',0.20,70,10);
insert into employees
    values(emp_seq.nextval,'Amirunei','Georgeta','05-May-2018','07655990',0.30,100,10);

insert into employees
    values(emp_seq.nextval,'Mihailescu','Adina','07-Jun-2019','07235890',0.25,60,15);
insert into employees
    values(emp_seq.nextval,'Ionescu','Alina','03-May-2018','07633990',null,40,15);
insert into employees
    values(emp_seq.nextval,'Miron','Horatiu','07-May-2018','07635990',0.05,90,15);
insert into employees
    values(emp_seq.nextval,'Amirunei','Georgeta','05-May-2018','07235990',0.15,100,15);
    
insert into employees
    values(emp_seq.nextval,'Milovich','Dmitry','02-May-2020','08235890',null,40,20);
insert into employees
    values(emp_seq.nextval,'Sayushkaya','Marya','03-Jul-2021','08635990',0.15,70,20);
insert into employees
    values(emp_seq.nextval,'Dobrovich','Aleksandr','07-Aug-2020','08635990',0.20,100,20);
insert into employees
    values(emp_seq.nextval,'Milovich','Dmitry','02-May-2020','08235890',null,220,20);
insert into employees
    values(emp_seq.nextval,'Sayushkaya','Marya','03-Jul-2021','08635990',0.15,240,20);
insert into employees
    values(emp_seq.nextval,'Dobrovich','Aleksandr','07-Aug-2020','08635990',0.20,100,20);
    
insert into employees
    values(emp_seq.nextval,'Anglossy','Istvan','05-Apr-2021','09235890',null,40,30);
insert into employees
    values(emp_seq.nextval,'Janos','Ardony','08-Jul-2021','09235890',null,40,30);    
insert into employees
    values(emp_seq.nextval,'Gyorgethery','Marika','05-Apr-2021','09235890',null,100,30);
    
insert into employees
    values(emp_seq.nextval,'Garcia','Esteban','06-Aug-2021','04235890',null,40,35);
insert into employees
    values(emp_seq.nextval,'LLuro','Javier','07-Sep-2020','04235070',null,100,35);

insert into employees
    values(emp_seq.nextval,'Fernan','Rofrigo','15-Apr-2021','04215899',null,100,40);
insert into employees
    values(emp_seq.nextval,'Goices','Ramiriz','15-Jul-2021','04215899',null,40,40);
  
insert into employees
    values(emp_seq.nextval,'Fernan','Jimena','15-Apr-2021','04215792',null,50,45);    
insert into employees
    values(emp_seq.nextval,'Garcia','Lopez','17-Apr-2021','04215891',null,40,45);
insert into employees
    values(emp_seq.nextval,'Malfrida','Infanta','18-Apr-2021','04215991',0.15,100,45);
    
insert into employees
    values(emp_seq.nextval,'Alvarez','Rofrigo','15-Apr-2021','04215896',null,40,50);    
insert into employees
    values(emp_seq.nextval,'Garcia','Lopez','17-Apr-2021','04215871',null,100,50);
    
insert into employees
    values(emp_seq.nextval,'Boivelle','Marie','15-Apr-2021','04215895',null,100,55);    
insert into employees
    values(emp_seq.nextval,'Blois','isabelle','17-Apr-2021','04285891',null,40,55);
    
insert into employees
    values(emp_seq.nextval,'Marquie','Alessandre','15-Apr-2021','04215893',null,40,60);    
insert into employees
    values(emp_seq.nextval,'Broget','Almec','17-Apr-2021','04225892',null,100,60);
    
insert into employees
    values(emp_seq.nextval,'Charlee','Antoine','15-Apr-2021','04215866',null,40,65);    
insert into employees
    values(emp_seq.nextval,'Vivizon','Louis','17-Apr-2021','04215867',null,100,65);
    
insert into employees
    values(emp_seq.nextval,'Gustav','Klauss','17-Apr-2021','09215867',null,40,70);
    
insert into employees
    values(emp_seq.nextval,'Mahstern','Mark','17-Apr-2021','09315867',null,40,75);
    
insert into employees
    values(emp_seq.nextval,'Friedrichson','Karl','17-Apr-2021','09415867',null,40,80);

insert into employees
    values(emp_seq.nextval,'Klogge','Frau','17-Apr-2021','09515867',null,40,85);
    
select * from employees;

create table languages(
lang_tag varchar(3) primary key,
lang_name varchar(20) not null);

insert into languages
    values('ROM','Romanian');
insert into languages
    values('BLG','Bulgarian');
insert into languages
    values('FRE','French');
insert into languages
    values('ENG','English');
insert into languages
    values('DEU','German');
    
select * from languages;

create table product_types(
prod_type_tag varchar(3) primary key,
prod_name varchar(20) not null);

insert into product_types
    values('MEA','Meats');
insert into product_types
    values('DRY','Dairy');
insert into product_types
    values('FRU','Fruits');
insert into product_types
    values('VEG','Vegetables');
insert into product_types
    values('CSM','Cosmetics');
    
select * from product_types;

create table suppliers(
id_supplier  number(3) primary key,
name_s varchar(20) not null,
org_state varchar(3),
constraint sup_fk foreign key(org_state) references countries(state_tag));

insert into suppliers
    values(100,'Ferma lui Ion','ROM');
insert into suppliers
    values(101,'Antalya Garden','TUR');
insert into suppliers
    values(102,'Wuhan Industrials','CHN');
insert into suppliers
    values(103,'Agricola Sevilla','SPN');
insert into suppliers
    values(104,'Elmiplant','FRA');
insert into suppliers
    values(105,'Kasimiva Fermata','BLG');
    
select * from suppliers;

create table products(
id_prod  number(3) primary key,
prod_name varchar(20) not null,
prod_type varchar(3),
sell_type varchar(3),
price number(4,1),
constraint type_fk foreign key(prod_type) references product_types(prod_type_tag));

insert into products
    values(100,'carrots','VEG','eng',1.2);
insert into products
    values(101,'carrots','VEG','eng',1.6);
insert into products
    values(102,'soap','CSM','end',5);
insert into products
    values(103,'shampoo','CSM','end',10);
insert into products
    values(104,'beef','MEA','end',8);
insert into products
    values(105,'fried chicken','MEA','end',10);
insert into products
    values(106,'apples','FRU','eng',2.8);
insert into products
    values(107,'cheese','DRY','end',5);
insert into products
    values(108,'milk','DRY','end',6);
insert into products
    values(109,'face cream','CSM','end',12);
insert into products
    values(110,'hand cream','CSM','end',12);
insert into products
    values(111,'pears casolette','FRU','end',3);
insert into products
    values(112,'potatoes sack','VEG','end',4);
insert into products
    values(113,'hand cream','CSM','end',10);
insert into products
    values(114,'bananas','FRU','eng',2.5);

select * from products;

create table receipts(
receipt_id number(8) primary key,
transaction_date date,
id_market number(4),
constraint mark_fk foreign key(id_market) references markets(id_market));

insert into receipts
    values(10,'04-May-2022',35);
insert into receipts
    values(11,'04-May-2022',35);
insert into receipts
    values(12,'04-May-2022',35);
insert into receipts
    values(13,'04-May-2022',35);
insert into receipts
    values(14,'04-May-2022',35);
insert into receipts
    values(15,'04-May-2022',35);
insert into receipts
    values(16,'05-May-2022',35);
insert into receipts
    values(17,'06-May-2022',35);
insert into receipts
    values(18,'07-May-2022',35);
insert into receipts
    values(19,'07-May-2022',30);
    
select * from receipts;

create table provide(
id_supplier number(3),
prod_type_tag varchar(3),
constraint provide_pk primary key (prod_type_tag,id_supplier),
constraint provide_id_fk foreign key (id_supplier) references suppliers(id_supplier),
constraint provide_tg_fk foreign key (prod_type_tag) references product_types(prod_type_tag));

insert into provide
    values(100,'MEA');
insert into provide
    values(100,'DRY');
insert into provide
    values(102,'CSM');
insert into provide
    values(105,'VEG');
insert into provide
    values(105,'FRU');
insert into provide
    values(104,'CSM');
insert into provide
    values(103,'VEG');
insert into provide
    values(103,'FRU');
insert into provide
    values(103,'DRY');
insert into provide
    values(101,'VEG');
insert into provide
    values(101,'FRU');
insert into provide
    values(101,'MEA');
    
select * from provide;

create table contain(
receipt_id number(8),
id_prod number(3),
quantity number(4,2),
constraint contain_pk primary key (id_prod,receipt_id),
constraint contain_idp_fk foreign key (id_prod) references products(id_prod),
constraint contain_rid_fk foreign key (receipt_id) references receipts(receipt_id));

insert into contain
    values(10,100,5);
insert into contain
    values(10,101,5);
insert into contain
    values(11,103,2);
insert into contain
    values(12,111,3);
insert into contain
    values(13,109,1);
insert into contain
    values(13,110,1);
insert into contain
    values(14,104,2);
insert into contain
    values(15,106,3);
insert into contain
    values(16,108,8);
insert into contain
    values(16,105,1);
insert into contain
    values(17,114,2);
    
select * from contain;

create table supply(
id_supplier number(3),
id_prod number(3),
id_market number (4),
constraint supply_pk primary key (id_supplier,id_prod,id_market),
constraint supply_ids_fk foreign key (id_supplier) references suppliers(id_supplier),
constraint supply_idp_fk foreign key (id_prod) references products(id_prod),
constraint supply_idm_fk foreign key (id_market) references markets(id_market));

insert into supply
    values(100,104,10);
insert into supply
    values(100,105,10);
insert into supply
    values(100,104,15);
insert into supply
    values(100,107,10);
insert into supply
    values(100,108,10);
insert into supply
    values(100,108,15);
insert into supply
    values(102,109,10);
insert into supply
    values(102,110,10);
insert into supply
    values(102,110,35);
insert into supply
    values(105,112,10);
insert into supply
    values(105,106,10);
insert into supply
    values(105,106,15);

select * from supply;

create table know(
id_emp number(3),
lang_tag varchar(3),
constraint know_pk primary key (id_emp,lang_tag),
constraint know_ids_fk foreign key (id_emp) references employees(id_emp),
constraint know_idm_fk foreign key (lang_tag) references languages(lang_tag));

insert into know
    values(10,'BLG');
insert into know
    values(10,'ENG');
insert into know
    values(10,'FRE');
insert into know
    values(2,'BLG');
insert into know
    values(2,'ENG');
insert into know
    values(2,'FRE');
insert into know
    values(20,'BLG');
insert into know
    values(20,'ENG');
insert into know
    values(20,'FRE');
insert into know
    values(8,'BLG');
insert into know
    values(8,'ENG');
insert into know
    values(9,'FRE');
    
select * from know;
    
commit;