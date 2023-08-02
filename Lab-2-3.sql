Create Database Worker_Info


--1
Create Procedure spPerson_1_Insert
	@FirstName nvarchar(100),
	@LastName nvarchar (100),
	@Salary Decimal (8,2) ,
	@JoiningDate Datetime ,
	@DepartmentID Int,
	@DesignationID Int 
As
Begin
	Insert into Person_1(FirstName , LastName,Salary ,JoiningDate , DepartmentID ,DesignationID )
	values (
		@FirstName , 
		@LastName,
		@Salary ,
		@JoiningDate , 
		@DepartmentID ,
		@DesignationID 
	)
End

--1
Create Procedure spDepartment_Insert
	@DepartmentID int,
	@DepartmentName nvarchar(100)
As
Begin
	Insert into Department(DepartmentID,DepartmentName)
	values(@DepartmentID,@DepartmentName)
End

--1
Create Procedure spDesignation_Insert
	@DesignationID int,
	@DesignationName nvarchar(100)
As
Begin
	Insert into Designation(DesignationID,DesignationName)
	values(@DesignationID,@DesignationName)
End

--1PersonInsert
Exec spPerson_1_Insert 'Rahul' ,'Anshu' ,56000 ,'01-01-1990', 1, 12
Exec spPerson_1_Insert 'Hardik', 'Hinsu', 18000, '1990-09-25 ',2, 11
Exec spPerson_1_Insert 'Bhavin ','Kamani' ,25000 ,'1991-05-14', NULL ,11
Exec spPerson_1_Insert 'Bhoomi' ,'Patel', 39000, '2014-02-20 ',1, 13
Exec spPerson_1_Insert 'Rohit',' Rajgor' ,17000,'1990-07-23', 2, 15
Exec spPerson_1_Insert 'Priya' ,'Mehta ',25000,' 1990-10-18 ',2 ,NULL
Exec spPerson_1_Insert 'Neha', 'Trivedi' ,18000 ,'2014-02-20', 3, 15
Select * From Person_1

Drop Table Person

--1DepartmentInsert
Exec spDepartment_Insert 1,'Admin'
Exec spDepartment_Insert 2,'IT'
Exec spDepartment_Insert 3,'HR'
Exec spDepartment_Insert 4,'Account'

Select * From Designation

--1DesignationInsert
Exec spDesignation_Insert 11,'Jobber'
Exec spDesignation_Insert 12,'Welder'
Exec spDesignation_Insert 13,'Clerk'
Exec spDesignation_Insert 14,'Manager'
Exec spDesignation_Insert 15,'CEO'
			
			
--2
Create Procedure spPerson_Update
	@WorkerID int,
	@FirstName nvarchar(100),
	@LastName nvarchar (100),
	@Salary Decimal (8,2) ,
	@JoiningDate Datetime ,
	@DepartmentID Int,
	@DesignationID Int 
As
Begin
	Update Person_1
	Set
		FirstName=@FirstName , 
		LastName=@LastName,
		Salary=@Salary ,
		JoiningDate=@JoiningDate , 
		DepartmentID=@DepartmentID ,
		DesignationID=@DesignationID 
	where 
		@WorkerID=WorkerId
End

--2
Create Procedure spDepartment_Update
	@DepartmentID int,
	@DepartmentName nvarchar(100)
As
Begin
	Update Department
	Set
		DepartmentID=@DepartmentID,
		DepartmentName=@DepartmentName
	where 
		DepartmentID=@DepartmentID
End

--2
Create Procedure spDesignation_Update
	@DesignationID int,
	@DesignationName nvarchar(100)
As
Begin
	Update Designation
	Set
		DesignationID=@DesignationID,
		DesignationName=@DesignationName
	where 
		DesignationID=@DesignationID
End

--3
Create Procedure spPerson_Delete
	@WorkerId int
As
Begin
	Delete From Person_1
		where 
			@WorkerId = WorkerId
End

--3
Create Procedure spDepartment_Delete
	@DepartmentId int
As
Begin
	Delete From Department
		where 
			@DepartmentId = DepartmentId
End

--3
Create Procedure spDesignation_Delete
	@DesignationId int
As
Begin
	Delete From Designation
		where
			@DesignationId = DesignationID
End

--4
Create Procedure spPerson_SelectPK
	@WorkerID int
As
Begin
	Select * From Person_1
		Where @WorkerID = WorkerId
End

--4
Create Procedure spDepartment_SelectPK
	@DepartmentID int
As
Begin
	Select * From Department
		Where @DepartmentID = DepartmentId
End

--4
Create Procedure spDesignation_SelectPK
	@DesignationID int
As
Begin
	Select * From Designation
		Where @DesignationID = DesignationId
End

--5
Create Procedure spPerson_SelectAll
As
Begin
	Select
		P.WorkerId,
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName,
		Ds.DesignationName
	From Person_1 P
	Left Outer Join Department Dep 
	on P.DepartmentID = Dep.DepartmentID
	Left Outer Join Designation Ds
	on P.DesignationID = Ds.DesignationID
End

--6
Create Procedure spPerson_Top3
As
Begin
	Select Top(3) * From Person_1
End

--7
Alter Procedure spPerson_DepartmentName
	@DepartmentName varchar(100)
As
Begin
	Select
		P.WorkerId,
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName
	From Person_1 P
	Left Outer Join Department Dep 
	on P.DepartmentID = Dep.DepartmentID
	where @DepartmentName = DepartmentName
End

Exec spPerson_DepartmentName 'IT'

--8
Create Procedure spPerson_DepName_DesName
	@DepartmentName varchar(100),
	@DesignationName varchar(100)
As
Begin
	Select
		P.WorkerId,
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName
	From Person_1 P
	Left Outer Join Department Dep 
	on P.DepartmentID = Dep.DepartmentID
	Left Outer Join Designation Ds
	on P.DesignationID = Ds.DesignationID
	Where
		Dep.DepartmentName = @DepartmentName and
		Ds.DesignationName = @DesignationName
End

Exec spPerson_DepName_DesName 'Admin' , 'Welder'

--9
Create Procedure spPerson_FirstName
	@FirstName varchar(100)
As
Begin
	Select
		P.WorkerId,
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName,
		Ds.DesignationName
	From Person_1 P
	Left Outer Join Department Dep 
	on P.DepartmentID = Dep.DepartmentID
	Left Outer Join Designation Ds
	on P.DesignationID = Ds.DesignationID
	Where FirstName = @FirstName
End

Exec spPerson_FirstName 'Hardik'

--10
Create Procedure spPerson_SalaryDep
As
Begin
	Select
		Dep.DepartmentName,
		max(P.Salary) As [Max Salary],
		min(P.Salary) As [Min Salary],
		sum(P.Salary) As [Total Salary]
	From Person_1 P
	Left Outer Join Department Dep
	on P.DepartmentID = Dep.DepartmentID
	Group By Dep.DepartmentName
End

--11
Create Procedure spPerson_SalaryDesi
As
Begin
	Select
		Desi.DesignationName,
		max(P.Salary) As [Max Salary],
		min(P.Salary) As [Min Salary],
		sum(P.Salary) As [Total Salary]
	From Person_1 P
	Left Outer Join Designation Desi
	on P.DepartmentID = Desi.DesignationID
	Group By Desi.DesignationName
End

Exec spPerson_SalaryDesi





