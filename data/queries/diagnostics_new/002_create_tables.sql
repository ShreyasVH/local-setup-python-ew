CREATE TABLE client( id SERIAL NOT NULL, access_token varchar(255) NULL, created_date timestamp NULL, event_flow_id int8 NULL, matomo_site_id int8 NULL, matomo_url varchar(255) NULL, "name" varchar(255) NULL, next_refresh int8 NULL, "password" varchar(255) NULL, updated_date timestamp NULL, CONSTRAINT client_pkey PRIMARY KEY (id));

CREATE TABLE cbnaat( id bigserial NOT NULL, lab_serial_number varchar(255) NULL, m_tuberculosis_result varchar(255) NULL, rif_resistance varchar(255) NULL, test_result_id int8 NULL, test_success varchar(255) NULL, sample_id int8 NULL, CONSTRAINT cbnaat_pkey PRIMARY KEY (id));

CREATE INDEX idx_cbnaat_test_result_id_index ON cbnaat USING btree (test_result_id);

CREATE TABLE chestxray( id bigserial NOT NULL, test_result_id int8 NULL, CONSTRAINT chestxray_pkey PRIMARY KEY (id));

CREATE TABLE culture( id bigserial NOT NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT culture_pkey PRIMARY KEY (id));

CREATE TABLE cytopathology( id bigserial NOT NULL, "result" varchar(255) NULL, test_result_id int8 NULL, CONSTRAINT cytopathology_pkey PRIMARY KEY (id));

CREATE INDEX idx_cytopathology_test_result_id_index ON cytopathology USING btree (test_result_id);

CREATE TABLE dst( id bigserial NOT NULL, culture_type varchar(255) NULL, dst_to_drug varchar(255) NULL, resistance_status varchar(255) NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT dst_pkey PRIMARY KEY (id));

CREATE INDEX idx_dst_test_result_id_index ON dst USING btree (test_result_id);

CREATE TABLE fllpa( id bigserial NOT NULL, has_mutation_details bool NULL, high_isoniazid_resistance varchar(255) NULL, low_isoniazid_resistance varchar(255) NULL, mutation_details varchar(1024) NULL, "result" varchar(255) NULL, rifampicin_resistance varchar(255) NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT fllpa_pkey PRIMARY KEY (id));

CREATE INDEX idx_fllpa_test_result_id_index ON fllpa USING btree (test_result_id);

CREATE TABLE gene_sequencing( id bigserial NOT NULL, "result" varchar(255) NULL, test_result_id int8 NULL, CONSTRAINT gene_sequencing_pkey PRIMARY KEY (id));

CREATE INDEX idx_gs_test_result_id_index ON gene_sequencing USING btree (test_result_id);

CREATE TABLE histopathology( id bigserial NOT NULL, "result" varchar(255) NULL, test_result_id int8 NULL, CONSTRAINT histopathology_pkey PRIMARY KEY (id));

CREATE INDEX idx_histopathology_test_result_id_index ON histopathology USING btree (test_result_id);

CREATE TABLE igra( id bigserial NOT NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT igra_pkey PRIMARY KEY (id));

CREATE INDEX idx_igra_test_result_id_index ON igra USING btree (test_result_id);

CREATE TABLE microscopy_fluorescent( id bigserial NOT NULL, lab_serial_number varchar(255) NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT microscopy_fluorescent_pkey PRIMARY KEY (id));

CREATE INDEX idx_microscopy_fluorescent_test_result_id_index ON microscopy_fluorescent USING btree (test_result_id);

CREATE TABLE microscopy_zn( id bigserial NOT NULL, count_of_bacilli varchar(255) NULL, lab_serial_number varchar(255) NULL, "result" varchar(255) NULL, test_result_id int8 NULL, sample_id int8 NULL, CONSTRAINT microscopy_zn_pkey PRIMARY KEY (id));

CREATE INDEX idx_microscopy_zn_test_result_id_index ON microscopy_zn USING btree (test_result_id);

CREATE TABLE other( id bigserial NOT NULL, "result" varchar(255) NULL, test_result_id int8 NULL, CONSTRAINT other_pkey PRIMARY KEY (id));

CREATE INDEX idx_other_test_result_id_index ON other USING btree (test_result_id);

CREATE TABLE qr_code( id bigserial NOT NULL, code varchar(255) NULL, created_by_hid int8 NULL, created_date timestamp NULL, is_mapped bool NULL, mapped_by_hid int8 NULL, mapped_id int8 NULL, mapped_type varchar(255) NULL, updated_date timestamp NULL, client_id int8 NULL, CONSTRAINT qr_code_pkey PRIMARY KEY (id));

CREATE TABLE qr_code_mapping_history( id bigserial NOT NULL, created_date timestamp NULL, mapped_by_hid int8 NULL, mapped_id int8 NULL, mapped_type varchar(255) NULL, qr_code_id int8 NULL, updated_date timestamp NULL, CONSTRAINT qr_code_mapping_history_pkey PRIMARY KEY (id));

CREATE TABLE sample( id bigserial NOT NULL, collection_date timestamp NULL, created_date timestamp NULL, details varchar(255) NULL, "result" varchar(255) NULL, sample_serial_id varchar(255) NULL, "type" varchar(255) NULL, updated_date timestamp NULL, rejection_reason varchar(255) NULL, rejection_reason_text varchar(255) NULL, sample_status varchar(255) NULL, sputum_collection_detail varchar(255) NULL, qr_code_id varchar(255) NULL, client_id int8 NULL, CONSTRAINT sample_pkey PRIMARY KEY (id));

CREATE INDEX sample_id_and_sample_state_index ON sample USING btree (id, sample_status);

CREATE TABLE sample_journey( id bigserial NOT NULL, checked_in_type varchar(255) NULL, created_date timestamp NULL, hierarchy_id int4 NULL, sample_event_facility_id int4 NULL, sample_id int8 NULL, sample_state varchar(255) NULL, CONSTRAINT sample_journey_pkey PRIMARY KEY (id));

CREATE INDEX sample_id_in_sample_journey_index ON sample_journey USING btree (sample_id);

CREATE TABLE sllpa( id bigserial NOT NULL, flouroq_resistance varchar(255) NULL, has_mutation_details bool NULL, mutation_details varchar(1024) NULL, "result" varchar(255) NULL, sample_id int8 NULL, slid_resistance_eis varchar(255) NULL, slid_resistance_rrs varchar(255) NULL, test_result_id int8 NULL, CONSTRAINT sllpa_pkey PRIMARY KEY (id));

CREATE INDEX idx_sllpa_test_result_id_index ON sllpa USING btree (test_result_id);

CREATE TABLE test_request( id bigserial NOT NULL, created_date timestamp NULL, entity_id int8 NULL, previous_att bool NULL, reason varchar(255) NULL, status int4 NULL, subreason varchar(400) NULL, updated_date timestamp NULL, nikshay_source_id int8 NULL, client_id int8 NULL, CONSTRAINT test_request_pkey PRIMARY KEY (id));

CREATE INDEX entity_status_index ON test_request USING btree (entity_id, status);
CREATE INDEX id_created_date_index ON test_request USING btree (id, created_date);
CREATE INDEX id_status_created_date_index ON test_request USING btree (id, status, created_date);
CREATE INDEX id_status_index ON test_request USING btree (id, status);

CREATE TABLE test_result( id bigserial NOT NULL, created_at timestamp NULL, final_interpretation varchar(255) NULL, interpretation_data varchar(255) NULL, lab_serial_number varchar(255) NULL, positive bool NULL, remarks varchar(500) NULL, reported_date timestamp NULL, tested_date timestamp NULL, updated_at timestamp NULL, CONSTRAINT test_result_pkey PRIMARY KEY (id));

CREATE TABLE test_result_mapping( id bigserial NOT NULL, created_date timestamp NULL, deleted int4 NULL DEFAULT 0, test_request_id int8 NULL, test_result_id int8 NULL, test_type varchar(255) NULL, updated_date timestamp NULL, CONSTRAINT test_result_mapping_pkey PRIMARY KEY (id));

CREATE INDEX test_request_id_test_type_index ON test_result_mapping USING btree (test_request_id, test_type);

CREATE TABLE test_result_mapping_sample( id bigserial NOT NULL, created_date timestamp NULL, deleted int4 NULL DEFAULT 0, test_result_mapping_id int8 NULL, test_sample_id int8 NULL, updated_date timestamp NULL, CONSTRAINT test_result_mapping_sample_pkey PRIMARY KEY (id));

CREATE INDEX idx_test_result_mapping_sample_deleted_mapping_id_index ON test_result_mapping_sample USING btree (test_result_mapping_id, deleted);

CREATE TABLE test_type( id int8 NOT NULL, created_date timestamp NULL, display_name varchar(255) NULL, "name" varchar(255) NULL, updated_date timestamp NULL, CONSTRAINT test_type_pkey PRIMARY KEY (id));

CREATE TABLE truenat_mtb( id bigserial NOT NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT truenat_mtb_pkey PRIMARY KEY (id));

CREATE INDEX idx_truenat_mtb_test_result_id_index ON truenat_mtb USING btree (test_result_id);

CREATE TABLE truenat_mtb_rif( id bigserial NOT NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT truenat_mtb_rif_pkey PRIMARY KEY (id));

CREATE INDEX idx_truenat_mtb_rif_test_result_id_index ON truenat_mtb_rif USING btree (test_result_id);

CREATE TABLE tst( id bigserial NOT NULL, induration_size int4 NULL, sample_id int8 NULL, test_result_id int8 NULL, CONSTRAINT tst_pkey PRIMARY KEY (id));

CREATE INDEX idx_tst_test_result_id_index ON tst USING btree (test_result_id);