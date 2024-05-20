
-- single table for all reports.  Views will be created
-- for specific types.
create table public.reports
(
    rpt_type              report_type              not null,
    reported_time         timestamp with time zone not null,
    created_at            timestamp with time zone,
    var_col               integer,
    dist_from_location    integer                  not null,
    heading_from_location varchar(3)               not null,
    county                varchar(255)             not null,
    state                 varchar(2),
    latitude              varchar(50),
    longitude             varchar(50),
    event_location        geometry,
    comments              text,
    nws_office            varchar(3),
    location              varchar(255)             not null,
    constraint reports_id_pkey
        primary key (rpt_type, reported_time, location, heading_from_location, dist_from_location, county)
);

create index reports_geom_idx
    on public.reports using gist (geography(event_location));

alter table if exists public.reports
    owner to jc;

