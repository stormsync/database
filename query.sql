-- name: InsertReport :copyfrom
insert into reports (rpt_type, reported_time, created_at, var_col, dist_from_location, heading_from_location, county,
                     state, latitude, longitude, event_location, comments, nws_office, location)
values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14);

-- name: GetReport :one
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       state,
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
where rpt_type = $1
  and reported_time = $2
  and dist_from_location = $3
  and heading_from_location = $4
  and location = $5
  and county = $6
  and state = $7
order by rpt_type, reported_time
offset $8 limit $9;

-- name: GetAllReports :many
select rpt_type,
       reported_time,
       created_at,
       var_col,
       dist_from_location,
       heading_from_location,
       county,
       state,
       latitude,
       longitude,
       event_location,
       comments,
       nws_office,
       location
from reports
order by rpt_type, reported_time
offset $1 limit $2;
