CREATE SEQUENCE IF NOT EXISTS adverse_event_id_seq;

CREATE TABLE IF NOT EXISTS adverse_event( id bigint NOT NULL DEFAULT nextval('adverse_event_id_seq'::regclass), adverse_reaction_id bigint, causality_management_id bigint, episode_id bigint, outcome_id bigint, created_on timestamp without time zone, onset_date timestamp without time zone, outcome_date timestamp without time zone, CONSTRAINT adverse_event_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS adverse_reaction_id_seq;

CREATE TABLE IF NOT EXISTS adverse_reaction( id bigint NOT NULL DEFAULT nextval('adverse_reaction_id_seq'::regclass), adr_seriousness text COLLATE pg_catalog."default", alcohol_use text COLLATE pg_catalog."default", autopsy_performed text COLLATE pg_catalog."default", bdq_exposure text COLLATE pg_catalog."default", breastfeeding_infant text COLLATE pg_catalog."default", cause_of_death text COLLATE pg_catalog."default", current_weight text COLLATE pg_catalog."default", daids_grading text COLLATE pg_catalog."default", date_of_death timestamp without time zone, drtb_type text COLLATE pg_catalog."default", hiv_reactive text COLLATE pg_catalog."default", hospital_admission_date timestamp without time zone, hospital_discharge_date timestamp without time zone, injection_drug_use text COLLATE pg_catalog."default", linezolid_exposure text COLLATE pg_catalog."default", onset_date timestamp without time zone, predominant_condition text COLLATE pg_catalog."default", pregnancy_status text COLLATE pg_catalog."default", previous_exposure text COLLATE pg_catalog."default", type_of_case text COLLATE pg_catalog."default", report_type text COLLATE pg_catalog."default", reporter_narrative text COLLATE pg_catalog."default", severity text COLLATE pg_catalog."default", tb_type text COLLATE pg_catalog."default", tobacco_use text COLLATE pg_catalog."default", created_on timestamp without time zone, updated_on timestamp without time zone, otherpredominantcondition text COLLATE pg_catalog."default", list_of_drugs text COLLATE pg_catalog."default", hospital_discharge_data timestamp without time zone, other_predominant_condition character varying(255) COLLATE pg_catalog."default", CONSTRAINT adverse_reaction_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS aers_outcome_id_seq;

CREATE TABLE IF NOT EXISTS aers_outcome( id bigint NOT NULL DEFAULT nextval('aers_outcome_id_seq'::regclass), autopsy_performed text COLLATE pg_catalog."default", cause_of_death text COLLATE pg_catalog."default", date_of_death timestamp without time zone, date_of_resolution timestamp without time zone, hospital_admission_date timestamp without time zone, hospital_discharge_data timestamp without time zone, outcome text COLLATE pg_catalog."default", created_on timestamp without time zone, updated_on timestamp without time zone, CONSTRAINT outcome_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS appointment_id_seq;

CREATE TABLE IF NOT EXISTS appointment( id integer NOT NULL DEFAULT nextval('appointment_id_seq'::regclass), added_on timestamp without time zone, appointment_id integer, date timestamp without time zone, deleted_at timestamp without time zone, deleted_by_id integer, episode_id bigint, follow_up_date timestamp without time zone, status character varying(255) COLLATE pg_catalog."default", visit_number integer, CONSTRAINT appointment_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS appointment_answer_id_seq;

CREATE TABLE IF NOT EXISTS appointment_answer( id integer NOT NULL DEFAULT nextval('appointment_answer_id_seq'::regclass), answer character varying(255) COLLATE pg_catalog."default", appointment_id integer, field_id bigint, CONSTRAINT appointment_answer_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS causality_management_id_seq;

CREATE TABLE IF NOT EXISTS causality_management( id bigint NOT NULL DEFAULT nextval('causality_management_id_seq'::regclass), action_taken text COLLATE pg_catalog."default", anti_tb_medicines text COLLATE pg_catalog."default", cause_medicine_linkage text COLLATE pg_catalog."default", dechallenge text COLLATE pg_catalog."default", expectedness text COLLATE pg_catalog."default", new_medicines text COLLATE pg_catalog."default", other_medicines text COLLATE pg_catalog."default", rechallenge text COLLATE pg_catalog."default", suspected_drugs text COLLATE pg_catalog."default", treatment_details text COLLATE pg_catalog."default", created_on timestamp without time zone, updated_on timestamp without time zone, was_action_taken text COLLATE pg_catalog."default", CONSTRAINT causality_management_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS client_id_seq;

CREATE TABLE IF NOT EXISTS client( id bigint NOT NULL DEFAULT nextval('client_id_seq'::regclass), event_flow_id bigint, created_date timestamp without time zone, name character varying(255) COLLATE pg_catalog."default", password character varying(255) COLLATE pg_catalog."default", CONSTRAINT client_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS course_id_seq;

CREATE TABLE IF NOT EXISTS course( id bigint NOT NULL DEFAULT nextval('course_id_seq'::regclass), title character varying(255) COLLATE pg_catalog."default", CONSTRAINT course_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS course_completion_id_seq;

CREATE TABLE IF NOT EXISTS course_completion( id bigint NOT NULL DEFAULT nextval('course_completion_id_seq'::regclass), course_id bigint, created_on timestamp without time zone, episode_id bigint, is_complete boolean, CONSTRAINT course_completion_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS course_url_mapping_id_seq;

CREATE TABLE IF NOT EXISTS course_url_mapping( id bigint NOT NULL DEFAULT nextval('course_url_mapping_id_seq'::regclass), course_id bigint, language character varying(255) COLLATE pg_catalog."default", title character varying(255) COLLATE pg_catalog."default", url character varying(255) COLLATE pg_catalog."default", CONSTRAINT course_url_mapping_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS disease_template( id integer NOT NULL, disease_name character varying(255) COLLATE pg_catalog."default", client_id bigint DEFAULT 29, CONSTRAINT disease_template_pkey PRIMARY KEY (id));

ALTER TABLE disease_template ADD COLUMN IF NOT EXISTS is_default boolean;

CREATE TABLE IF NOT EXISTS stages( id integer NOT NULL, stage_name character varying(255) COLLATE pg_catalog."default", metadata text COLLATE pg_catalog."default", meta text COLLATE pg_catalog."default", stage_display_name character varying(255) COLLATE pg_catalog."default", CONSTRAINT stages_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS disease_stage_mapping( id integer NOT NULL, disease_template_id integer, stage_id integer, CONSTRAINT disease_stage_mapping_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS disease_stage_key_mapping_id_seq;

CREATE TABLE IF NOT EXISTS disease_stage_key_mapping( id integer NOT NULL, disease_stage_id integer, required boolean, deleted boolean, default_value character varying(255) COLLATE pg_catalog."default", field_id integer, CONSTRAINT disease_stage_key_mapping_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS field( id integer NOT NULL, key character varying(255) COLLATE pg_catalog."default", module character varying(255) COLLATE pg_catalog."default", entity character varying(255) COLLATE pg_catalog."default", CONSTRAINT field_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_id_seq;

CREATE TABLE IF NOT EXISTS episode( id bigint NOT NULL DEFAULT nextval('episode_id_seq'::regclass), client_id integer, person_id integer, deleted boolean, disease_id integer, disease_id_options text COLLATE pg_catalog."default", created_date timestamp without time zone, start_date timestamp without time zone, end_date timestamp without time zone, last_activity_date timestamp without time zone, risk_status text COLLATE pg_catalog."default", current_stage_id integer, added_by bigint, type_of_episode character varying(255) COLLATE pg_catalog."default", CONSTRAINT episode_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_association_id_seq;

CREATE TABLE IF NOT EXISTS episode_association( id bigint NOT NULL DEFAULT nextval('episode_association_id_seq'::regclass), episode_id integer, value character varying(255) COLLATE pg_catalog."default", association_id integer, CONSTRAINT episode_associations_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_hierarchy_linkage_id_seq;

CREATE TABLE IF NOT EXISTS episode_hierarchy_linkage( id bigint NOT NULL DEFAULT nextval('episode_hierarchy_linkage_id_seq'::regclass), episode_id integer, hierarchy_id integer, relation_id integer, CONSTRAINT episode_hierarchy_linkages_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_stage_id_seq;

CREATE TABLE IF NOT EXISTS episode_stage( id bigint NOT NULL DEFAULT nextval('episode_stage_id_seq'::regclass), episode_id integer, stage_id integer, start_date timestamp without time zone, end_date timestamp without time zone, CONSTRAINT episode_stages_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_stage_data_id_seq;

CREATE TABLE IF NOT EXISTS episode_stage_data( id bigint NOT NULL DEFAULT nextval('episode_stage_data_id_seq'::regclass), episode_stage_id integer, value character varying(255) COLLATE pg_catalog."default", field_id integer, CONSTRAINT episode_stage_data_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_document_id_seq;

CREATE TABLE IF NOT EXISTS episode_document( id bigint NOT NULL DEFAULT nextval('episode_document_id_seq'::regclass), added_on timestamp without time zone, date_of_record timestamp without time zone, disease_id bigint, doctor_name character varying(255) COLLATE pg_catalog."default", doctor_phone character varying(255) COLLATE pg_catalog."default", episode_id bigint, image_url character varying(255) COLLATE pg_catalog."default", notes character varying(255) COLLATE pg_catalog."default", type character varying(255) COLLATE pg_catalog."default", time_zone character varying(255) COLLATE pg_catalog."default", CONSTRAINT episode_document_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_log_store_id_seq;

CREATE TABLE IF NOT EXISTS episode_log_store( id bigint NOT NULL DEFAULT nextval('episode_log_store_id_seq'::regclass), category text COLLATE pg_catalog."default", category_group text COLLATE pg_catalog."default", CONSTRAINT episode_log_store_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_log_id_seq;

CREATE TABLE IF NOT EXISTS episode_log( id bigint NOT NULL DEFAULT nextval('episode_log_id_seq'::regclass), action_taken text COLLATE pg_catalog."default", added_by bigint, added_on timestamp without time zone, category text COLLATE pg_catalog."default", comments text COLLATE pg_catalog."default", episode_id bigint, sub_category text COLLATE pg_catalog."default", date_of_action timestamp without time zone, CONSTRAINT episode_log_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_app_config_id_seq;

CREATE TABLE IF NOT EXISTS episode_app_config( id bigint NOT NULL DEFAULT nextval('episode_app_config_id_seq'::regclass), technology character varying(255) COLLATE pg_catalog."default", allow_dose_marking boolean, validation_required boolean, backdated_dose_allowed boolean, backdated_limit bigint, deployment character varying(255) COLLATE pg_catalog."default", CONSTRAINT episode_app_config_pkey PRIMARY KEY (id), CONSTRAINT episode_app_config_deployment_technology_key UNIQUE (deployment, technology));

CREATE SEQUENCE IF NOT EXISTS episode_tag_store_id_seq;

CREATE TABLE IF NOT EXISTS episode_tag_store( id bigint NOT NULL DEFAULT nextval('episode_tag_store_id_seq'::regclass), tag_description character varying(255) COLLATE pg_catalog."default", tag_display_name character varying(255) COLLATE pg_catalog."default", tag_icon character varying(255) COLLATE pg_catalog."default", tag_name character varying(255) COLLATE pg_catalog."default", tag_group character varying(255) COLLATE pg_catalog."default", CONSTRAINT episode_tag_store_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS episode_tag_id_seq;

CREATE TABLE IF NOT EXISTS episode_tag( id bigint NOT NULL DEFAULT nextval('episode_tag_id_seq'::regclass), added_on timestamp without time zone, episode_id bigint, tag_name character varying(255) COLLATE pg_catalog."default", tag_date timestamp without time zone, sticky boolean, CONSTRAINT episode_tag_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS regimen_id_seq;

CREATE TABLE IF NOT EXISTS regimen( id bigint NOT NULL DEFAULT nextval('regimen_id_seq'::regclass), name character varying(255) COLLATE pg_catalog."default", dosing_days integer, disease_id integer, CONSTRAINT regimen_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS treatment_plan_id_seq;

CREATE TABLE IF NOT EXISTS treatment_plan( id bigint NOT NULL DEFAULT nextval('treatment_plan_id_seq'::regclass), client_id bigint, config character varying(255) COLLATE pg_catalog."default", name character varying(255) COLLATE pg_catalog."default", CONSTRAINT treatment_plan_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS treatment_plan_product_map_id_seq;

CREATE TABLE IF NOT EXISTS treatment_plan_product_map( id bigint NOT NULL DEFAULT nextval('treatment_plan_product_map_id_seq'::regclass), created_date timestamp without time zone, product_id bigint, schedule character varying(255) COLLATE pg_catalog."default", treatment_plan_id bigint, CONSTRAINT treatment_plan_product_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS regimen_treatment_plan_map_id_seq;

CREATE TABLE IF NOT EXISTS regimen_treatment_plan_map( id bigint NOT NULL DEFAULT nextval('regimen_treatment_plan_map_id_seq'::regclass), created_date timestamp without time zone, regimen_id bigint, treatment_plan_id bigint, CONSTRAINT regimen_treatment_plan_map_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS rules( id bigint NOT NULL, action text COLLATE pg_catalog."default", condition text COLLATE pg_catalog."default", description character varying(255) COLLATE pg_catalog."default", priority integer, rule_namespace character varying(255) COLLATE pg_catalog."default", to_id bigint, from_id bigint);

ALTER TABLE rules ADD COLUMN IF NOT EXISTS client_id integer;

CREATE TABLE IF NOT EXISTS supported_relation( id integer NOT NULL, name character varying(255) COLLATE pg_catalog."default", description text COLLATE pg_catalog."default", type integer, CONSTRAINT supported_relations_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS supported_tab( id integer NOT NULL, type character varying(255) COLLATE pg_catalog."default", description text COLLATE pg_catalog."default", CONSTRAINT supported_tabs_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS tab_permission( id integer NOT NULL, disease_stage_mapping_id integer, tab_id character varying(255) COLLATE pg_catalog."default", add boolean, edit boolean, view boolean, delete boolean, CONSTRAINT tab_permissions_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS tb_champion_activity_id_seq;

CREATE TABLE IF NOT EXISTS tb_champion_activity( id bigint NOT NULL DEFAULT nextval('tb_champion_activity_id_seq'::regclass), created_on timestamp without time zone, episode_id bigint, patient_visits bigint, meeting_count bigint, other_acitivity character varying(255) COLLATE pg_catalog."default", file_uploaded character varying(255) COLLATE pg_catalog."default", CONSTRAINT tb_champion_activity_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS trigger_id_seq;

CREATE TABLE IF NOT EXISTS trigger( id bigint NOT NULL DEFAULT nextval('trigger_id_seq'::regclass), client_id bigint, hierarchy_id bigint, trigger_id bigint, default_template_id bigint, template_ids text COLLATE pg_catalog."default", event_name text COLLATE pg_catalog."default", function_name text COLLATE pg_catalog."default", cron_time text COLLATE pg_catalog."default", notification_type text COLLATE pg_catalog."default", vendor_id bigint, time_zone text COLLATE pg_catalog."default", CONSTRAINT trigger_pkey PRIMARY KEY (id));



