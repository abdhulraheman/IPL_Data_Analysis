USE ipl_analysis;

SELECT COUNT(*) FROM matches;
SELECT COUNT(*) FROM deliveries;

SELECT * FROM matches LIMIT 5;
SELECT * FROM deliveries LIMIT 5;

select year(date) from matches;

alter table matches
add column season_year int not null;

update matches
set season_year = year(date);

select `over` from deliveries;

alter table deliveries
rename column `over` to over_num;

select over_num from deliveries;

-- 1) Which team has won the most matches overall?

select winner, count(*) as Total_wins from matches
group by winner
order by count(*) desc
limit 1;

-- 2) Which top 3 cities have hosted the most IPL matches?

select city, count(*) as Total_hosted from matches
group by city
order by Total_hosted desc
limit 3;

-- 3) Which top 5 Players have won the most Player of the Match awards?

select player_of_match, count(*) as Total_awards from matches
group by player_of_match
order by Total_awards desc
limit 5;

-- 4) Which venue have hosted the highest number of matches?

with all_venues as(
select venue, count(*) as Total_hosted from matches
group by venue
order by Total_hosted desc)

select venue, Total_hosted from all_venues
where Total_hosted = (select max(Total_hosted) from all_venues);

-- 5) How many matches were played in each IPL season?

select season_year, count(*) as Count_of_Matches from matches
group by season_year
order by Count_of_Matches desc;

-- 6) According to season wise and team wise, how many matches did the teams won?

select season_year, winner, count(*) as win_count from matches
group by season_year, winner
order by season_year;

-- 1) Which batter has scored the most runs in IPL history?

with batters_score as(
select batter, sum(batsman_runs) as Total_runs from deliveries
group by batter
order by Total_runs desc)

select batter, Total_runs from batters_score
where Total_runs = (select max(Total_runs) from batters_score);

-- 2) Which bowler has taken thw most wickets?

with Bowlers_wickets as(
select bowler, sum(is_wicket) as Total_wickets from deliveries
group by bowler
order by Total_wickets desc)

select bowler, Total_wickets from Bowlers_wickets
where Total_wickets in (select max(Total_wickets) from Bowlers_wickets);

-- 3) Which over has produced the highest number of runs in IPL history?

with runs_over as(
select match_id, batting_team, over_num, sum(total_runs) as over_runs from deliveries
group by match_id, batting_team, over_num
order by over_runs desc)

select match_id, batting_team, over_num, over_runs from runs_over
where over_runs = (select max(over_runs) from runs_over);

-- 4) Which teams hit the most sixes?

select batting_team, count(*) as count_of_6s from deliveries
where batsman_runs = 6
group by batting_team
order by count_of_6s desc;

-- 5) What is the average first-innings score at each venue?

select m.venue, round(avg(d.total_runs),2) as avg_runs from deliveries d inner join matches m on d.match_id = m.id
where d.inning = 1
group by m.venue
order by avg_runs desc;

-- 6) 



-- 1) Which team won the most matches in each season?

with all_winners as(
select `season_year`, winner, count(*) as count, rank() over(partition by season_year order by count(winner) desc) as rank_order from matches
group by `season_year`, winner)

select * from all_winners
where rank_order = 1;

-- 2) Does winning the toss increase the chances of winning?

select t1.winner, t1.count_1, t2.count_2, round((t1.count_1/t2.count_2), 2) as perc from
(select winner, count(*) as count_1 from matches
where winner = toss_winner
group by winner) as t1
right join
(select toss_winner, count(*) as count_2 from matches
group by toss_winner) as t2 on t1.winner = t2.toss_winner
order by perc desc;

-- 3) Which batting partnerships scored the most runs?

select season_year, d.match_id, batting_team, least(batter, non_striker) as batter1, greatest(batter, non_striker) as batter2, sum(batsman_runs) as runs from deliveries d
inner join matches m on d.match_id = m.id
where batter != non_striker
group by season_year, d.match_id, batting_team, least(batter, non_striker), greatest(batter, non_striker)
order by runs desc;

-- 4) Which bowlers have the best economy rate?

select t1.bowler, total_runs, round(no_of_balls/6,0) as no_of_overs, round((total_runs/round(no_of_balls/6,0)), 2) as `eco_%` from(
select bowler, sum(total_runs) as total_runs from deliveries
group by bowler) as t1
inner join
(select bowler, count(*) as no_of_balls from deliveries
group by bowler
having no_of_balls > 300) as t2
on t1.bowler = t2.bowler
order by `eco_%`;


-- 5) Create an IPL team preformance report

-- | Team | Matches | Wins | Win % | Toss Wins | Sixes | Fours |

select ft1.team, (ft1.matches+ft2.matches) as matches, (ft1.winner+ft2.winner) as winner, 
round(((ft1.winner+ft2.winner)/(ft1.matches+ft2.matches))*100, 2) as `win_%`, ft1.`6s`, ft1.`4s` from (
select t1.team1 as team, matches, winner, round((winner/matches)*100, 2) as `win_%`, toss_winner, `6s`, `4s` from (
select team1, count(*) as matches from matches group by team1) as t1
left join
(select team1, count(winner) as winner from matches where team1 = winner group by team1) as t2
on t1.team1 = t2.team1
left join
(select team1, count(toss_winner) as toss_winner from matches where team1 = toss_winner group by team1) as t3
on t2.team1 = t3.team1
left join
(select batting_team, count(*) as `6s` from deliveries where batsman_runs = 6 group by batting_team) as t4
on t3.team1 = t4.batting_team
left join
(select batting_team, count(*) as `4s` from deliveries where batsman_runs = 4 group by batting_team) as t5
on t4.batting_team = t5.batting_team) as ft1
inner join
((select t1.team2 as team, matches, winner, round((winner/matches)*100, 2) as `win_%`, toss_winner from (
select team2, count(*) as matches from matches group by team2) as t1
left join
(select team2, count(winner) as winner from matches where team2 = winner group by team2) as t2
on t1.team2 = t2.team2
left join
(select team2, count(toss_winner) as toss_winner from matches where team2 = toss_winner group by team2) as t3
on t2.team2 = t3.team2)) as ft2
on ft1.team = ft2.team;

-- 6) 