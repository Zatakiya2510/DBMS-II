use Functions
--1
Create Function printhelloworld()
Returns varchar(100)
As
Begin
	declare @str varchar(100)
	Set @str = 'Hello Word'
	Return @str
end

Select DBO.printhelloworld() As [Print]

--2
Create Function Addition(@No1 int , @No2 int)
returns int
As
Begin
	declare @Result int
	Set @Result = @No1 + @No2
	Return @Result
End

Select dbo.addition(5,4) As [Addition]

--3
Create Function cubeofnumber(@no1 int)
Returns int
As
Begin
	return @no1*@no1*@no1
End

Select dbo.cubeofnumber(5) As [Cube]

--4
Create Function OddorEven(@NUM int)
Returns varchar(50)
As
Begin 
	Declare @NAME varchar(50)
	if @NUM%2=0
		set @NAME = 'Even'	
	else 
		Set @NAME = 'Odd'
	Return @NAME
End

Select DBO.OddOrEven(6) As [Odd or Even]
Select DBO.OddOrEven(5) As [Odd or Even]

--5
Create Function Comparision(@A Int , @B Int)
Returns varchar(50)
As
Begin
	Declare @NAME varchar(50)
	if @A=@B
		Set @NAME = 'Equal'
	else if @A > @B
		Set @NAME = 'A IS Greater'
	else
		Set @NAME = 'B Is Greater'
	Return @NAME
End

Select DBO.Comparision(9,10) AS [Comparision]

--6
Create Function Print1ToN(@N int)
Returns varchar(500)
As
Begin
	Declare @Result varchar(500) = '',
			@I int = 1
	while (@I <= @N)
	Begin 
		Set @Result = @Result + cast(@I as varchar(10))+' , '
		Set @I = @I + 1
	End
	Return @Result
End

Select DBO.Print1ToN(100) As [1 To N]

--7
Create Function EvenSum()
Returns varchar(50)
As
Begin
	Declare @Result varchar(50) = '',
			@I int = 1
	while @I <= 20
	Begin 
		If @I%2=0
			Set @Result = @Result +@I
		Else
			Set @Result = @Result + 0
		Set @I = @I + 1
	End
	Return @Result
End

Select DBO.EvenSum() As[Even Sum]

--8
Create Function PrimeOrNot(@NUM int)
Returns varchar(50)
As
Begin
	Declare @isPrime varchar(50) = 'TRUE',
			@I int = 2
	While @I < @NUM
		Begin
			If @NUM % @I =0
				Set @isPrime = 'False'
			Set @I = @I+1
		End
	Return @isPrime
End

Select DBO.PrimeOrNot(3) As [Prime Or Not]

Select DBO.PrimeOrNot(10) As [Prime Or Not]

--9
Create Function DateDiffrence(@DATE1 date,@DATE2 date)
Returns int
As
Begin
	Return DateDiff(DAY,@DATE1,@DATE2)
End

Select DBO.DateDiffrence('2020-08-10','2023-08-05') As [Date Diffrence In Days]

--10
CREATE FUNCTION GetTotalDaysInMonth(@year INT,@month INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalDays INT

    SET @totalDays = CASE
        WHEN @month = 2 THEN
            CASE
                WHEN (@year % 4 = 0 AND @year % 100 != 0) OR (@year % 400 = 0) THEN 29
                ELSE 28
            END
        WHEN @month IN (4, 6, 9, 11) THEN 30
        ELSE 31
    END
    RETURN @totalDays
END


Select DBO.GetTotalDaysInMonth(2023,3) As [Total Days]

--11
Create Function FirstNameWithB()
Returns Table 
As
Return
	Select * From Person_1 
	where FirstName like 'B%'

SELECT * FROM dbo.FirstNameWithB()

--12
Create Function UniqueFirstName()
Returns Table
As
Return 
	Select Distinct FirstName
	From Person_1 

Select * From DBO.UniqueFirstName()

--13
Create Function ReturnPersonDetail(@DepartmentID int)
Returns Table
As
Return
	Select P.WorkerId,
			P.FirstName,
			P.LastName,
			P.Salary,
			P.JoiningDate,
			D.DepartmentName
	From Person_1 P
	Inner Join Department D
	on P.DepartmentID =  D.DepartmentID
	where D.DepartmentID = @DepartmentID


Select * From DBO.ReturnPersonDetail(2)
