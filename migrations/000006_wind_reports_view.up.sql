create or replace view public.wind_reports
            (rpt_type, reported_time, created_at, speed, dist_from_location, heading_from_location, county, state,
             latitude, longitude, event_location, comments, nws_office, location)
as
SELECT reports.rpt_type,
       reports.reported_time,
       reports.created_at,
       reports.var_col as speed,
       reports.dist_from_location,
       reports.heading_from_location,
       reports.county,
       reports.state,
       reports.latitude,
       reports.longitude,
       reports.event_location,
       reports.comments,
       reports.nws_office,
       reports.location
FROM reports
WHERE reports.rpt_type = 'wind'::report_type;

alter table public.wind_reports
    owner to postgres;