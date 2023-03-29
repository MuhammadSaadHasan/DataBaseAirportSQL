--drop table maintain
--drop table service
--drop table WorksOn
--drop table employee
--drop table flies
--drop table pilot
--drop table corporation
--drop table person 
--drop table owns
--drop table PlaneOwner
--drop table airplane
--drop table hangar
--drop table plane_type

--use A2

--******************PLANE TYPE
create table plane_type(
	 model varchar(10) PRIMARY KEY NOT NULL,
	 capacity int,
	 weight_tons int
);
--******************HANGAR
create table hangar(
	 number int PRIMARY KEY NOT NULL,
	 capacity int,
	 location varchar(10)
);
--******************AIRPLANE
create table airplane(
	 RegNo int PRIMARY KEY not null,
	 of_type varchar(10),
	 FOREIGN KEY (of_type) REFERENCES plane_type(model),
	 stored_in int,
	 FOREIGN KEY (stored_in) REFERENCES hangar(number)
);
--******************OWNER
create table PlaneOwner(
	OwnerID int PRIMARY KEY not null
);
--******************OWNS
create table owns(
	Pdate date,
	PlaneRegNo int,
	FOREIGN KEY (PlaneRegNo) REFERENCES airplane(RegNo),
	owner_id int
	FOREIGN KEY (owner_id) REFERENCES PlaneOwner(OwnerID),
);
--******************CORPORATIONS
create table corporation(
	CorPhone varchar(11) PRIMARY KEY not null,
	CorName varchar(100),
	CorAddress varchar(100),
	owner_id int,
	FOREIGN KEY (owner_id) REFERENCES PlaneOwner(OwnerID)
);
--******************PERSON
create table person(
	PerSSN numeric(9) PRIMARY KEY not null,
	PerPhone varchar(11),
	PerName varchar(100),
	PerAddress varchar(100),
	owner_id int,
	FOREIGN KEY (owner_id) REFERENCES PlaneOwner(OwnerID)
);

--******************PILOT

create table pilot(
	lic_num int PRIMARY KEY not null,
	Restr varchar(100),
	ssn numeric(9),
	FOREIGN KEY (ssn) REFERENCES person(PerSSN),
);
--******************FLIES

create table flies(
	model varchar(10),
	FOREIGN KEY (model) REFERENCES plane_type(model),
	licNum int,
	FOREIGN KEY (licNum) REFERENCES pilot(lic_num)

);
--******************EMPLOYEE

create table employee(
	EmployeeID int PRIMARY KEY not null,
	shift varchar(10),
	salary int,
	ssn numeric(9),
	FOREIGN KEY (ssn) REFERENCES person(PerSSN),
);
--******************WORKS ON
create table WorksOn(
	model varchar(10),
	FOREIGN KEY (model) REFERENCES plane_type(model),
	EmpID int,
	FOREIGN KEY (EmpID) REFERENCES employee(EmployeeID),

);
--******************SERVICE
create table service(
	work_code varchar(10) PRIMARY KEY not null,
	hours int,
	SerDate date,
	Plane_Serviced int,
	FOREIGN KEY (Plane_Serviced) REFERENCES airplane(RegNo)
);
--******************MAINTAIN
create table maintain(
	EmpID int,
	FOREIGN KEY (EmpID) REFERENCES employee(EmployeeID),
	WorkCode varchar(10),
	FOREIGN KEY (WorkCode) REFERENCES service(work_code)

);

INSERT INTO plane_type (model, capacity,weight_tons) VALUES
				  ('A1002', 200, 5000),
				  ('A1003', 300, 6000),
				  ('A1004', 150, 7000),
				  ('B1003', 100, 8000),
				  ('B1006', 230, 9000),
				  ('C1008', 130, 6500);
select* from plane_type;

INSERT INTO hangar(number, capacity,location) VALUES
				  (1, 3, 'A3'),
				  (2, 2, 'A4'),
				  (3, 1, 'A3'),
				  (4, 1, 'B4'),
				  (5, 2, 'A5'),
				  (6, 3, 'C1');
select* from hangar;


INSERT INTO airplane(RegNo, of_type,stored_in) VALUES
				  (123, 'A1004', 3),
				  (325, 'B1003', 2),
				  (567, 'A1002', 4),
				  (789, 'B1006', 2),
				  (643, 'C1008', 5),
				  (555, 'A1004', 5);
select* from plane_type;

INSERT INTO PlaneOwner(OwnerID) VALUES
				  (12345),
				  (54321),
				  (66666),
				  (77777),
				  (89543),
				  (11111),
				  (22222),
				  (33333);
select* from PlaneOwner;

INSERT INTO owns(Pdate,PlaneRegNo,owner_id) VALUES
				  ('2022-12-16',567,12345),
				  ('2013-01-23',325,66666),
				  ('2010-11-14',123,54321),
				  ('2011-12-16',789,77777),
				  ('2021-01-23',643,89543),
				  ('2020-11-14',555,89543);
select* from owns;

INSERT INTO corporation(CorPhone,CorName,CorAddress,owner_id) VALUES
				  ('11111111111','PIA','Islamabad',66666),
				  ('12345678901','JetBlue','Karachi',54321);
select* from corporation;


INSERT INTO person(PerSSN,PerPhone,PerName,PerAddress,owner_id) VALUES
				  (333333333,'98989898989', 'SAAD','Islamabad',12345),
				  (666666666,'35300000000', 'Harris','Karachi',77777),
				  (787878787,'74500000000', 'Danyal','Lahore',89543),
				  (456946594,'55656000000', 'Khalid','Lahore',11111),
				  (898989898,'53454564644', 'Malik','Lahore',22222),
				  (212121212,'45453535353', 'Nasir','Islamabad',33333);




select* from person;


INSERT INTO pilot(lic_num,Restr,ssn) VALUES
				  (5672,'Only in day', 787878787),
				  (6438,'Only National', 666666666);

select* from pilot;

INSERT INTO flies(model,licNum) VALUES
				  ('C1008', 5672),
				  ('B1006', 6438);
select* from flies;


INSERT INTO employee(EmployeeID,shift,salary,ssn) VALUES
				  (3467899,'Day', 30000,333333333),
				  (5454545,'Night', 25000,456946594),
				  (4242424,'Day', 10000,  898989898),
				  (5445454,'Night', 25000,212121212);
select* from employee;

INSERT INTO WorksOn(model,EmpID) VALUES
				  ('A1002', 3467899);
select* from WorksOn;



INSERT INTO service(work_code,hours,SerDate,Plane_Serviced) VALUES
				  ('W002', 5, '2012-02-03',123),
				  ('W003', 2, '2022-03-09',325),
				  ('W004', 2, '2023-04-06',567),
				  ('W005', 10, '2010-02-12',789),
				  ('W006', 18, '2009-08-11',643),
				  ('W007', 18, '2010-12-03',555);

select* from service;

INSERT INTO maintain(EmpID,WorkCode) VALUES
				  (3467899, 'W002');
select* from maintain;




