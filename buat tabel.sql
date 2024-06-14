create table WareHouseEmployeeDemographics
(EmployeeID int, 
FirstName Varchar(50),
LastName Varchar(50),
Age int,
Gender varchar(50)
)

insert into WareHouseEmployeeDemographics values
(1013, 'Darryl', 'Philbin', null, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

select *
from SQLtutorial.dbo.WareHouseEmployeeDemographics