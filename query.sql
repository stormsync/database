-- name: InsertReport :copyfrom
insert into reports (rpt_type, reported_time, created_at, var_col, dist_from_location, heading_from_location, county,
                     "state", latitude, longitude, event_location, comments, nws_office, location)
values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14);


-- name: GetAllReportsByTypeByDate :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where reported_time = $1
  AND rpt_type = $2
order by reported_time;




-- name: GetReportsByTypeByCountyAndState :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where county = $1
    AND "state" = $2
    AND rpt_type = $3
order by reported_time;

-- name: GetReportsByTypeByState :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where "state" = $1
    AND rpt_type = $2
order by reported_time;


-- name: GetReportsByType :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where rpt_type = $1
order by reported_time;



-- name: GetAllReportsByDate :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where reported_time = $1
order by reported_time;



-- name: GetReportsByCountyAndState :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where county = $1
    AND "state" = $2
order by reported_time;

-- name: GetReportsByState :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where "state" = $1
order by reported_time;


-- name: GetAllReports :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       "state",
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
order by reported_time;

