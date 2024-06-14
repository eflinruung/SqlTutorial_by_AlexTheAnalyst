/*
Select statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

/* untuk menampilkan semua kolom */
Select *
from EmployeeDemographichs

/* hanya menampilkan 1 kolom tertentu */
Select FirstName
from EmployeeDemographichs

/* hanya menampilkan 2 kolom tertentu */
Select FirstName, LastName
from EmployeeDemographichs

/* hanya menampilkan top 5 baris untuk semua kolom (*),  */
Select top 5 *
from EmployeeDemographichs

/* unik values in spesific column */
Select distinct (EmployeeID)
from EmployeeDemographichs

/* as digunakan untuk memberikan nama pada kolom yang di count */
Select count(LastName) as LastNameCount
from EmployeeDemographichs




select max(Salary) as maximum
from EmployeeSalary

select min(Salary) 
from EmployeeSalary

select avg(Salary)
from EmployeeSalary


select *
from SQLtutorial.dbo.EmployeeSalary --> agar terdeteksi walaupun diluar database dengan catatan bahwa folder db nya tidak ada spasi