

-- find the healthiest employees for the bouns 

select * 
from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index < 25 
and Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

-- count of all non-smokers
select count(*)  AS "non smoker "  from Absenteeism_at_work
where Social_smoker = 0

-- filan query

select
a.ID,
r.Reason,
Month_of_absence,
CASE WHEN Month_of_absence in(12,1,2) THEN 'Winter'
	 WHEN Month_of_absence in(3,4,5) THEN 'Spring'
	 WHEN Month_of_absence in(6,7,8) THEN 'Summer'
	 WHEN Month_of_absence in(9,10,11) THEN 'Fall'
	 ELSE 'unknown' END as season_names,
Body_mass_index,
CASE WHEN Body_mass_index < 18.5 THEN 'Underweight'
	 WHEN Body_mass_index between 18.5 and 25 THEN 'Healthy weight'
	 WHEN Body_mass_index between 25 and 30  THEN 'Over weight'
	 WHEN Body_mass_index > 30 THEN 'Obese'
	 ELSE 'unknown' END AS BMI_category,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation c
	on a.ID = c.ID
left join Reasons r
	on a.Reason_for_absence = r.Number;