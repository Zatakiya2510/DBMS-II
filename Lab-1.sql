create database Person_Info
use Person_Info

Create Table Department 
(
	DepartmentID Int ,
	DepartmentName Varchar (100),
	DepartmentCode Varchar (50),
	Location Varchar (50)
)

Create Table Person
(
	PersonID Int ,
	PersonName Varchar (100),
	DepartmentID Int,
	Salary Decimal (8,2),
	JoiningDate Datetime ,
	City Varchar (100)
)

INSERT INTO Department VALUES(1,'Admin','Adm','A-Block')
INSERT INTO Department VALUES(2,'Computer','CE','C-Block')
INSERT INTO Department VALUES(3,'Civil','CI','G-Block')
INSERT INTO Department VALUES(4,'Electrical','EE','E-Block')
INSERT INTO Department VALUES(5,'Mechanical','ME','B-Block')



INSERT INTO Person VALUES(101,'Rahul Tripathi',2,56000,'01-01-2000','Rajkot')
INSERT INTO Person VALUES(102,'Hardik Pandya',3,18000,'25-sep-2001','Ahmedabad')
INSERT INTO Person VALUES(103,'Bhavin Kanani',4,25000,'14-may-2000','Baroda')
INSERT INTO Person VALUES(104,'Bhoomi Vaishnav',1,39000,'08-feb-2005','Rajkot')
INSERT INTO Person VALUES(105,'Rohit Topiya',2,17000,'23-jul-2001','Jamnagar')
INSERT INTO Person VALUES(106,'Priya Menpara',NULL,9000,'18-oct-2000','Ahmedabad')
INSERT INTO Person VALUES(107,'Neha Sharma',2,34000,'25-dec-2002','Rajkot')
INSERT INTO Person VALUES(108,'Nayan Goswami',3,25000,'01-jul-2001','Rajkot')
INSERT INTO Person VALUES(109,'Mehul Bhundiya',4,13500,'09-jan-2005','Baroda')
INSERT INTO Person VALUES(110,'Mohit Maru',5,14000,'25-may-2000','Jamnagar')

select * from Department

select * from Person

--1
Select P.PersonName, D.DepartmentName, D.DepartmentCode
from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID

--2
Select P.PersonName
from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.Location = 'C-Block'

--3
Select P.PersonName, P.Salary, D.DepartmentName
from Person p
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where P.City = 'Jamnagar'

--4
Select P.PersonName, P.Salary, D.DepartmentName
from Person p
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where P.City <> 'Rajkot'

--5
select * from Person P
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Computer'

--6
select * from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName is null

--7
select P.PersonName from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Civil'
and P.JoiningDate > '1/08/2001'

--8
Select Person.PersonName , Department.DepartmentName
From Person
Left Outer Join Department
on Person.DepartmentID = Department.DepartmentID
where DATEDIFF(day,getdate(),Person.JoiningDate) > 365

--9
select D.DepartmentName ,COUNT(P.PersonID) As[Count]
From Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
group By D.DepartmentName 



--10
Select D.DepartmentName ,MAX(P.Salary) As[Max] , Min (P.Salary) As [Min]
From Person P
Left Outer  Join Department D
on P.DepartmentID = D.DepartmentID
Group By D.DepartmentName

--11
Select P.City ,MAX(P.Salary) As[Max] , Min (P.Salary) As [Min] , SUM(P.Salary) As[Total] , AVG(P.Salary) As[Avg]
From Person P
Inner Join Department D
on P.DepartmentID = D.DepartmentID
Group By P.City

--12
select D.DepartmentName , Sum(Salary) As[Salary]
from Person P
Inner join Department D
on P.DepartmentID = D.DepartmentID
Group By D.DepartmentName
having Sum(Salary) > 100000

--13
Select P.City , AVG(P.Salary) As [Avg]
From Person P
Left Outer Join Department D
on  P.DepartmentID = D.DepartmentID
where P.City = 'Ahmedabad'
Group By P.City

--14
Select D.DepartmentName , Count(P.PersonId) As [Count]
From Person P
Left Outer Join Department D
on P.DepartmentID=D.DepartmentID
Group By D.DepartmentName
Having COUNT(P.PersonId) is null

--15
Select D.DepartmentName , Count(P.PersonId) As [Count]
From Person P
Left Outer Join Department D
on P.DepartmentID=D.DepartmentID
Group By D.DepartmentName
Having COUNT(P.PersonId) > 2

--16
Select P.PersonName + ' Lives in ' + P.City +' and works in '+D.DepartmentName+' department.' As [Info]
From Person P
Left Outer Join Department D
On P.DepartmentID = D.DepartmentID

--17
Select P.PersonName +' earns '+ cast(P.Salary As varchar) +' from department '+ D.DepartmentName + 'monthly.'
From Person P
Left Outer Join Department D
On P.DepartmentID = D.DepartmentID

--18
Select D.DepartmentName ,P.City,SUM(Salary) As [Sum] ,AVG(Salary) As [Avg] ,MAX(Salary) As [Max]
From Person P
Left Outer Join Department D
On P.DepartmentID = D.DepartmentID
Group By D.DepartmentName,P.City

--19
Update Person
Set Person.Salary = P.Salary + (0.1*P.Salary)
From Person P
Left Outer Join Department D
On P.DepartmentID = D.DepartmentID
Where D.DepartmentName = 'Computer'

