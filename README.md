# Portfolio
Code for showcasing skills

/*

Campus Data Exploration

Skills used: Joins and Aggregate Functions

*/

-- Outputs campuses and respective number of degrees issued during the year of 2004 in descending order

select campuses.campus, degrees.degrees
from campuses
inner join degrees on campuses.id=degrees.campus 
where degrees.year = '2004' 
order by degrees.degrees desc 

-- Outputs the top 3 most expensive campuses and their campus fees for the year 2004

select top 3 campuses.campus, campusfee
from campuses
inner join csu_fees on campuses.id=csu_fees.campus
where csu_fees.year = '2004'
order by campusfee desc 

-- Average undergraduate to graduate ratio in US universities

select avg(undergraduate/graduate) as ugratio
from discipline_enrollments
where undergraduate > 0 and graduate > 0 

-- CSU Dataset Retrieved from: http://users.csc.calpoly.edu/~dekhtyar/365-Winter2015/index.html

-- Dataset description: http://users.csc.calpoly.edu/~dekhtyar/365-Winter2015/data/CSU/README.CSU.TXT

* Axel Ahlberg

