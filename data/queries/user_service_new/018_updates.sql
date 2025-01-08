alter table user_medical_records alter column encrypted_json type text;

alter table user_medical_records add column if not exists hip_name varchar(255);

alter table user_medical_records add column if not exists user_id varchar(255);