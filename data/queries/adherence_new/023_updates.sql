alter table if exists iam_schedule_time_map add column adh_string TEXT;
alter table if exists iam_schedule_time_map add column dose_info jsonb;
alter table if exists iam_schedule_time_map add column end_date timestamp;
alter table if exists iam_schedule_time_map add column start_date timestamp;
create sequence hibernate_sequence start 1 increment 1;