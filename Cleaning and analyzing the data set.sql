use projects;
#How many unique movies
Select Count(Distinct(movie_title))
From movies;
# Question 1:
# How many movies release per year?

Select release_year,Count(movie_title) as total_movies
From movies
Group BY 1;

# Question 2:
# How many movies release per year between 2015 and 2020?

Select release_year,Count(movie_title) as total_movies
From movies
Where release_year Between '2015' and '2020'
Group BY 1;

# Question 3:
#Is gross more if number of moveies release more?

Select release_year,Count(movie_title) as total_movies,Concat('$ ',Sum(gross)) as total_gross
From movies
Group BY 1
Order By total_gross Desc;

#Question 4:
#Which company has released more Than hunderd movies?

Select company,Count(movie_title) as total_movies
From movies
Group By 1
Having Count(movie_title)>100
Order By total_movies Desc;

# Question 5:
##Which company has more gross and  votes?

Select company ,Sum(gross) as total_gross ,Count(movie_title),votes
From movies
Group by 1,4
Order by total_gross Desc
limit 10;

#Question 6
#How many movies has more than and less than and equal to 10 million gross per country

Select 
Case 
When gross<10000000 then 'not good'
When gross=10000000 then 'good'
When gross>10000000 then 'very good'
End as ranking,count(movie_title) as total_movies
From movies
Group by 1
Order By total_movies Desc;

# Qustion 7:
#How many movies released by united states , United kingdom ,Italy,Canada and France and 
#how much  average gross they have?

Select country,Count(movie_title) as total_movies,Concat('$',Round(avg(gross),2)) as average_gross
from movies
Where country in ('United States','United Kingdom','Italy','Canada','France')
Group by country
Order bY total_movies Desc;

#Question 8
#Is there a correlation between a movie's budget and its box office gross?

Select Concat('$',Round(avg(budget),2)) as average_budget, Concat('$',Round(avg(gross),2)) as average_gross
From movies;

# Question 9
# What is relationship of genre with User score and votes?

Select genre ,avg(score) as average_score,avg(votes) as average_votes
From movies
Group By 1
Order By average_votes Desc;

# Question 10
#Is there any months trends in data.
Select count(movie_title) as total_movies,month(released_date) as release_month,sum(gross) as total_gross
From movies
Group By 2
Order by release_month;