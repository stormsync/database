-- make sure timezone is set to utc as we are inserting UTC time into timestampz
set timezone = 'UTC';
-- hopefully i have time to implement some features
-- using this.  if not, i'll have to revisit after
-- the deadline.
create extension if not exists postgis;


