/* partition by */

/* partition by sering dibandingkan dengan group by, yang mana group by mengurangi jumlah baris sedangnkan partition by membagi
hasil yang ditetapkan menjadi partisi tidak benar2 mengurangi jumlah baris pada output. 
 partition by meggroup sambil tetap mempertahankan kolom2 lainnya*/


-- ingin mengidentifikasi berapa banyak karyawan pria dan wanita yang sebenarnya kita punya.
-- pada outputnya ada pam beasley dengan gaji 36000 yang bekerja bersama 2 wanita lainnya.

-- contoh di bawah
-- partition by = ketika over () ini menunjukkan value dari keseluruhannya, misal gender berarti totalnya 8
-- sedangkan ketika over (partition by gender) ini menunjukkan masing-masing value dari nilai gendernya, misal male ada berapa, female berapa

select FirstName, LastName, Gender, Salary
, COUNT(gender) over (partition by gender) as TotalGender
from SQLtutorial..EmployeeDemographichs demo
join SQLtutorial..EmployeeSalary sal
	on demo.EmployeeID = sal.EmployeeID

------- KETIKA MENGGUNAKAN GROUP BY 
select FirstName, LastName, Gender, Salary, COUNT(gender)
from SQLtutorial..EmployeeDemographichs demo
join SQLtutorial..EmployeeSalary sal
	on demo.EmployeeID = sal.EmployeeID
group by FirstName, LastName, Gender, Salary

select Gender, COUNT(gender)
from SQLtutorial..EmployeeDemographichs demo
join SQLtutorial..EmployeeSalary sal
	on demo.EmployeeID = sal.EmployeeID
group by Gender
