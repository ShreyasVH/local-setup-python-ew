CREATE INDEX IF NOT EXISTS idx_cbnaat_test_result_id_index ON cbnaat(test_result_id);

CREATE INDEX IF NOT EXISTS idx_culture_test_result_id_index ON culture(test_result_id);

CREATE INDEX IF NOT EXISTS idx_cytopathology_test_result_id_index ON cytopathology(test_result_id);

CREATE INDEX IF NOT EXISTS idx_dst_test_result_id_index ON dst(test_result_id);

CREATE INDEX IF NOT EXISTS idx_fllpa_test_result_id_index ON fllpa(test_result_id);

CREATE INDEX IF NOT EXISTS idx_gs_test_result_id_index ON gene_sequencing(test_result_id);

CREATE INDEX IF NOT EXISTS idx_histopathology_test_result_id_index ON histopathology(test_result_id);

CREATE INDEX IF NOT EXISTS idx_igra_test_result_id_index ON igra(test_result_id);

CREATE INDEX IF NOT EXISTS idx_microscopy_fluorescent_test_result_id_index ON microscopy_fluorescent(test_result_id);

CREATE INDEX IF NOT EXISTS idx_other_test_result_id_index ON other(test_result_id);

CREATE INDEX IF NOT EXISTS idx_sllpa_test_result_id_index ON sllpa(test_result_id);

CREATE INDEX IF NOT EXISTS idx_truenat_mtb_test_result_id_index ON truenat_mtb(test_result_id);

CREATE INDEX IF NOT EXISTS idx_truenat_mtb_rif_test_result_id_index ON truenat_mtb_rif(test_result_id);

CREATE INDEX IF NOT EXISTS idx_tst_test_result_id_index ON tst(test_result_id);

CREATE INDEX IF NOT EXISTS sample_id_in_sample_journey_index ON sample_journey(sample_id);

ALTER TABLE sample_journey DROP COLUMN IF EXISTS sample_location;

CREATE INDEX IF NOT EXISTS sample_id_and_sample_state_index ON sample(id, sample_status);

CREATE INDEX IF NOT EXISTS entity_id_client_id_status ON test_request(entity_id, client_id, status);