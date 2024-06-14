/* where statement
=, <>, <, >, and, or, like, null, non null, in
*/

select *
from EmployeeDemographichs
where FirstName = 'jim'

/*tidak sama dengan*/
select *
from EmployeeDemographichs
where FirstName <> 'jim'

select *
from EmployeeDemographichs
where age > 30

select *
from EmployeeDemographichs
where age <= 30

select *
from EmployeeDemographichs
where age <= 30 and gender = 'Male'

select *
from EmployeeDemographichs
where age <= 30 or gender = 'Male'

-- WILDCARD
/* bisa digunakan untuk numerik maupun teks . ingin semua orang yang nama belakangnya dimulai dengan s  
*/

select *
from EmployeeDemographichs
where LastName like 's%'

/* bisa digunakan untuk numerik maupun teks . ingin semua orang yang namanya ada s (letaknya di mana saja depan, blakang dll)
di kolom lastname di tamplkan  
*/
select *
from EmployeeDemographichs
where LastName like '%s%'

-- hanya akan menampilkan nama belakang 'scott' karena 's%o%' artinya dimuali dari huruf s dan huruf o di mana saja letaknya
select *
from EmployeeDemographichs
where LastName like 's%o%'  

select *
from EmployeeDemographichs
where LastName like 's%ott%'  


select *
from EmployeeDemographichs
where LastName like 's%ott%c%'  -- tidak ada yang ditmpilkan karena jika kita meletakkan c di belakang, itutidak akan mengembalikan karena
								-- sudah sesuai urutannya 'scott' jadi tidak s oot c, huruf c nya sebenarnya perlu di letakkan di depan s
								-- 's%c%ott%'

-- NULL
select *
from EmployeeDemographichs
where FirstName is null

select *
from EmployeeDemographichs
where FirstName is not null

-- IN 
select *
from EmployeeDemographichs
where FirstName = 'jim' and FirstName = 'kevin' -- tidak akan menampilkan apa2 untuk mengatasinya adalah dengan menggunakan sintaks in

select *
from EmployeeDemographichs
where FirstName in ('jim', 'kevin')