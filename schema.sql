create table public.spatial_ref_sys
(
    srid      integer not null
        primary key
        constraint spatial_ref_sys_srid_check
            check ((srid > 0) AND (srid <= 998999)),
    auth_name varchar(256),
    auth_srid integer,
    srtext    varchar(2048),
    proj4text varchar(2048)
);

alter table public.spatial_ref_sys
    owner to jc;

grant select on public.spatial_ref_sys to public;

create table public.schema_migrations
(
    version bigint  not null
        primary key,
    dirty   boolean not null
);

alter table public.schema_migrations
    owner to jc;

create table public.nws_offices
(
    id    varchar(3) not null
        constraint nws_office_id_pkey
            primary key,
    city  varchar(255),
    state varchar(2)
);

alter table public.nws_offices
    owner to jc;

create type report_type as enum (
    'hail',
    'wind',
    'tornado'
    );

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

alter table public.reports
    owner to jc;

create index reports_geom_idx
    on public.reports using gist (geography(event_location));

create table public.xref_report_type_var_col
(
    rpt_type       report_type not null
        primary key,
    column_heading varchar(20) not null
);

alter table public.xref_report_type_var_col
    owner to jc;

