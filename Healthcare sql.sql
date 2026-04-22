select *from healthcare_Dataset;

SET SQL_SAFE_UPDATES = 0;

Update healthcare_dataset set name= upper(name) ;


-- Total Patients
select count(distinct(Name)) As `Total patients` from healthcare_dataset ;

-- Total Hospitals
select count(distinct(Hospital)) As `Total Hospital` from healthcare_dataset ;

-- Total Doctors
select count(distinct(Doctor)) As `Total Doctors`  from healthcare_dataset ;

-- average billing amount
select round(avg(`Billing Amount`)) as `Billing amount` from healthcare_dataset;

-- max billing amount
select round(max(`Billing Amount`))from healthcare_dataset;

-- Test Result
SELECT count(distinct(`Test Results`)) AS `Test Results`
FROM healthcare_dataset;

-- Total Rooms
select count(distinct(`Room number`)) As `Total Rooms`  from healthcare_dataset ;

-- Blood group Wise Total Patients
select `Blood Type`,count(Name)  As `Blood group Wise Total Patients` from healthcare_dataset group by `Blood Type` ;

-- Gender wise patient count
select	Gender,count(Name) as `gender wise patient count` from healthcare_dataset group by `gender`;

-- Medical Condition Wise Total Patients
select `Medical Condition`, count(name) as `Medical Condition Wise Total Patients` 
from healthcare_dataset group by `Medical Condition`;

-- Yearly Total Patients
select year(`Date of Admission`),count(Name) as `Yearly Total Patients` from healthcare_dataset 
group by year(`Date of Admission`);

-- Age group wise total customers
select 
	case 
		when age>0 and age<20 then "0-19"
        when age>=20 and age<40 then "20-39"
        when age>=40 and age<60 then "40-59"
		when age>=60 and age<90 then "60-90"
        else "90+"
        end as group_age,
        count(distinct(`name`)) as `Age group wise total customers`
from healthcare_dataset group by `group_age` order by count(distinct(`name`));

-- Which age group has the highest number of patients?
select 
	case 
		when age>0 and age<20 then "0-19"
        when age>=20 and age<40 then "20-39"
        when age>=40 and age<60 then "40-59"
		when age>=60 and age<90 then "60-90"
        else "90+"
        end as group_age,
        count(distinct(`name`)) as `Age group wise total customers`
from healthcare_dataset 
group by `group_age` 
order by count(distinct(`name`))desc 
limit 1;

-- Which medical condition is most common?
select `medical condition`,count(distinct(`name`)) as `medical condition wise total patient` from healthcare_dataset
group by `medical condition` order by count(distinct(`name`)) desc limit 1;

-- Which blood group appears most frequently?
select  `Blood Type`,count(distinct(`name`)) as `Most frequently occuring blood group` from healthcare_dataset 
group by `blood type` order by count(distinct(`name`))desc limit	1;


