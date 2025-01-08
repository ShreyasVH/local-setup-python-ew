ALTER TABLE supported_tab  ADD COLUMN url_fragment varchar;
ALTER TABLE client ADD COLUMN IF NOT EXISTS hashcode_android varchar(255);
ALTER TABLE disease_template ADD COLUMN IF NOT EXISTS display_name varchar;

ALTER TABLE IF EXISTS tab_permission ADD COLUMN IF NOT EXISTS tab_order bigint;

ALTER TABLE IF EXISTS adverse_event ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS appointment ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS appointment_answer ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS course_completion ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS course_completion ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS course_url_mapping ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS course_url_mapping ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS disease_stage_key_mapping ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS disease_stage_key_mapping ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS disease_stage_mapping ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS disease_stage_mapping ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS disease_template ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS disease_template ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS episode ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_app_config ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_app_config ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS episode_association ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_association ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS episode_document ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_document_details ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_document_details ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS episode_hierarchy_linkage ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_hierarchy_linkage ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS episode_tag ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_stage ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_stage ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS episode_stage_data ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS episode_stage_data ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS treatment_plan ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS treatment_plan ADD COLUMN IF NOT EXISTS created_on timestamp;
ALTER TABLE IF EXISTS treatment_plan_product_map ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS trigger ADD COLUMN IF NOT EXISTS updated_on timestamp;
ALTER TABLE IF EXISTS trigger ADD COLUMN IF NOT EXISTS created_on timestamp;

ALTER TABLE IF EXISTS episode_document ADD COLUMN IF NOT EXISTS added_by_id bigint;
ALTER TABLE IF EXISTS episode_document ADD COLUMN IF NOT EXISTS added_by_type text;

alter table treatment_plan_product_map add column if not exists sos boolean default false;

create table if not exists episode_document_details( id bigserial not null, episode_document_id bigint, date_of_record timestamp, file_url varchar(255), type varchar(255), primary key (id));

ALTER TABLE episode_document_details ADD CONSTRAINT fk_episode_document_id FOREIGN KEY(episode_document_id) REFERENCES episode_document(id);
ALTER TABLE if exists episode_document_details ADD COLUMN if not exists is_approved boolean;
ALTER TABLE if exists episode_document_details ADD COLUMN if not exists approved_by bigint;
ALTER TABLE if exists episode_document_details ADD COLUMN if not exists approved_at timestamp;
alter table if exists episode_document_details rename column approved_by to validated_by;
alter table if exists episode_document_details rename column approved_at to validated_at;

ALTER table treatment_plan_product_map ADD COLUMN if not exists refill_due_date timestamp;
ALTER table treatment_plan_product_map ADD COLUMN if not exists end_date timestamp;

create index if not exists appointment_answer_appointment_id_index on appointment_answer (appointment_id);
create index if not exists appointment_id_deleted_at_index on appointment (id,deleted_at);
create index if not exists appointment_episode_id_deleted_at_index on appointment (episode_id, deleted_at);
create index if not exists appointment_id_deleted_at_status_index on appointment (id, deleted_at,status);
create index if not exists episode_document_episode_id_added_on_index on episode_document (episode_id, added_on);
create index if not exists episode_log_episode_id_added_by_index on episode_log (episode_id, added_by);
create index if not exists episode_log_episode_id_category_added_by_index on episode_log (episode_id, category, added_by);
create index if not exists episode_log_episode_id_category_added_on_index on episode_log (episode_id, category, added_on);
create index if not exists episode_stage_episode_id_end_date_index on episode_stage (episode_id, end_date);
create index if not exists episode_stage_start_date_stage_id_end_date_index on episode_stage (start_date, stage_id, end_date);
create index if not exists episode_stage_data_episode_stage_id_field_id_index on episode_stage_data (episode_stage_id, field_id);
create index if not exists episode_tag_episode_id_tag_name_tag_date_index on episode_tag (episode_id, tag_name, tag_date);
create index if not exists episode_tag_episode_id_tag_date_index on episode_tag (episode_id, tag_date);
create index if not exists field_key_index on field (key);
create index if not exists regimen_treatment_plan_map_treatment_plan_id_index on regimen_treatment_plan_map (treatment_plan_id);
create index if not exists rules_namespace_client_id_index on rules (rule_namespace, client_id);
create index if not exists supported_relation_type_index on supported_relation (type);
create index if not exists treatment_plan_product_map_treatment_plan_id_index on treatment_plan_product_map (treatment_plan_id);
create index if not exists treatment_plan_product_map_refill_due_date_end_date_index on treatment_plan_product_map (refill_due_date, end_date);
create index if not exists treatment_plan_client_id_index on treatment_plan (client_id);
create index if not exists trigger_cron_time_index on trigger (cron_time);
create index if not exists trigger_event_name_client_id_index on trigger (event_name, client_id);
create index if not exists trigger_function_name_index on trigger (function_name);

CREATE INDEX IF NOT EXISTS episode_last_activity_date_index ON episode USING btree (last_activity_date);

alter table episode_log add updated_on timestamp;

