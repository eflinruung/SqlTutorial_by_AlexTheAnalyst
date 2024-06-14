/* case statement */

/*  */


select FirstName, LastName, Age 
from EmployeeDemographichs
where age is not null   -- alasannya karena yang akan dikenakan code case adalah age, makanya age harus tidak ada yang null
order by age

------------------------------------------------------------------------------------------------------

select FirstName, LastName, Age, -- jangan lupa harus taruh tanda koma (,) kalau tidak error
case
	when Age > 30 then 'Old'
	else 'Young'
end
from EmployeeDemographichs
where age is not null


------------------------------------------------------------------------------------------------------

select FirstName, LastName, Age,
case 
	when age > 30 then 'Old'
	when age between 27 and 30 then 'Young'
	else 'Baby'
end
from EmployeeDemographichs
where age is not null
order by age


------------------------------------------------------------------------------------------------------

select FirstName, LastName, Age,
case 
	when age > 30 then 'Old'
	when age = 38 then 'Stanley'	-- tidak terdeteksi, pindahkan ke atas atau letakkan lebih awal sebelum age > 30
	else 'Baby'
end
from EmployeeDemographichs
where age is not null
order by age

select FirstName, LastName, Age,
case 
	when age = 38 then 'Stanley'	-- terdeteksi, karena akan dieksekusi terlebih dahulu atau bisa dikatakan value age = 38 ditandai terlebih
	when age > 30 then 'Old'		-- dahulu.
	else 'Baby'
end
from EmployeeDemographichs
where age is not null
order by age

-----------------------------MENGGUNAKAN JOIN & CASE STATETMENT-------------------------------------------------------------------------

select FirstName, LastName, Jobtitle, salary,
case
	when jobtitle = 'salesman' then salary + ( salary * .10)		-- 10%
	when jobtitle = 'Accountant' then salary + (salary * .05)		-- 5%
	when jobtitle = 'HR' then salary + (salary * .000001)			-- 
	else salary + (salary * .03)									-- 3 %
end as SalaryAfterRaise
from EmployeeDemographichs
join EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID