create database CourseDatabase

use CourseDatabase



create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)


create procedure usp_createCountries
@name nvarchar (100)
as
begin
     
	 insert into Countries([Name])
     values(@name)
end


exec usp_createCountries 'Azerbaycan'
exec usp_createCountries 'Turkiye'
exec usp_createCountries 'Ukrayna'

select * from Countries



create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar (50),
[CountryId] int
foreign key ([CountryId]) references Countries(Id)
)


create procedure usp_createCity
@name nvarchar (100),
@countryId nvarchar(100)
as
begin
     
	 insert into Cities([Name],[CountryId])
     values(@name,@countryId)
end


exec usp_createCity 'Baki',1
exec usp_createCity 'Istanbul',2
exec usp_createCity 'Odessa',3


select * from Cities




create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar (50),
[Address] nvarchar (50),
[Age] int,
[Email] nvarchar (100),
[CityId] int
foreign key ([CityId]) references Cities(Id)
)


create procedure usp_createStudent
@name nvarchar (100),
@surname nvarchar(100),
@address nvarchar(100),
@age int,
@email nvarchar(100),
@cityId int
as
begin
     
	 insert into Students([Name],[Surname],[Address],[Age],[Email],[CityId])
     values(@name,@surname,@address,@age,@email,@cityId)
end


exec usp_createStudent 'Esgexran','Bayramov','Yasamal',26,'esgerxan@gmail.com',1
exec usp_createStudent 'Behruz','Eliyev','Kurdexani',33,'behruz@gmail.com',1
exec usp_createStudent 'Omer','Atay','Kadikoy',27,'omer@gmail.com',2
exec usp_createStudent 'Nadya','Katova','Bolhrad',29,'nadya@gmail.com',3

select * from Students


create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Capacity] int,
[RoomId] int,
[EducationId] int,
foreign key ([RoomId]) references Rooms(Id),
foreign key ([EducationId]) references Educations(Id)
)


create procedure usp_createGroup
@name nvarchar (100),
@capacity int,
@roomId int,
@educationId int
as
begin
     
	 insert into Groups([Name],[Capacity],[RoomId],[EducationId])
     values(@name,@capacity,@roomId,@educationId)
end


exec usp_createGroup 'Pb101',20,1,1
exec usp_createGroup 'P103',18,2,2
exec usp_createGroup 'PA105',24,3,3


select * from Groups

 



create table StudentGroups(
[Id] int primary key identity(1,1),
[StudentId] int,
[GroupId] int,
foreign key ([StudentId]) references Students(Id),
foreign key ([GroupId]) references Groups(Id)
)



insert into StudentGroups([StudentId],[GroupId])  
values(1,1),
      (2,2),
	  (3,3)


select * from StudentGroups





create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50),
[Salary]float,
[Address] nvarchar(100),
[Email] nvarchar(100)
)


create procedure usp_createTeacher
@fullName nvarchar(100),
@salary float,
@address nvarchar(100),
@email nvarchar(100)
as
begin
     
	 insert into Teachers([FullName],[Salary],[Address],[Email])
     values(@fullName,@salary,@address,@email)
end

exec usp_createTeacher 'Cavid Bashirov',1000,'Ehmedli','cavid@gmail.com'
exec usp_createTeacher 'Vuqar Ehmedzade',900,'Yasamal','vuqar@gmail.com'
exec usp_createTeacher 'Famil Abbasov',1200,'Elimler','famil@gmail.com'

select * from Teachers




create table GroupTeachers(
[Id] int primary key identity(1,1),
[GroupId] int,
[TeacherId] int
foreign key ([GroupId]) references Groups(Id),
foreign key ([TeacherId]) references Teachers(Id)
)


create procedure usp_createGroupTeahcer
@groupId int,
@teacherId int
as
begin
     
	 insert into GroupTeachers([GroupId],[TeacherId])
     values(@groupId,@teacherId)
end

exec usp_createGroupTeahcer 1,1
exec usp_createGroupTeahcer 2,2
exec usp_createGroupTeahcer 3,3



select * from GroupTeachers



create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Capacity] int
)

create procedure usp_createRoom
@name nvarchar(50),
@capacity int
as
begin
     
	 insert into Rooms([Name],[Capacity])
     values(@name,@capacity)
end

exec usp_createRoom 'Sun',20
exec usp_createRoom 'Neptun',15
exec usp_createRoom 'Saturn',25



select * from Rooms







create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)

create procedure usp_createEducation
@name nvarchar(100)
as
begin
     
	 insert into Educations([Name])
     values(@name)
end

exec usp_createEducation 'Proqramlasdirma'
exec usp_createEducation 'Dizayn'
exec usp_createEducation 'DigitalMarketing'

select * from Educations


create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50),
[Age] int,
[Salary] float,
[CityId] int
foreign key ([CityId]) references Cities(Id)
)


create procedure usp_createStaffMember
@fullName nvarchar(100),
@age int,
@salary float,
@cityId int
as
begin
     
	 insert into StaffMembers([FullName],[Age],[Salary],[CityId])
     values(@fullName,@age,@salary,@cityId)
end

exec usp_createStaffMember 'Fual Quluzade',24,1000,1
exec usp_createStaffMember 'Amil Bedelov',29,1500,1
exec usp_createStaffMember 'Eli Ismayilov',35,2000,2
exec usp_createStaffMember 'Samir Hesenov',26,1800,3


select * from StaffMembers





create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[DepartmentId] int
foreign key ([DepartmentId]) references Departments(Id) 
)


create procedure usp_createRole
@name nvarchar(100),
@departmentId int
as
begin
     
	 insert into Roles([Name],[DepartmentId])
     values(@name,@departmentId)
end

exec usp_createRole 'Course Builder',1
exec usp_createRole 'Grader',2
exec usp_createRole 'Guest',3


select * from Roles



create table Departments(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)


create procedure usp_createDepartment
@name nvarchar(50)
as
begin
     
	 insert into Departments([Name])
     values(@name)
end

exec usp_createDepartment 'IT Department'
exec usp_createDepartment 'Marketing Department'
exec usp_createDepartment 'Designer Department'


select * from Departments






create table RoleStaffMembers(
[Id] int primary key identity(1,1),
[RoleId] int,
[StaffMemberId] int,
foreign key ([RoleId]) references Roles(Id),
foreign key ([StaffMemberId]) references StaffMembers(Id)
)



create procedure usp_createRoleStaffMember
@roleId int,
@staffMemberId int
as
begin
     
	 insert into RoleStaffMembers([RoleId],[StaffMemberId])
     values(@roleId,@staffMemberId)
end

exec usp_createRoleStaffMember 1,1
exec usp_createRoleStaffMember 2,2
exec usp_createRoleStaffMember 3,3

select * from RoleStaffMembers
