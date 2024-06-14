/*  Aliasing */


select * 
from [SQLtutorial].[dbo].[EmployeeDemographichs]

/* aliasing tidak mempengaruhi data, hanya memberikan nama pada kolom2.
menggunakan alias sangat penting ketika kita ingun menyerahkan skrip ini ke orang lain sehingga orang lain dapat mengerti, 
terlihat tidak terlalu berguna ketika data hanya sedikit, namun akan sangat berguna ketika menggunakan data yang digabung banyak.*/

									-- ALIAS UNTUK KOLOM NAME

select FirstName as Fname	-- mengganti nama kolom, dan bisa digunakan tanpa kata 'as' / hanya spasi
from [SQLtutorial].[dbo].[EmployeeDemographichs]

-------------------------------------------------------MENGKOMBINASIKAN KOLOM DAN SERTA MEMBERIKAN NAMA BARU ------------------
select FirstName + ' ' + LastName as FullName
from [SQLtutorial].[dbo].[EmployeeDemographichs]


------------------------------------------------------------------------------------------------------------------------------
select avg(age)											-- tanpa nama kolom hasil average
from [SQLtutorial].[dbo].[EmployeeDemographichs]

select avg(age)	as AVGAGE
from [SQLtutorial].[dbo].[EmployeeDemographichs]


									-- ALIAS UNTUK TABEL NAME
---------------------------------------------------------------------- memberikan alias pada kolom demograpich sebagai demo
select demo.EmployeeID
from [SQLtutorial].[dbo].[EmployeeDemographichs] as demo


select demo.EmployeeID, sal.Salary
from [SQLtutorial].[dbo].[EmployeeDemographichs] as demo
join [SQLtutorial].[dbo].[EmployeeSalary] as sal
	on demo.EmployeeID = sal.EmployeeID

-- tidak memberikan konteks apapun atau informasi karna hanya menginisialkan dengan huruf2 saja atau tidak ada informasi
-- tabel mana yang direferensikan. bayangkan kalau banyak kolom atau tabel yang digunakan maka akan membingungkan. 

select a.EmployeeID, a.FirstName, a.FirstName, b.JobTitle, c.age
from [SQLtutorial].[dbo].[EmployeeDemographichs]	 a
left join [SQLtutorial].[dbo].[EmployeeSalary]	b
	on a.EmployeeID = b.EmployeeID
left join [SQLtutorial].[dbo].[WareHouseEmployeeDemographics] c
	on a.EmployeeID = c.EmployeeID

-- lebih baik seperti di bawah ini dibandingkan menggunakan 1 huruf saja.

select demo.EmployeeID, demo.FirstName, demo.FirstName, sal.JobTitle, ware.age
from [SQLtutorial].[dbo].[EmployeeDemographichs]	 demo
left join [SQLtutorial].[dbo].[EmployeeSalary]	sal
	on demo.EmployeeID = sal.EmployeeID
left join [SQLtutorial].[dbo].[WareHouseEmployeeDemographics] ware
	on demo.EmployeeID = ware.EmployeeID