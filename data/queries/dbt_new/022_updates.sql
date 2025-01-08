CREATE TABLE IF NOT EXISTS benefit_archive( id bigserial not null PRIMARY KEY, benefit_id BIGINT, beneficiary_id BIGINT, hierarchy_mapping BIGINT, scheme VARCHAR(255), incentive_number BIGINT, status VARCHAR(255), amount FLOAT, log TEXT, created_at TIMESTAMP, last_updated_manually_at DATE, last_updated_manually_by BIGINT, processing_account_no VARCHAR(255), processing_ifsc_code VARCHAR(255), processing_agency_code VARCHAR(255), purpose VARCHAR(255), episode_id BIGINT, is_deleted BOOLEAN, archived_at TIMESTAMP, archival_reason VARCHAR(255));
create table if not exists config( id bigserial not null primary key, name varchar, default_value varchar, created_at timestamp, updated_at timestamp);
create table if not exists scheme( id bigserial not null primary key, code varchar, name varchar, version bigint, start_date timestamp, end_date timestamp, created_at timestamp, updated_at timestamp);
create table if not exists scheme_config_map( id bigserial not null primary key, config_mapping_id bigint, scheme_id bigint, value varchar, created_at timestamp, updated_at timestamp);

ALTER TABLE hierarchy_benefit_status RENAME COLUMN schemecode TO scheme_code;
ALTER TABLE hierarchy_benefit_status RENAME COLUMN lastbenefitgeneratedat TO last_benefit_generated_at;
ALTER TABLE hierarchy_benefit_status RENAME COLUMN hierarchyid TO hierarchy_id;
ALTER TABLE hierarchy_benefit_status_aud RENAME COLUMN schemecode TO scheme_code;
ALTER TABLE hierarchy_benefit_status_aud RENAME COLUMN lastbenefitgeneratedat TO last_benefit_generated_at;
ALTER TABLE hierarchy_benefit_status_aud RENAME COLUMN hierarchyid TO hierarchy_id;
ALTER TABLE x_client RENAME COLUMN eventflowid TO event_flow_id;
ALTER TABLE x_client RENAME COLUMN createddate TO created_date;

CREATE INDEX IF NOT EXISTS idx_hierarchyBenefitStatus_schemeCode on hierarchy_benefit_status(scheme_code);
CREATE INDEX IF NOT EXISTS idx_hierarchyBenefitStatus_lastBenefitGeneratedAt on hierarchy_benefit_status(last_benefit_generated_at);

ALTER TABLE hierarchy_benefit_status ADD COLUMN version bigint;

CREATE INDEX IF NOT EXISTS idx_hierarchyBenefitStatus_scheme_code_version on hierarchy_benefit_status(scheme_code, version);