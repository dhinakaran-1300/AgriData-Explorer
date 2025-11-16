use agri_db;

select * from agri_data;

#------------------------------------------------------------------------------#
# 1.year-wise trend of rice production across states (top 3)

select year, state_name, rice_production
from(
select year, state_name, sum(rice_production_1000_tons) as rice_production,
rank() over(partition by year order by sum(rice_production_1000_tons) desc) as rnk
from agri_data
group by year, state_name) t
where rnk <= 3
order by year, rice_production desc;

#------------------------------------------------------------------------------#
# 2.top 5 districts by wheat yield increase over the last 5 years

select dist_name,
(sum(if(year=(select max(year) from agri_data), wheat_yield_kg_per_ha, null)) -
 sum(if(year=(select max(year)-4 from agri_data), wheat_yield_kg_per_ha, null))) as yield_increase
from agri_data
group by dist_name
order by yield_increase desc
limit 5;

#------------------------------------------------------------------------------#
# 3.states with the highest growth in oilseed production (5-year growth rate)

set @current_year = (select max(year) from agri_data);
set @ago_5 = @current_year - 4;

select state_name,
sum(if(year=@current_year, oilseeds_production_1000_tons, 0)) as current_year,
sum(if(year=@ago_5, oilseeds_production_1000_tons, 0)) as five_year_ago,
round(((sum(if(year=@current_year, oilseeds_production_1000_tons, 0)) -
        sum(if(year=@ago_5, oilseeds_production_1000_tons, 0))) /
        sum(if(year=@ago_5, oilseeds_production_1000_tons, 0)) ) * 100, 2) as growth_rate
from agri_data
group by state_name
order by growth_rate desc
limit 5;

#------------------------------------------------------------------------------#
# 4.district-wise correlation between area and production

select dist_name, rice_area_1000_ha, rice_production_1000_tons, rice_yield_kg_per_ha,
wheat_area_1000_ha, wheat_production_1000_tons, wheat_yield_kg_per_ha,
maize_area_1000_ha, maize_production_1000_tons, maize_yield_kg_per_ha
from agri_data;

#------------------------------------------------------------------------------#
# 5.yearly production growth of cotton in top 5 producing states

select state_name, sum(cotton_production_1000_tons) as cotton_production from agri_Data group by state_name order by cotton_production desc limit 5;

select a.state_name, a.year, sum(a.cotton_production_1000_tons) as cotton_production,
sum(a.cotton_production_1000_tons)-lag(sum(a.cotton_production_1000_tons)) over(partition by a.state_name order by a.year) as growth_rate
from agri_data a
join(
select state_name from agri_data
group by state_name
order by sum(cotton_production_1000_tons) desc
limit 5) t
on a.state_name = t.state_name
group by a.state_name, a.year
order by a.state_name, a.year;

#------------------------------------------------------------------------------#
# 6.districts with the highest groundnut production in 2017

select dist_name, sum(groundnut_production_1000_tons) as groundnut_production
from agri_data
where year = 2017
group by dist_name
order by groundnut_production desc
limit 7;

#------------------------------------------------------------------------------#
# 7.annual average maize yield across all states

select year, round(avg(maize_yield_kg_per_ha),2) as avg_maize_yield
from agri_data
group by year
order by year;

#------------------------------------------------------------------------------#
# 8.total area cultivated for oilseeds in each state

select state_name, sum(oilseeds_area_1000_ha) as total_oilseeds_area
from agri_data
group by state_name
order by total_oilseeds_area desc;

#------------------------------------------------------------------------------#
# 9.districts with the highest rice yield

select dist_name, avg(rice_yield_kg_per_ha) as rice_yield
from agri_data
group by dist_name
order by rice_yield desc
limit 10;

#------------------------------------------------------------------------------#
# 10.compare wheat & rice production for top 5 states over 10 years

select a.year, a.state_name, sum(a.rice_production_1000_tons) as rice_prod, sum(a.wheat_production_1000_tons) as wheat_prod from agri_data a 

join(select state_name, sum(rice_production_1000_tons) + sum(wheat_production_1000_tons) as total from agri_data 

where year between (select max(year) - 9 from agri_data) and (select max(year) from agri_data) group by state_name order by total desc limit 5) t
on a.state_name = t.state_name 

where a.year between (select max(year) - 9 from agri_data) and (select max(year) from agri_data)

group by a.year, a.state_name 
ORDER BY a.year, rice_prod desc;
 
#------------------------------------------------------------------------------#

with last10 as( select * from agri_data where year between (select max(year) - 9 from agri_data) and (select max(year) from agri_data)),

top5 as (select state_name, sum(rice_production_1000_tons) + sum(wheat_production_1000_tons) as totol_prod from last10 group by state_name order by totol_prod desc limit 5 )

select l.year, l.state_name, sum(l.rice_production_1000_tons) as  rice_prod, sum(l.wheat_production_1000_tons) as wheat_prod  from last10 l 

join top5 t on l.state_name = t.state_name 
group by l.year, l.state_name
ORDER BY l.year, rice_prod DESC;