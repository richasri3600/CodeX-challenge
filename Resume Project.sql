# Who prefers energy drink more
select  gender, count(Respondent_ID) as Total_Respondent
from dim_repondents
group by gender
order by Total_Respondent  desc;

#Age group which prefers energy drink
select age , count(Respondent_ID) as Total_Respondent
from dim_repondents
group by age
order by Total_Respondent desc;

#Marketing channel for youth
select Marketing_channels , count(fc.Respondent_ID) as Total_Respondents 
from fact_survey_responses fc
inner join dim_repondents dr 
on dr.Respondent_ID = fc.Respondent_ID
where age in ("15-18","19-30")
group by Marketing_channels
order by Total_Respondents desc;

# expected ingredients by respondents
select Ingredients_expected as Preferred_Ingredients ,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
group by Preferred_ingredients
order by Total_Respondents desc;

# Packaging preferences
select  Packaging_preference ,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
group by Packaging_preference
order by Total_Respondents desc;

# top leaders of energy drink market
select current_brands as Market_Leader,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
group by Market_leader
order by Total_Respondents desc;

# Reasons that thats brand are on top
select Reasons_for_choosing_brands, 
count(Respondent_ID) as Total_Respondents
from fact_survey_responses fc 
group by fc.Reasons_for_choosing_brands
order by Total_Respondents desc;

#  most effective marketing channel
select Marketing_channels,
count(Respondent_ID) as Total_Respondent
from fact_survey_responses
group by Marketing_channels
order by Total_Respondent desc;

# most effective marketing channel for codex
select Marketing_channels,
count(Respondent_ID) as Total_Respondent
from fact_survey_responses
where Current_brands ="Codex"
group by Marketing_channels
order by Total_Respondent desc;

# brand rating on basis of taste
select  Taste_experience,
Count(Respondent_ID) as Feedback_Count
from fact_survey_responses
where Current_brands = "CodeX"
group by Taste_experience
order by Feedback_Count desc;

# brand rating on basis of perception
select  Brand_perception,
Count(Respondent_ID) as Feedback_Count
from fact_survey_responses
where Current_brands = "CodeX"
group by Brand_perception
order by Feedback_Count desc;

# Cities which are doing good and the one which attention
select count(fc.Respondent_ID) as Total_Respondents,
dc.City, dc.Tier
from fact_survey_responses fc
inner join dim_repondents dr
on dr.Respondent_ID = fc.Respondent_ID
inner join dim_cities dc
on dc.City_ID = dr.City_ID
where fc.Current_brands = "CodeX"
group by  dc.City,dc.Tier
order by Total_Respondents desc;

# best purchase location
select Purchase_location,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
group by Purchase_location
order by Total_Respondents desc;

# consumption reason
select Typical_consumption_situations,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
group by Typical_consumption_situations
order by Total_Respondents desc;

# specific required price range
select Price_range,
count(Respondent_ID) as Total_Respondent
from fact_survey_responses
group by Price_range
order by Total_Respondent desc;

#packaging preffered
select Packaging_preference,
count(Respondent_ID) as Total_Respondent
from fact_survey_responses
group by Packaging_preference
order by Total_Respondent desc;

# why to choose this brand
select Reasons_for_choosing_brands,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
where Current_brands = "CodeX"
group by Reasons_for_choosing_brands
order by Total_Respondents desc;

# improvements that need to be done
select Improvements_desired,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
where Current_brands ="CodeX"
group by Improvements_desired
order by Total_Respondents desc;