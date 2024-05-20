create or replace view public.tornado_reports
            (rpt_type, reported_time, created_at, f_scale, dist_from_location, heading_from_location, county, state,
             latitude, longitude, event_location, comments, nws_office, location)
as
SELECT reports.rpt_type,
       reports.reported_time,
       reports.created_at,
       reports.var_col AS f_scale,
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
WHERE reports.rpt_type = 'tornado'::report_type;

alter table public.tornado_reports
    owner to postgres;