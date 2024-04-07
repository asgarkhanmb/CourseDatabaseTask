
select * from Users
union
select * from Doctors

select * from Users
union all
select * from Doctors

 
select [Email] from Users
union all
select [Email] from Teachers


select [name],[email] from Users
union all
select [name],[email] from Teachers



--intersect
--except


select * from Users
intersect
select * from Doctors


select * from Users
except
select * from Doctors 


select COUNT(*)as 'Student count',Age
FROM Students
GROUP BY Age;


declare @num1 int = 50;

declare @num2 int =30;

if @num1>@num2
  
    print 'Yes'

else

    print 'No'

select * from Teachers
select * from Students


create function dbo.getTeachersAvgAge()
returns int
as
begin
    return (select AVG(Age)from Teachers)
end


create procedure usp_checkStudentsAndTeachersAvgAges
@studentAvgAge int,
@teacherAvgAge int
as
begin
    if @studentAvgAge>@teacherAvgAge
	    print 'Student average age is bigger than teachers average ages'

	else
	    print 'Student average age is not bigger than teachers average ages'

end

declare @stuAvgAge int=select dbo.getStudentsAvgAge()
declare @teachvgAge int=select dbo.getTeachersAvgAge()


exec usp_checkStudentsAndTeachersAvgAges @stuAvgAge,@teachAvgAge


Declare @Counter int
set @Counter=1
WHILE(@Counter <=10)
begin
     print 'The counter value is='+ CONVERT(nvarchar,@counter)
	 set @counter =@counter + 1
end


