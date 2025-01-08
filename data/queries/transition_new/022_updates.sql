alter table if exists episode_document_details add column created_on timestamp;
alter table if exists episode_document_details add column updated_on timestamp;
alter table if exists tb_champion_activity add column updated_on timestamp;
create table treatment_outcome (id  serial not null, name varchar(255), primary key (id));
create table treatment_outcome_mapping (id  bigserial not null, created_at timestamp, disease_id int8, display_name varchar(255), explanation_reason varchar(255), stage_id int8, treatment_outcome_id int4 not null, updated_at timestamp, primary key (id));
alter table if exists treatment_plan_product_map add column other_dosage_form varchar(255);
alter table if exists treatment_plan_product_map add column other_drug_name varchar(255);
alter table if exists treatment_plan_product_map add column start_date timestamp;
create table vendor_config (id  bigserial not null, client_id varchar(255), config TEXT, credentials TEXT, vendor varchar(255), primary key (id));

alter table supported_relation add column if not exists data_type text;





