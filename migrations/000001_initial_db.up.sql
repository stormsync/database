-- make sure timezone is set to utc as we are inserting UTC time into timestampz
set timezone = 'UTC';
-- hopefully i have time to implement some features
-- using this.  if not, i'll have to revisit after
-- the deadline.
create extension if not exists postgis;

-- a lookup table for the office abbreviations that show up in the comments/remarks
-- query for the abbreviation and get the  city and state of that office
create table if not exists public.nws_offices
(
    id    varchar(3) not null
        constraint nws_office_id_pkey
            primary key,
    city  varchar(255),
    state varchar(2)
);

alter table if exists public.nws_offices
    owner to jc;


-- create the three report types as enums, will
-- need to be maintained if new report come online
create type report_type as enum (
    'hail',
    'wind',
    'tornado'
    );


-- single table for all report types.  there was only
-- one column that was renamed between all three report so
-- it made sense to keep it simple.  There will be a look up table
-- to map the report type to the proper column heading.
-- I'm thinking that lookup table can be read in to a hash map
-- when the application starts up to eliminate DB calls.
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


-- table used to map the column for wind speed, hail size, and f-scale to the
-- enum report_type.
create table if not exists public.xref_report_type_var_col
(
    rpt_type       report_type not null
        constraint xref_report_type_var_col_pkey
            primary key,
    column_heading varchar(20) not null
);

alter table if exists public.xref_report_type_var_col
    owner to jc;

