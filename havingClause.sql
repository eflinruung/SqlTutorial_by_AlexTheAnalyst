/* having clause */


/* Fungsi agregat adalah fungsi yang menentukan berbagai kumpulan nilai. Mulai dari jumlah, rata-rata, nilai minimum, 
nilai maksimum, dan lain-lain.  */

---------------------- TIDAK DAPAT MENGGUNAKAN WHERE ---------------------------

/* outputnya eror,  karena where tidak dapat digunkan atau tdk dapat menampilkan agregat. */

select JobTitle, COUNT(JobTitle) 
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
where count(JobTitle) >1	
group by JobTitle 
--order by count(JobTitle)

---------------------------------------- HAVING -----------------------------------------------------

------------------- MENGGUNAKAN COUNT ----------------------
-- perlu diperhatikan penyusunan dari sintaks agar tidak terjadi eror, seperti contoh di bawah ini

select JobTitle, COUNT(JobTitle)
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
having count(JobtTitle) > 1
group by JobTitle

select JobTitle, count(JobTitle)	-- artinya saya mau menampilkan kolom jobtitle yang di group kan berdasarkan count(jobtitle)
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having COUNT(jobtitle) > 1

/* PERCOBAAN : ketika group by di isi dengan jobtitle maka akan eror. ternyata terpengaruh dari select
kolom yang akan ditampilkan hanya satu kolom yaitu salary dengan berdasar agregat count(jobtitle), bahkan ketika menambah kolom jobtitle
di sintaks select tetap tidak bisa*/

select Salary, count(JobTitle)
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle

select Salary, count(JobTitle) -- artinya saya mau menampilkan kolom salary yang di group kan berdasarkan count(jobtitle)
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
group by Salary

------------------- MENGGUNAKAN AVG ----------------------


select JobTitle, avg(Salary)
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having AVG(salary) > 45000
order by AVG(salary)
--having COUNT(jobtitle) > 1