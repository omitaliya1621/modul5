-- question :1

create table student (Rollno int primary key ,Name varchar(45),Branch varchar(45));

insert into student values (1,'jay','computer science');

insert into student values (2,'Suhani','Electronic and com');

insert into student values (3,'Kriti','Electronic and com');

create table Exam (Rollno int references student(Rollno) ,S_code varchar(45),Marks int,P_code varchar(45));

insert into Exam values(1,'cs11',50,'cs');

insert into Exam values(1,'cs12',60,'cs');

insert into Exam values(2,'Ec101',66,'Ec');

insert into Exam values(2,'Ec102',70,'Ec');

insert into Exam values(2,'cs11',50,'cs');

insert into Exam values(3,'Ec101',45,'Ec');

insert into Exam values(3,'Ec102',50,'Ec');


-- question 2

create table Employee (Employee_id int ,First_name varchar(45),
 Last_name  varchar(45),Salary int ,joining_date varchar(45), Department varchar(45));
 
alter table Employee  modify column Employee_id int primary key; 

insert into Employee values(1,'John','Abraham',1000000,'01-JAN-13 12.00.00 AM','Banking');

select * from Employee;

insert into Employee values(2,'Michael','clarke',800000,'01-JAN-13 12.00.00 AM','Insurance');

insert into Employee values(3,'Roy','Thomas',700000,'01-FEB-13 12.00.00 AM','Banking');

insert into Employee values(4,'Tom','Jose',600000,'01-FEB-13 12.00.00 AM','Insurance');

insert into Employee values(5,'Jerry','Pinto',650000,'01-FEB-13 12.00.00 AM','Insurance');

insert into Employee values(6,'Philip','Mathew',750000,'01-JAN-13 12.00.00 AM','Service');

insert into Employee values(7,'TestName1','123',650000,'01-JAN-13 12.00.00 AM','Service');

insert into Employee values(8,'TestName2','Lname%',600000,'01-FEB-13 12.00.00 AM','Insurrance');


create table Incentive (Employee_ref_id int references
 Employee(Employee_id), Incentive_date varchar(45), 
 Incentive_amount int );
 
insert into Incentive values (1,'01-FEB-13',5000);

insert into Incentive values (2,'01-FEB-13',3000);

insert into Incentive values (3,'01-FEB-13',4000);

insert into Incentive values (1,'01-JAN-13',4500);

insert into Incentive values (2,'01-JAN-13',3500);

select * from incentive;

-- question 3
select First_name as EmployeeName from employee;
-- question 4
select First_name,joining_date,salary from employee;

-- question 5
select * from employee order by First_name asc;

select * from employee order by salary desc;

-- question 6
select * from employee where First_name like '%j%';


select * from department;
-- question 7
select department, MAX(salary) as max_salary from employee group by department ORDER BY max_salary;

-- question 8
select First_name,Incentive.Incentive_amount from employee  JOIN INCENTIVE where incentive_amount>3000;

-- question 9
create table  viewtable  select * from employee;

-- question 10
create trigger t1 after insert on employee for each row insert  into viewtable values(new.Employee_id,
new.First_name,new.Last_name,new.Salary,new.joining_date,new.Department);

insert into employee values(9,'om','italiya',1000,',03-AUG-04 4.55','BNV');

select * from viewtable;

-- question 11--

create  table Salseperson  (SNO int  primary key,SNAME varchar (45),CITY varchar(45),COMM float);

create table Customer (CNM int primary key,CNAME varchar(45),CITY varchar (45), RATING varchar (45), SNO int  references Salsperson(SNO));

insert into Salseperson values(1001,'Peel','London',.12);
insert into Salseperson values(1002,'Serres','San Jose',.13);
insert into Salseperson values(1004,'Motika','London',.11);
insert into Salseperson values(1007,'Rafkin','Barcelona',.15);
insert into Salseperson values(1003,'Axelrod','New York',.1);

insert into Customer values(201,'Hoffman','London',100,1001);
insert into Customer values(202,'Giovanne','Roe',200,1003);
insert into Customer values(203,'Liu','San Jose',300,1002);
insert into Customer values(204,'Grass','Barcelona',100,1002);
insert into Customer values(206,'Clemens','London',300,1007);
insert into Customer values(207,'Pereira','Roe',100,1004);

-- question 12

select * from Salseperson;
select * from Customer;

-- question 14

select SNAME,CITY from Salseperson where CITY='London' and  COMM>0.12;

-- question 15

select * from Salseperson where CITY='Barcelona'or City='London';

-- question 16

select * from Salseperson where COMM>=0.10 and COMM<=0.12;

-- question 17
 
 select * from Customer where RATING <=100 And CITY= 'Roe';
 
 -- question 18
 
 select * from Salseperson;
 
-- orders--

  create table salespeople(salesman_id int, name varchar(45), city varchar(45), commission float);
   INSERT INTO salespeople VALUES (5001, 'James Hoog', 'New York', 0.15);
   INSERT INTO salespeople VALUES (5002, 'Nail Knite', 'Paris', 0.13);
   INSERT INTO salespeople VALUES(5005, 'Pit Alex', 'London', 0.11);
   INSERT INTO salespeople VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
   INSERT INTO salespeople VALUES(5007, 'Paul Adam', 'Rome', 0.13);
   INSERT INTO salespeople VALUES(5003, 'Lauson Hen', 'San Jose', 0.12);

	
 CREATE TABLE orders (ord_no INT,purch_amt float,ord_date DATE,customer_id INT,salesman_id INT);

insert into orders values (70001, 150.5, '2012-10-05', 3005, 5002);
insert into orders values (70009, 270.65, '2012-09-10', 3001, 5005);
insert into orders values(70002, 65.26, '2012-10-05', 3002, 5001);
insert into orders values (70004, 110.5, '2012-08-17', 3009, 5003);
insert into orders values (70007, 948.5, '2012-09-10', 3005, 5002);
insert into orders values (70005, 2400.6, '2012-07-27', 3007, 5001);
insert into orders values (70008, 5760, '2012-09-10', 3002, 5001);
insert into orders values (70010, 1983.43, '2012-10-10', 3004, 5006);
insert into orders values (70003, 2480.4, '2012-10-10', 3009, 5003);
insert into orders values (70012, 250.45, '2012-06-27', 3008, 5002);
insert into orders values (70011, 75.29, '2012-08-17', 3003, 5007);
insert into orders values (70013, 3045.6, '2012-04-25', 3002, 5001);

-- question 19

   select   ord_no,ord_date,purch_amt from orders where salesman_id=5001;
   
   -- item_master
   
   CREATE TABLE item_mast (pro_id INT PRIMARY KEY,pro_name VARCHAR(50),pro_price float,pro_com INT);
   
insert into item_mast values(101, 'Mother Board', 3200.00, 15);
insert into item_mast values(102, 'Key Board', 450.00, 16);
insert into item_mast values(103, 'ZIP drive', 250.00, 14);
insert into item_mast values(104, 'Speaker', 550.00, 16);
insert into item_mast values(105, 'Monitor', 5000.00, 11);
insert into item_mast values(106, 'DVD drive', 900.00, 12);
insert into item_mast values(107, 'CD drive', 800.00, 12);
insert into item_mast values(108, 'Printer', 2600.00, 13);
insert into item_mast values(109, 'Refill cartridge',350.00,13);
insert into item_mast values(110, 'Mouse',250.00, 12);

-- question 20

select * from item_mast where pro_price>=200 and pro_price<=600;

-- question 21

select avg(pro_price) as average from item_mast where pro_com=16;

-- question 22

select pro_name as 'item Name' ,pro_price as 'price in Rs' from item_mast;
   
--  question 23

select pro_name, pro_price from item_mast where pro_price >= 250 order by pro_price desc, pro_name ;

-- question 24
select pro_com,avg(pro_price) as average from item_mast group by pro_com;