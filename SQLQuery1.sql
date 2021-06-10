alter database university modify name = company

create table Department(DNO varchar(3), 
			 Dname varchar(20), 
			 Location varchar(10), 
			 primary key(DNO))

create table Employee(ENO varchar(4), 
			 fname varchar(15), 
			 lname varchar(20), 
			 DOB date, 
			 Address varchar(15), 
			 salary decimal(8,2),
			 DNO varchar(3), 
			 primary key(ENO))

insert into department values ('D01', 'development', 'orion')
insert into department values ('D02', 'Qa', 'city')
insert into department values ('D03', 'technical', 'orion')
insert into department values ('D04', 'Hr', 'new')

alter table Employee add foreign key (DNO) references Department (DNO)

insert into Employee values ('001a', 'Asha', 'Fernando', '1980/10/24', 'Kesbewa', 60000.00, 'D01')

select * from department
select * from Employee

--get fname & salary from employee table--
select fname, salary from Employee

-- get all details from employee table eno= 007c--
select * from Employee where eno = '007c'

select salary from Employee where fname ='shashi'

select fname, lname from Employee where salary > 50000.00

select fname from Employee where Address = 'kottawa'

select fname, Address, dob from Employee where DOB > '1988/01/01'


select fname, Address, dob from Employee where address <> 'piliyandala'

select distinct address from Employee 

select fname, lname, address from Employee where fname like 'D%'

select lname, fname, DNO from Employee where lname like '%singhe'

select dno, fname, lname, salary from Employee where 40000 < salary and salary < 60000

select fname, lname, dob from Employee where fname between  'a%' and   'k%'

select fname, salary from Employee order by salary

select fname, salary from Employee order by salary, fname

select fname, salary from Employee where salary>50000 order by fname

select fname, salary, dname from Employee e, Department d where d.DNO = e.DNO and Dname = 'qa'

select fname, salary, dname from Employee e, Department d where d.DNO = e.DNO and salary> 70000 and Dname = 'development'

select fname, lname, dob, salary, dname from Employee e, Department d where d.DNO = e.DNO and DOB > '1981/01/01' 
		and Dname = 'development' order by fname

select fname, Dob, address from Employee e, Department d where d.DNO = e.DNO and fname like 'a%' and dname ='development'

select fname, lname, dname, location from Employee e, Department d where d.DNO = e.DNO and fname like 'd%' or lname like 'd%'

select dname, location from Employee e, Department d where d.DNO = e.DNO and fname='dilhara' or lname ='dilhara'


select fname, address,dname, location from Employee e, Department d where d.DNO = e.DNO and 
		address='piliyandala' and lname ='perara'

select COUNT(Eno) from Employee

select sum(salary) from Employee

select AVG(salary) from Employee

select MAX(salary) from Employee

select Min(salary) from Employee

select top 1 fname, salary from Employee order by salary

select Dname, COUNT(ENO) as 'number of employee' from Employee e, Department d where d.DNO= e.DNO group by dname

select dname, max(salary) as 'max salary in dept' from Employee e, Department d where d.DNO= e.DNO group by dname

select dname, Avg(salary) as 'avg salary in dept' from Employee e, Department d where d.DNO= e.DNO group by dname

select count(Eno) from Employee e, Department d where d.DNO= e.DNO and dname ='qa'












