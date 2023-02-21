create database ETHAR_Java5;
use ETHAR_java5;

create table Donors(
Username_Donor varChar(10) primary key not null,
fname  varChar(10),
lname  varChar(10),
phone_no varChar(20) ,
pass  varChar(8) not null
);

Create table Blood(
Username varChar(10) not null,
foreign key (Username) references Donors(Username_Donor ),
phone_no integer ,
Age integer not null,
wight integer not null,
gender char(1),
Appointment_date date,
region varChar(20) not null ,
hospital varchar(100) not null 
);




create table donation_items(D_ID int not null  AUTO_INCREMENT,
clothes_item varChar(35) not null,
clothes_price int,
Money_item integer,
primary key(D_ID)
);

create table ad_min(position varChar(20) not null,
ID_admin int primary key not null,
name_admin  varChar(20) not null,
username_admin varChar(30) not null,
pass_admin varChar(8) not null
);

create table food_basket(basket_name varChar(30) primary key not null,
basket_price int ,
basket_items varChar(300)
);



create table Payment(
Account_num varChar(16) primary key not null,
Cvv integer  not null,
Username_payment varChar(10) not null,
foreign key(Username_payment) references Donors(Username_Donor));




alter table donors drop column phone_no; 
alter table blood drop column phone_no;


alter table Blood
add constraint gender CHECK (gender='F' OR gender='M');


DELETE FROM Blood WHERE Username='atim-45';

INSERT INTO Donors
VALUES ('Ns@23', 'Norah' , 'Al-Mutairi','nm23'),
('Ma*115', 'Manar' , 'Albazbooz','Ma456'),
('Noor_92', 'Noor' , 'AbuFoor','N11223'),
('Manar7_2', 'Manar' , 'Alkhabbaz','mmaa5'),
('atim-45', 'Fatimah' , 'Alsawad','sawad21');

INSERT INTO Blood
VALUES ('Ma*115', 20,55,'F','2023-04-02','Al qatif','Qatif Central Hospital')
,('Noor_92', 29,65,'F','2023-02-14', 'Al qatif','Prince Mohaamed bin Fahad ')
,('Manar7_2', 43,67,'F','2023-03-02', 'Al qatif','Anak Hospital')
,('Ns@23', 28,55,'F','2023-01-29', 'Al Dammam ','Dammam Medical Complex')
,('atim-45', 34,54,'F','2023-05-02','Al Dammam ','King Fahad Specialist Hospital');


INSERT INTO ad_min
VALUES('Admin',11239884,'Manar Saeed','ManarMSK','MSdK2002')
,('Admin',11239895,'Manar Mohammed','Manri1423','M123f6n')
,('Admin',11233995,'admin','admin1','12434')
,('Admin',11239806,'Norah Saud','NorahS11','N20f03')
,('Admin',11239817,'Noor','No2002or','N200e2r')
,('Admin',11239883,'Fatimah','Fatfat2003','Fat20d03');

INSERT INTO Payment
VALUES (1256746926172838,234,'Ns@23'),
(1256736926172839,214,'Ma*115'),
(1256746926272838,237,'Noor_92'),
(1456746926172838,254,'Manar7_2'),
(1256746026172838,230,'atim-45');


insert into donation_items(clothes_item,clothes_price)
 values ( 'T-shirt',60)
 ,('pants',90)
,('kids clothes',90)
,('T-shirt',60)
,('kids clothes',90)
,('pants',90);

INSERT INTO food_basket
VALUES ('Ramadan Basket',699,'coking oil, flour , sugar, milk, salt, rice, pasta, cheese, date,eggs, oats,tomato paste, tea, beans')
,('Small Basket',599,'5kg Rice, 3 chicken , 1kg meat, mixed vegtables, mixed fruits')
,('friuts Basket',170,'1kg Banana, 1kg Orange , 1kg Apple, 1kg grabes')
,('vegetable Basket',160,'1kg cucumber, 1kg tomatos , 1kg carrots, 1kg bell pepper')
,('mixed Basket',510,'10kg Rice, 6 chicken , 2kg meat, mixed vegtables, mixed fruits')
;


create view Donor_information
as select Username_Donor,pass
from Donors;

create view DonorBlood
as select Username_Donor,region,hospital
from Donors, Blood;

create view name_Order
as select *
from Donors
ORDER BY fname;

create view Count_Donors
as select count(*)
from Donors;

create view Female_Donor
as select Username_Donor
from Donors
where exists(
select *
from Blood 
where gender='F');

create view male_Donor
as select Username_Donor
from Donors
where exists(
select *
from Blood 
where gender='M');


Delimiter // 
CREATE TRIGGER donor_username  after insert ON donors FOR EACH ROW
IF username LIKE '_' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "username can't be one letter ";
 END IF;
 
//Trigger for Age less than 18
Delimiter // 
CREATE TRIGGER Age  before insert ON Blood FOR EACH ROW
IF new.Age <18 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "age must be more than 18";
 END IF;
 
//Trigger for wight less than 50
Delimiter // 
CREATE TRIGGER wight  before insert ON Blood FOR EACH ROW
IF new.wight <50 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "weight must be more than 50";
 END IF;
 
 


SELECT DISTINCT Age
FROM Blood;

SELECT fname, region
FROM Blood,donors
WHERE region='Al qatif'
GROUP BY fname

SELECT fname, lname
FROM donors
WHERE Username_Donor is null;


SELECT * FROM blood
WHERE Age BETWEEN 20 AND 30;

SELECT Username, max(Age) as age
FROM blood
GROUP BY Username
HAVING max(Age) >= 30;

SELECT Username
FROM Blood
UNION
SELECT Username_funds
FROM funds;

Select all hospital 
From blood 
Where true

SELECT * 
FROM Blood
ORDER BY Age ASC;


SELECT * FROM Donors
WHERE fname NOT LIKE 'M%';



