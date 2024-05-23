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

