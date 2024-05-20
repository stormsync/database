-- create the three report types as enums, will
-- need to be maintained if new report come online
create type report_type as enum (
    'hail',
    'wind',
    'tornado'
    );

