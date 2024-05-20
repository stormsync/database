-- name: InsertReport :copyfrom
insert into reports (rpt_type, reported_time, created_at, var_col, dist_from_location, heading_from_location, county,
                     "state", latitude, longitude, event_location, comments, nws_office, location)
values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14);

-- name: GetWindReportsByDate :many
select rpt_type,
       reported_time,
       created_at,
       speed,
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
from wind_reports
where reported_time = $1
order by reported_time;

-- name: GetWindReportsByCountyAndState :many
select rpt_type,
       reported_time,
       created_at,
       speed,
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
from wind_reports
where county = $1
    AND "state" = $2
order by reported_time;

-- name: GetWindReportsByState :many
select rpt_type,
       reported_time,
       created_at,
       speed,
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
from wind_reports
where "state" = $1
order by reported_time;


-- name: GetAllWindReports :many
select rpt_type,
       reported_time,
       created_at,
       speed,
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
from wind_reports
order by reported_time;



-- name: GetHailReportsByDate :many
select rpt_type,
       reported_time,
       created_at,
       "size",
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
from hail_reports
where reported_time = $1
order by reported_time;

-- name: GetHailReportsByCountyAndState :many
select rpt_type,
       reported_time,
       created_at,
       "size",
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
from hail_reports
where county = $1
    AND "state" = $2
order by reported_time;

-- name: GetHailReportsByState :many
select rpt_type,
       reported_time,
       created_at,
       "size",
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
from hail_reports
where "state" = $1
order by reported_time;


-- name: GetAllHailReports :many
select rpt_type,
       reported_time,
       created_at,
       "size",
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
from hail_reports
order by reported_time;



-- name: GetTornadoReportsByDate :many
select rpt_type,
       reported_time,
       created_at,
       f_scale,
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
from tornado_reports
where reported_time = $1
order by reported_time;

-- name: GetTornadoReportsByCountyAndState :many
select rpt_type,
       reported_time,
       created_at,
       f_scale,
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
from tornado_reports
where county = $1
    AND "state" = $2
order by reported_time;

-- name: GetTornadoReportsByState :many
select rpt_type,
       reported_time,
       created_at,
       f_scale,
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
from tornado_reports
where "state" = $1
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
order by reported_time, rpt_type;




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
order by reported_time,rpt_type;

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
order by reported_time,rpt_type;


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
order by reported_time,rpt_type;
