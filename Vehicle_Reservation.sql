create database Vehicle_Reservation
use Vehicle_Reservation


create table Admin_Info
(Admin_id varchar(50),
First_Name varchar(50),
Last_Name varchar(50),
Age int,
Gender varchar(10),
Contact_Number varchar(10),
Email_ID varchar(50),
Pass_word varchar(50),
Securityqn varchar(255),
Securityans varchar(50),
Branch varchar(50)
);

select * from Admin_Info

drop table Admin_Info


create procedure insert_admin(@employeeidad varchar(50),@fnamead varchar(50),@lnamead varchar(50),@agead int,@genderad varchar(50),@contactnoad varchar(50),@emailad varchar(50),@passwordad varchar(50),@securityqnad varchar(50),@securityansad varchar(50),@branchad varchar(50))
as
begin
insert into Admin_Info(Admin_Id,First_Name,Last_Name,Age,Gender,Contact_Number,Email_ID,Pass_word,Securityqn,Securityans,Branch)
values (@employeeidad,@fnamead,@lnamead,@agead,@genderad,@contactnoad,@emailad,@passwordad,@securityqnad,@securityansad,@branchad)
end


create table User_Info
(Employee_Id varchar(50),
First_Name varchar(50),
Last_Name varchar(50),
Age int,
Gender varchar(10),
Contact_Number varchar(10),
Email_ID varchar(50),
Pass_word varchar(50),
Securityqn varchar(255),
Securityans varchar(50),
Branch varchar(50)
);

select * from User_Info

drop table User_Info


alter procedure insert_user(@employeeid varchar(50),@fname varchar(50),@lname varchar(50),@age int,@gender varchar(50),@contactno varchar(50),@email varchar(50),@password varchar(50),@securityqn varchar(50),@securityans varchar(50),@branch varchar(50))
as
begin
insert into User_Info(Employee_Id,First_Name,Last_Name,Age,Gender,Contact_Number,Email_ID,Pass_word,Securityqn,Securityans,Branch)
values (@employeeid,@fname,@lname,@age,@gender,@contactno,@email,@password,@securityqn,@securityans,@branch)
end


create table Vehicle_Info(
VehicleID int not null identity(100,1) ,
Vehicle_No varchar(50),
Branch varchar(50),
Insurance_Type varchar(50),
Vehicle_Type varchar(50),
Insurance_Expiry_Date date,
last_Serviced_Date date,
Service_due_date date,
primary key(VehicleID)
);

select * from Vehicle_Info

drop table Vehicle_Info


create proc search
@Vehicle_No varchar(50)
as
begin
select* from Vehicle_Info where Vehicle_No=@Vehicle_No;
end

drop proc search


Insert into Vehicle_Info(Vehicle_No,Branch,Vehicle_Type,Insurance_Type,Insurance_Expiry_Date,last_Serviced_Date,Service_due_date)
values('TN67 AJ8011','Siruseri', 'TVS XL' ,'Personal Injury Protection','09-25-2019','10-30-2019','12-25-2019');

select * from Vehicle_Info




alter proc Login
@employeeid varchar(50),
@password varchar(50)
as 
begin 
declare @status int
If EXISTS (Select * from User_Info where Employee_Id=@employeeid and Pass_word=@password)
set @status=1
else
set @status=0
select @status
end


create proc Loginad
@employeeidad varchar(50),
@passwordad varchar(50)
as 
begin 
declare @status int
If EXISTS (Select * from Admin_Info where Admin_Id=@employeeidad and Pass_word=@passwordad)
set @status=1
else
set @status=0
select @status
end


alter proc forgotpassword
@employeeid varchar(50),
@password varchar(50)
as 
begin
update User_Info set Pass_word=@password 
where Employee_Id=@employeeid
end


create proc forgotpasswordad
@employeeidad varchar(50),
@passwordad varchar(50)
as 
begin
update Admin_Info set Pass_word=@passwordad
where Admin_Id=@employeeidad
end


alter procedure Security
@employeeid varchar(50),
@securityqn varchar(255),
@securityans varchar(50)
as
begin
declare @status int
if Exists (Select * from User_Info where Employee_Id=@employeeid and Securityqn=@securityqn and Securityans=@securityans)
set @status=1
else
set @status=0
select @status
end


create procedure Securityad
@employeeidad varchar(50),
@securityqnad varchar(255),
@securityansad varchar(50)
as
begin
declare @status int
if Exists (Select * from Admin_Info where Admin_Id=@employeeidad and Securityqn=@securityqnad and Securityans=@securityansad)
set @status=1
else
set @status=0
select @status
end


create procedure ExpiryDate
@Vehicle_No varchar(50),
@Insurance_Expiry_Date varchar(255) 
as
begin
Select Insurance_Expiry_Date from Vehicle_Info where Vehicle_No=@Vehicle_No
end
