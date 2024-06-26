USE [SQLtutorial]
GO
/****** Object:  StoredProcedure [dbo].[temp_employee]    Script Date: 03/08/2023 20.43.20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER procedure [dbo].[temp_employee]
 @JobTitle nvarchar(100)  -- contoh kasus menambahkan parameter. ini yang akan di input (job title)
 as
 create table #temp_employee (
 JobTitle varchar(100),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )

 insert into #temp_employee
 select JobTitle, count(JobTitle), avg(age), avg(salary)
 from EmployeeDemographichs emp
join EmployeeSalary sal
	on Emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle		-- contoh kasus. jika jobtitle sama dengan hasil inputan (@jobtitle), stelah modifikasi selesai lakukan run
group by JobTitle


/* jika saya membuat stored procesures dan kemudian menjalankannya tidak ada yang tidak ada yang benar-benar dikembalikan itu akan 
memasukkan data ke dalam temp table itu tetapi karena saya tidak memiliki pernyataan select dalam stored procesures tidak ada yang 
dikembalikan jadi mari kita tambahkan sintaks seperti di bawah ini */

select *
from #temp_employee