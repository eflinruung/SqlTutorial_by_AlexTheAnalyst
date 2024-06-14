/* union, union all */

/*  */

/* tabel warehousedemographics sama persis dengan tabel employee demographics */
select *
from EmployeeDemographichs

select *
from WareHouseEmployeeDemographics

select *
from EmployeeSalary


select *
from SQLtutorial.dbo.EmployeeDemographichs
full outer join SQLtutorial.dbo.WareHouseEmployeeDemographics
	on EmployeeDemographichs.EmployeeID = WareHouseEmployeeDemographics.EmployeeID


-------------------------- PENGGUNAAN UNION/UNION ALL DENGAN MENGGUNAKAN TABEL YANG SAMA PERSIS -------------------------------------

------------------------------------- UNION --------------------------------------------------------
/* beda halnya dengan outer all join , left ataupun right yang menggabungkan tabel kesamping. 
union menggabungkan tabel dengan menjadikannya satu baris tabel atau ke bawah, serta dapat menghilangkan duplikat
contohnya pada nama darryl baik tabel EmployeeDemographics ataupun WareHouseEmployeeDemographics memiliki value yang sama persis dan hanya
tertuliskan satu kali */

select *
from SQLtutorial.dbo.EmployeeDemographichs
union
select *
from SQLtutorial.dbo.WareHouseEmployeeDemographics

--------------------------------- UNION ALL -----------------------------------------------------
/* khusus untuk union all menggabungkan semua tabel tanpa terkecuali. contohnya pada nama darryl tertuliskan sebanyak dua kali
sama halnya ada duplikat */

select *
from EmployeeDemographichs
union all 
select *
from WareHouseEmployeeDemographics
order by EmployeeID  -- ketika menggunakan order by akan ada perubahan pada urutan employee id ketika menggunakan order by menempatkan null
					 -- pada baris pertama


------------------------ BAGAIMANA JIKA TABELNYA BERBEDA/ MEMBERIKAN INFORMASI YANG BERBEDA -----------------
/* ketika dicoba menggunakan select * menghasilkan output yang error. sesuai dengan tutorial select memilih tabel beberapa
tabel tertentu yang akan digunakan. 
outputnya employee id nya disatukan sekaligus sehingga ada duplikat di tabel employee id karena info nya yang berbeda pada tabel pasangannya
tabel employeeid jobtitle dan salary jadi tergabung menjadi satu pada tabel EmployeeID, FirstName, Age karena tipe datanya pun sama sehingga
menjadi satu kesatuan.*/

select EmployeeID, FirstName, Age
from EmployeeDemographichs
union
select EmployeeID, JobTitle, Salary
from EmployeeSalary
order by EmployeeID