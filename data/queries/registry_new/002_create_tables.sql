CREATE SEQUENCE IF NOT EXISTS client_id_seq;

CREATE TABLE IF NOT EXISTS client( id bigint NOT NULL DEFAULT nextval('client_id_seq'::regclass), name character varying(255) COLLATE pg_catalog."default", password character varying(255) COLLATE pg_catalog."default", event_flow_id bigint, created_date timestamp without time zone, askforhelpurl text COLLATE pg_catalog."default", sso_url character varying(255) COLLATE pg_catalog."default", sso_authorization_cookie_name character varying(255) COLLATE pg_catalog."default", default_deployment_id bigint, default_designation text COLLATE pg_catalog."default", CONSTRAINT client_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS language_id_seq;

CREATE TABLE IF NOT EXISTS language( id bigint NOT NULL DEFAULT nextval('language_id_seq'::regclass), name character varying(255) COLLATE pg_catalog."default", translation_key character varying(255) COLLATE pg_catalog."default", display_name character varying(255) COLLATE pg_catalog."default", CONSTRAINT language_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS deployment_id_seq;

CREATE TABLE IF NOT EXISTS deployment( id bigint NOT NULL DEFAULT nextval('deployment_id_seq'::regclass), code character varying(255) COLLATE pg_catalog."default", country_name character varying(100) COLLATE pg_catalog."default", project_name character varying(100) COLLATE pg_catalog."default", default_language_id bigint, time_zone character varying(255) COLLATE pg_catalog."default", time_zone_abbreviation character varying(255) COLLATE pg_catalog."default", time_zone_details character varying(255) COLLATE pg_catalog."default", default_tech character varying(50) COLLATE pg_catalog."default", phone_prefix integer, short_code character varying(10) COLLATE pg_catalog."default", ask_for_help_url text COLLATE pg_catalog."default", default_time character varying(10) COLLATE pg_catalog."default", CONSTRAINT deployment_pkey PRIMARY KEY (id));

ALTER TABLE client ADD CONSTRAINT client_fk_default_deployment_id FOREIGN KEY (default_deployment_id) REFERENCES deployment (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;

CREATE SEQUENCE IF NOT EXISTS deployment_language_map_id_seq;

CREATE TABLE IF NOT EXISTS deployment_language_map( id bigint NOT NULL DEFAULT nextval('deployment_language_map_id_seq'::regclass), deployment_id bigint, language_id bigint, created_at timestamp without time zone, stopped_at timestamp without time zone, CONSTRAINT deployment_language_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS deployment_disease_map_id_seq;

CREATE TABLE IF NOT EXISTS deployment_disease_map( id bigint NOT NULL DEFAULT nextval('deployment_disease_map_id_seq'::regclass), deployment_id bigint NOT NULL, disease_id bigint NOT NULL, created_at timestamp without time zone, stopped_at timestamp without time zone, CONSTRAINT table_name_pk PRIMARY KEY (id), CONSTRAINT table_name_deployment_id_fk FOREIGN KEY (deployment_id) REFERENCES deployment (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS task_list_id_seq;

CREATE TABLE IF NOT EXISTS task_list( id bigint NOT NULL DEFAULT nextval('task_list_id_seq'::regclass), name text COLLATE pg_catalog."default", web_icon text COLLATE pg_catalog."default", app_icon text COLLATE pg_catalog."default", description text COLLATE pg_catalog."default", extra_data text COLLATE pg_catalog."default", CONSTRAINT task_list_pkey PRIMARY KEY (id));

INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (1, '_end_date_passed', 'fa fa-clock-o', '{md-alarm}', 'tasklist_desc_end_date_passed', '{"name":"End Date Passed Patients","showSummary":"false","defaultSortField":"DAYS_PAST_END_DATE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":["DAYS_PAST_END_DATE"],"disabledFields":["END_DATE_PASSED"],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":true,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (2, '_follow_up_call_needed', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_yesterday_dose', '{"name":"Follow Up Call Needed","showSummary":"false","defaultSortField":"ADHERENCE_7","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":["LAST_DOSAGE"],"showCallButton":true,"allowToggleSwitch":false,"showBlankSummary":true,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (3, '_home_visit_required', 'fa fa-home', '{md-home}', 'tasklist_desc_missed_last_two_doses', '{"name":"Home Visit Required","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (4, '_lost_to_follow_up', 'fa fa-group', '{md-group}', 'tasklist_desc_lost_to_follow_up', '{"name":"Lost to follow-up","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (5, '_missed_doses', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_last_three_doses', '{"name":"Missed Doses","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (6, '_perc_high_attention', 'fa fa-exclamation-circle', '{md-error}', 'tasklist_desc_high_attention', '{"name":"High Attention Patients","showSummary":"false","defaultSortField":"ADHERENCE_30","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":["PRIORITY","END_DATE_PASSED"],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":true,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (7, 'Missed last three days', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_last_three_doses', '{"name":"Missed last three doses","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":true,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (8, 'tasklist_dose_not_reported_today', 'fa fa-calendar-minus-o', '{md-event}', 'tasklist_desc_dose_not_reported_today', '{"name":"Dose not reported today","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (9, 'tasklist_follow_up_necessary', 'fa fa-phone', '{md-call}', 'tasklist_desc_follow_up', '{"name":"Follow up Necessary","showSummary":"false","defaultSortField":"ADHERENCE_7","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":["LAST_DOSAGE"],"showCallButton":true,"allowToggleSwitch":false,"showBlankSummary":true,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (10, 'tasklist_follow_up_needed', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_yesterday_dose', '{"name":"Follow Up Needed","showSummary":"false","defaultSortField":"ADHERENCE_7","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":["LAST_DOSAGE"],"showCallButton":true,"allowToggleSwitch":false,"showBlankSummary":true,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (11, 'tasklist_lfu', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_lfu', '{"name":"LFU","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (12, 'tasklist_mis_1', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_mis_1', '{"name":"MIS 1","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (13, 'tasklist_mis_2', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_mis_2', '{"name":"MIS 2","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (14, 'tasklist_missed_checkin', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_ivr_checkin', '{"name":"Check-in Missed","showSummary":"false","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":true,"allowToggleSwitch":true,"showBlankSummary":false,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (15, 'tasklist_missed_last_dose', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_yesterday_dose', '{"name":"Missed Last Dose","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (16, 'tasklist_missed_last_three_doses', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_missed_last_three_doses', '{"name":"Missed last three doses","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (17, 'tasklist_missed_last_three_plus_doses', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_missed_last_three_doses', '{"name":"Missed last three doses","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (18, 'tasklist_missed_last_two_dose', 'fa fa-home', '{md-home}', 'tasklist_desc_missed_last_two_doses', '{"name":"Missed last two doses","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (19, 'tasklist_missed_yesterday_dose', 'fa fa-phone', '{md-call}', 'tasklist_desc_missed_yesterday_dose', '{"name":"Missed yesterdays dose","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":true}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (20, 'tasklist_negative_checkin', 'fa fa-exclamation-circle', '{md-error}', 'tasklist_desc_negative_ivr_checkin', '{"name":"Check-in Negative","showSummary":"false","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":true,"allowToggleSwitch":true,"showBlankSummary":false,"removePriorityColor":false,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (21, 'tasklist_patients_in_crisis', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_missed_last_three_doses', '{"name":"Patients In Crisis","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (22, 'tasklist_refill_due', 'fa fa-exclamation-triangle', '{md-error}', 'tasklist_desc_refill_due', '{"name":"Refill Due","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (23, 'tasklist_sputum_test_due', 'fa fa-flask', '{md-colorize}', 'tasklist_desc_sputum_test_due', '{"name":"Sputum Test Due","showSummary":false,"defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (24, 'tasklist_treatment_outcome_due', 'fa fa-calendar-minus-o', '{md-event}', 'tasklist_desc_treatment_outcome_due', '{"name":"Treatment Outcome Due","showSummary":false,"defaultSortField":"LAST_DOSAGE","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (25, 'Adherence Missed 1-3 days', 'fa fa-calendar', '{md-event}', 'Patients who have missed doses', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (26, 'Adherence Missed 4-7 days', 'fa fa-calendar', '{md-event}', 'Patients who have missed doses', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (27, 'Adherence Missed 8-14 days', 'fa fa-calendar', '{md-event}', 'Patients who have missed doses', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (28, 'Adherence Missed 15+ days', 'fa fa-calendar', '{md-event}', 'Patients who have missed doses', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (29, 'Treatment Outcome Due', 'fa fa-clock-o', '{md-alarm}', 'Patients whose Treatment Outcome is due', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (30, 'Bank Details Required', 'fa fa-rupee', '{md-account-balance}', 'Patients whose Bank details are missing', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (31, 'MERM Device Battery Level', 'fa fa-battery-quarter', '{md-error}', 'Patients whose MERM devices are running low on battery', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (32, 'Refill Due', 'fa fa-calendar', '{md-event}', 'Patients with refill due', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (33, 'Patients registered through screening tool (TU List)', 'fa fa-calendar', '{md-event}', 'Patients who have registered through screening tool but have not visited the facility within 2 weeks of enrollment', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (34, 'Patients registered through screening tool (District List)', 'fa fa-calendar', '{md-event}', 'Patients who have registered through screening tool but have not visited the facility within 3 weeks of enrollment', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (35, 'Patients registered through screening tool (Call Centre List)', 'fa fa-calendar', '{md-event}', 'Patients who have registered through screening tool but have not visited the facility within 4 weeks of enrollment', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (36, 'Dose not reported today', 'fa fa-calendar', '{md-event}', 'Patients who have not reported a manual or digital dose today', '');
INSERT INTO task_list (id, name, web_icon, app_icon, description, extra_data) VALUES (37, 'individual_died', 'fa fa-bed', '{md-hotel}', 'tasklist_desc_individual_died', '{"name":"Individual Died","showSummary":false,"defaultSortField":"Id","defaultSortOrder":false,"hideAddPatients":true,"extraFields":[],"disabledFields":[],"showCallButton":false,"allowToggleSwitch":false,"showBlankSummary":false,"removePriorityColor":true,"lastDosageTwoDays":false,"lastDosageThreePlusDays":false,"lastDosageOneDay":false}');

CREATE SEQUENCE IF NOT EXISTS task_list_column_id_seq;

CREATE TABLE IF NOT EXISTS task_list_column( id bigint NOT NULL DEFAULT nextval('task_list_column_id_seq'::regclass), name text COLLATE pg_catalog."default", label text COLLATE pg_catalog."default", sortable boolean, CONSTRAINT task_list_column_pkey PRIMARY KEY (id));

INSERT INTO task_list_column (id, name, label, sortable) VALUES (1, 'Id', 'id', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (2, 'Name', 'name', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (3, 'SecondLowestHierarchy', 'second_lowest_hierarchy', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (4, 'LowestHierarchy', 'lowest_hierarchy', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (5, 'PatientType', 'PatientType', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (6, 'TypeOfCase', 'type_of_case', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (7, 'ContactNumber', 'contact', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (8, 'ConsecutiveMissedDoses', 'num_consecutive_missed_doses', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (9, 'EndDate', 'end_date', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (10, 'LastDoseRecorded', 'last_dosage_recorded', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (11, 'DosageNotRecordedInLast30Days', 'dosage_not_recorded_30_days', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (12, 'Address', '_address', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (13, 'NNDotsId', '_99dotsid', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (14, 'Gender', '_gender', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (15, 'AdherenceTechnology', 'adherence_technology', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (16, 'MissedWeeklyDoses', 'num_consecutive_missed_doses', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (17, 'TreatmentStartDate', 'TreatmentStartDate', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (18, 'LastMissedDoseDate', 'last_missed_dose_date', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (19, 'CheckInDate', 'check_in_date', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (20, 'CurrentTags', 'CurrentTags', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (21, 'TownshipContent', 'TownshipContent', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (22, 'AssociatedStaff', 'AssociatedStaff', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (23, 'NextRefillDueDate', 'RefillDueDate', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (24, 'AdherencePercentage', 'Adherence Percentage', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (25, 'TU', 'TU', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (26, 'PHI', 'PHI', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (27, 'LastCalledOn', 'Last Called On', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (28, 'RefillDate', 'Next Refill Due Date', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (29, 'DateOfDiagnosis', 'Date Of Diagnosis', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (30, 'TBTreatmentStartDate', 'TB Treatment Start Date', true);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (31, 'IMEI', 'IMEI', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (32, 'MermBatteryPercentage', 'Merm Battery Percentage', false);
INSERT INTO task_list_column (id, name, label, sortable) VALUES (33, 'EnrollmentDate', 'EnrollmentDate', false);

CREATE SEQUENCE IF NOT EXISTS filters_id_seq;

CREATE TABLE IF NOT EXISTS filters( id bigint NOT NULL DEFAULT nextval('filters_id_seq'::regclass), name text COLLATE pg_catalog."default", CONSTRAINT filters_pkey PRIMARY KEY (id));

INSERT INTO filters (id, name) VALUES (1, 'AttentionRequired');
INSERT INTO filters (id, name) VALUES (2, 'DidntCallYesterday');
INSERT INTO filters (id, name) VALUES (3, 'DoseNotReportedToday');
INSERT INTO filters (id, name) VALUES (4, 'EndDatePassed');
INSERT INTO filters (id, name) VALUES (5, 'FollowUpNeeded');
INSERT INTO filters (id, name) VALUES (6, 'LastIvrStatusList');
INSERT INTO filters (id, name) VALUES (7, 'MaxDaysSinceTreatmentStart');
INSERT INTO filters (id, name) VALUES (8, 'MinDaysSinceTreatmentStart');
INSERT INTO filters (id, name) VALUES (9, 'MonitoringMethod');
INSERT INTO filters (id, name) VALUES (10, 'NumberOfConsecutiveMissedDoses');
INSERT INTO filters (id, name) VALUES (11, 'NumberOfConsecutiveMissedDosesMax');
INSERT INTO filters (id, name) VALUES (12, 'NumberOfConsecutiveMissedDosesMin');
INSERT INTO filters (id, name) VALUES (13, 'OnTreatment');
INSERT INTO filters (id, name) VALUES (14, 'PositiveDosingDays');
INSERT INTO filters (id, name) VALUES (15, 'RefillDue');
INSERT INTO filters (id, name) VALUES (16, 'ScheduleType');
INSERT INTO filters (id, name) VALUES (17, 'AllowedRangeJsonString');
INSERT INTO filters (id, name) VALUES (18, 'BankDetailsEmpty');
INSERT INTO filters (id, name) VALUES (19, 'BenefitsStatus');
INSERT INTO filters (id, name) VALUES (20, 'ForegoBenefits');
INSERT INTO filters (id, name) VALUES (21, 'MermDeviceBatteryLow');
INSERT INTO filters (id, name) VALUES (22, 'RegistrationDateRange');
INSERT INTO filters (id, name) VALUES (23, 'Stage');
INSERT INTO filters (id, name) VALUES (24, 'TagList');
INSERT INTO filters (id, name) VALUES (25, 'TreatmentOutcome');

CREATE SEQUENCE IF NOT EXISTS filter_values_id_seq;

CREATE TABLE IF NOT EXISTS filter_values( id bigint NOT NULL DEFAULT nextval('filter_values_id_seq'::regclass), filter_id bigint, value text COLLATE pg_catalog."default", CONSTRAINT filter_values_pkey PRIMARY KEY (id));

INSERT INTO filter_values (id, filter_id, value) VALUES (1, 1, 'HIGH');
INSERT INTO filter_values (id, filter_id, value) VALUES (2, 2, 'True');
INSERT INTO filter_values (id, filter_id, value) VALUES (3, 3, 'True');
INSERT INTO filter_values (id, filter_id, value) VALUES (4, 4, 'True');
INSERT INTO filter_values (id, filter_id, value) VALUES (5, 4, 'False');
INSERT INTO filter_values (id, filter_id, value) VALUES (6, 5, 'True');
INSERT INTO filter_values (id, filter_id, value) VALUES (7, 6, 'FAILURE,UNCLEAR');
INSERT INTO filter_values (id, filter_id, value) VALUES (8, 6, 'NEGATIVE');
INSERT INTO filter_values (id, filter_id, value) VALUES (9, 7, '60');
INSERT INTO filter_values (id, filter_id, value) VALUES (10, 8, '178');
INSERT INTO filter_values (id, filter_id, value) VALUES (11, 9, '99DOTS');
INSERT INTO filter_values (id, filter_id, value) VALUES (12, 10, '1');
INSERT INTO filter_values (id, filter_id, value) VALUES (13, 10, '2');
INSERT INTO filter_values (id, filter_id, value) VALUES (14, 10, '3');
INSERT INTO filter_values (id, filter_id, value) VALUES (15, 10, '57');
INSERT INTO filter_values (id, filter_id, value) VALUES (16, 10, '90');
INSERT INTO filter_values (id, filter_id, value) VALUES (17, 11, '60');
INSERT INTO filter_values (id, filter_id, value) VALUES (18, 11, '90');
INSERT INTO filter_values (id, filter_id, value) VALUES (19, 12, '30');
INSERT INTO filter_values (id, filter_id, value) VALUES (20, 12, '60');
INSERT INTO filter_values (id, filter_id, value) VALUES (21, 13, 'True');
INSERT INTO filter_values (id, filter_id, value) VALUES (22, 14, '168');
INSERT INTO filter_values (id, filter_id, value) VALUES (23, 15, 'True');
INSERT INTO filter_values (id, filter_id, value) VALUES (24, 16, '3HP');
INSERT INTO filter_values (id, filter_id, value) VALUES (25, 8, '50');
INSERT INTO filter_values (id, filter_id, value) VALUES (26, 2, '1');
INSERT INTO filter_values (id, filter_id, value) VALUES (27, 13, '1');
INSERT INTO filter_values (id, filter_id, value) VALUES (28, 17, '[{"LowerBound":1,"UpperBound":3}]');
INSERT INTO filter_values (id, filter_id, value) VALUES (29, 17, '[{"LowerBound":4,"UpperBound":7}]');
INSERT INTO filter_values (id, filter_id, value) VALUES (30, 17, '[{"LowerBound":8,"UpperBound":14}]');
INSERT INTO filter_values (id, filter_id, value) VALUES (31, 17, '[{"LowerBound":15,"UpperBound":0}]');
INSERT INTO filter_values (id, filter_id, value) VALUES (32, 18, 'true');
INSERT INTO filter_values (id, filter_id, value) VALUES (33, 19, 'MAKER_PENDING');
INSERT INTO filter_values (id, filter_id, value) VALUES (34, 20, 'false');
INSERT INTO filter_values (id, filter_id, value) VALUES (35, 21, 'false');
INSERT INTO filter_values (id, filter_id, value) VALUES (36, 22, '{"LowerBound":14,"UpperBound":20}');
INSERT INTO filter_values (id, filter_id, value) VALUES (37, 22, '{"LowerBound":3,"UpperBound":13}');
INSERT INTO filter_values (id, filter_id, value) VALUES (38, 22, '{"LowerBound":21,"UpperBound":27}');
INSERT INTO filter_values (id, filter_id, value) VALUES (39, 23, 'DIAGNOSED_ON_TREATMENT');
INSERT INTO filter_values (id, filter_id, value) VALUES (40, 23, 'PRESUMPTIVE_OPEN');
INSERT INTO filter_values (id, filter_id, value) VALUES (41, 24, '["No_visit_recorded","Follow_up_done_by_STS"]');
INSERT INTO filter_values (id, filter_id, value) VALUES (42, 24, '["No_visit_recorded","Follow_up_done_by_STS","Follow_up_done_by_DTO"]');
INSERT INTO filter_values (id, filter_id, value) VALUES (43, 9, 'MERM');
INSERT INTO filter_values (id, filter_id, value) VALUES (44, 21, 'true');
INSERT INTO filter_values (id, filter_id, value) VALUES (45, 25, 'EXTRA_OUTCOME');

CREATE SEQUENCE IF NOT EXISTS deployment_task_list_id_seq;

CREATE TABLE IF NOT EXISTS deployment_task_list( id bigint NOT NULL DEFAULT nextval('deployment_task_list_id_seq'::regclass), deployment_id bigint, display_columns text COLLATE pg_catalog."default", display_order bigint, task_list_id bigint, CONSTRAINT deployment_task_list_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS task_list_filter_map_id_seq;

CREATE TABLE IF NOT EXISTS task_list_filter_map( id bigint NOT NULL DEFAULT nextval('task_list_filter_map_id_seq'::regclass), deployment_task_list_id bigint, filter_value_id bigint, CONSTRAINT task_list_filter_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS form_id_seq;

CREATE TABLE IF NOT EXISTS form( id bigint NOT NULL DEFAULT nextval('form_id_seq'::regclass), form_label character varying(100) COLLATE pg_catalog."default", form_name character varying(100) COLLATE pg_catalog."default", save_endpoint character varying(255) COLLATE pg_catalog."default", save_text character varying(255) COLLATE pg_catalog."default", CONSTRAINT form_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS form_part_id_seq;

CREATE TABLE IF NOT EXISTS form_part( id bigint NOT NULL DEFAULT nextval('form_part_id_seq'::regclass), part_name character varying(100) COLLATE pg_catalog."default", part_label character varying(100) COLLATE pg_catalog."default", part_type character varying(100) COLLATE pg_catalog."default", "position" bigint, rows bigint, columns bigint, allow_row_open boolean DEFAULT false, allow_row_delete boolean DEFAULT false, list_item_title character varying(100) COLLATE pg_catalog."default", item_description_field character varying(100) COLLATE pg_catalog."default", row_delete_text character varying(100) COLLATE pg_catalog."default", CONSTRAINT form_part_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS field_id_seq;

CREATE TABLE IF NOT EXISTS field( id bigint NOT NULL DEFAULT nextval('field_id_seq'::regclass), field_name character varying(100) COLLATE pg_catalog."default", label character varying(100) COLLATE pg_catalog."default", component character varying(100) COLLATE pg_catalog."default", field_options text COLLATE pg_catalog."default", disabled boolean DEFAULT false, visible boolean DEFAULT true, required boolean DEFAULT false, default_value character varying(255) COLLATE pg_catalog."default", validation_list character varying(100) COLLATE pg_catalog."default", row_number bigint, column_number bigint, remote_url character varying(255) COLLATE pg_catalog."default", config text COLLATE pg_catalog."default", type character varying(255) COLLATE pg_catalog."default", CONSTRAINT field_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS field_dependency_id_seq;

CREATE TABLE IF NOT EXISTS field_dependency( id bigint NOT NULL DEFAULT nextval('field_dependency_id_seq'::regclass), type character varying(50) COLLATE pg_catalog."default", form_part_id bigint, field_id bigint, lookups text COLLATE pg_catalog."default", property_and_values text COLLATE pg_catalog."default", CONSTRAINT field_dependency_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS field_customizations_id_seq;

CREATE TABLE IF NOT EXISTS field_customizations( id bigint NOT NULL DEFAULT nextval('field_customizations_id_seq'::regclass), field_id bigint, attribute_name character varying(100) COLLATE pg_catalog."default", attribute_value text COLLATE pg_catalog."default", CONSTRAINT field_customizations_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS form_items_map_id_seq;

CREATE TABLE IF NOT EXISTS form_items_map( id bigint NOT NULL DEFAULT nextval('form_items_map_id_seq'::regclass), deployment_id bigint, form_name character varying(100) COLLATE pg_catalog."default", item_type character varying(50) COLLATE pg_catalog."default", item_id bigint, parent_type character varying(50) COLLATE pg_catalog."default", parent_id bigint, CONSTRAINT form_items_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS dynamic_form_validation_id_seq;

CREATE TABLE IF NOT EXISTS dynamic_form_validation( id bigint NOT NULL DEFAULT nextval('dynamic_form_validation_id_seq'::regclass), name character varying(255) COLLATE pg_catalog."default", type character varying(255) COLLATE pg_catalog."default", max_value bigint, min_value bigint, error_message character varying(255) COLLATE pg_catalog."default", error_message_key character varying(255) COLLATE pg_catalog."default", regex character varying(255) COLLATE pg_catalog."default", CONSTRAINT dynamic_form_validation_pkey PRIMARY KEY (id));

INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'Address', 'AlphaNumeric', null, null, 'AddressError', 'AddressError', '^[a-zA-Z0-9]*$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'AddressWithLimit', 'AlphaNumeric', null, null, 'AddressError', 'AddressError', '[a-zA-Z\d,\/().\-_ ]{1,2000}');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'Age', 'OnlyNumbersAllowed', 100, 1, 'AgeError', 'AgeError', '^[1-9][0-9]?$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'AgeAboveTen', 'AgeAboveTen', 100, 10, 'AgeAboveTenError', 'AgeAboveTenError', '[1-8][0-9]|9[0-9]$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'AgeBetween0and100', 'AgeBetween0and100', 100, 0, 'AgeError', 'AgeError', '^[1-9][0-9]?$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'AgeBetween18and99', 'AgeBetween18and99', null, null, 'AgeBetween18and99', 'AgeBetween18and99', '(([2-9][0-9])|([1][8-9]))$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'AlphaNumeric', 'AlphaNumeric', null, null, 'AlphaNumeric', 'AlphaNumeric', '^[a-zA-Z0-9]*$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'DRTBFollowUpMonthLimit', 'OnlyNumbersAllowed', 50, 1, 'DRTBFollowUpMonthLimitMessage', 'DRTBFollowUpMonthLimitMessage', '^0*(?:[1-9]|[1-4][0-9]|50)$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'Email', 'Email', null, null, 'EmailErrorMessage', 'EmailErrorMessage', null);
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'EnglishAlphabet', 'AlphaNumeric', null, null, 'EnglishAlphabet', 'EnglishAlphabet', '^[a-zA-Z0-9]*$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'FiveCharacterNumber', 'FiveCharacterNumber', null, null, 'FiveCharacterNumberError', 'FiveCharacterNumberError', '[0-9]{5}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'FourAlphaNumericCharacters', 'FourAlphaNumericCharacters', null, null, '_four_alpha_numeric_characters', '_four_alpha_numeric_characters', '[a-zA-Z0-9]{1,4}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'GreaterThanZero', 'GreaterThanZero', null, 1, 'GreaterThanZero', 'GreaterThanZero', '^[1-9][0-9]*$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'IFSC', 'IFSC', null, null, 'Please enter valid IFSC', 'Please enter valid IFSC', '^[A-Za-z]{4}0[a-zA-Z0-9]{6}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'IndurationSizeLimit', 'OnlyNumbersAllowed', 100, 0, 'IndurationSizeLimitMessage', 'IndurationSizeLimitMessage', '^0*(?:[0-9][0-9]?|100)$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'Length', 'Length', 10, 10, 'Length', 'Length', null);
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'MaximumFourCharacterNumber', 'OnlyNumbersAllowed', 10000, 0, 'Number should be greater than 0 and maximum 4 digits', 'Number should be greater than 0 and maximum 4 digits', '^[1-9][0-9]?$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'NumberBetweenZeroAndHundredIncluded', 'OnlyNumbersAllowed', 101, 0, 'Number should be between zero and hundred', 'Number should be between zero and hundred', '^[1-9][0-9]?$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'NumberBetweenZeroAndHundredIncludedDecimalsAllowed', 'NumberBetweenZeroAndHundredIncludedDecimalsAllowed', 100, 0, 'Number should be between zero and hundred', 'Number should be between zero and hundred', '^(0*([1-9][0-9]?(\.[0-9]*)?|0\.[0-9]*[1-9][0-9]*)|100(\.0*)?)$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'OnlyAlphabetAndSpaceAllowed', 'OnlyAlphabetAndSpaceAllowed', null, null, 'OnlyAlphabetAndSpaceAllowed', 'OnlyAlphabetAndSpaceAllowed', '[a-zA-Z][a-zA-Z ]+');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'OnlyNumbersAllowed', 'OnlyNumbersAllowed', null, null, 'OnlyNumbersAllowed', 'OnlyNumbersAllowed', '[0-9]+$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumber', 'PhoneNumber', null, null, 'error_phone_number', 'error_phone_number', '^(([1-9][0-9]{8}))$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberBetweenSevenAndEleven', 'PhoneNumberBetweenSevenAndEleven', null, null, 'PhoneNumberBetweenSevenAndEleven', 'PhoneNumberBetweenSevenAndEleven', '^[9][0-9]{6,10}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLength9without0or10with0', 'PhoneNumberLength9without0or10with0', null, null, 'PhoneNumberLength9without0or10with0', 'PhoneNumberLength9without0or10with0', '^(([0][1-9][0-9]{8})|([1-9][0-9]{8}))$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthEightPlusWithoutZero', 'PhoneNumberLengthEightPlusWithoutZero', null, null, 'error_phone_number', 'error_phone_number', '^[1-9][0-9]{7,}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthEleven', 'PhoneNumberLengthEleven', null, null, 'error_phone_number', 'error_phone_number', '^[1-9][0-9]{10}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthNine', 'PhoneNumberLengthNine', null, null, 'error_phone_number', 'error_phone_number', '^[1-9][0-9]{8}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthNinePlus', 'PhoneNumberLengthNinePlus', null, null, 'error_phone_number', 'error_phone_number', '^[1-9][0-9]{8,}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthNineWithFirstDigitEightOrNine', 'PhoneNumberLengthNineWithFirstDigitEightOrNine', null, null, 'error_phone_number', 'error_phone_number', '^[8-9][0-9]{8}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthSevenToNine', 'PhoneNumberLengthSevenToNine', null, null, 'PhoneNumberLengthSevenToNine', 'PhoneNumberLengthSevenToNine', '^[1-9][0-9]{6,8}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberLengthTen', 'PhoneNumberLengthTen', null, null, 'error_phone_number', 'error_phone_number', '^[1-9][0-9]{9}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberMaxLengthEleven', 'PhoneNumberMaxLengthEleven', null, null, 'PhoneNumberMaxLengthEleven', 'PhoneNumberMaxLengthEleven', '^[1-9][0-9]{0,10}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberMustStartWithZero', 'PhoneNumberMustStartWithZero', null, null, 'error_phone_number', 'error_phone_number', '^0[0-9]{9}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'PhoneNumberNotStartingWithZero', 'PhoneNumberNotStartingWithZero', null, null, 'error_phone_number', 'error_phone_number', '[1-9][0-9]{9}');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'Pincode', 'OnlyNumbersAllowed', null, null, 'PincodeError', 'PincodeError', '[0-9]{6}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'Required', 'Required', null, null, 'error_field_required', 'error_field_required', null);
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'TBNumberFormatForMYA', 'TBNumberFormatForMYA', null, null, 'TBNumberFormatForMYA', 'TBNumberFormatForMYA', '[0-9]{4}[-][0-9]{4}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'TBNumberFormatForUKRandUGAVOT', 'TBNumberFormatForUKRandUGAVOT', null, null, 'TBNumberFormatForUKRandUGAVOT', 'TBNumberFormatForUKRandUGAVOT', '[0-9]{1,6}([-][0-9]){0,1}$');
INSERT INTO dynamic_form_validation (id, name, type, max_value, min_value, error_message, error_message_key, regex) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM dynamic_form_validation), 'ThreeDigitsAllowed', 'ThreeDigitsAllowed', null, null, 'only_three_digits', 'only_three_digits', '[0-9]{1,3}$');

CREATE SEQUENCE IF NOT EXISTS hierarchy_id_seq;

CREATE TABLE IF NOT EXISTS hierarchy( id bigint NOT NULL DEFAULT nextval('hierarchy_id_seq'::regclass), active boolean NOT NULL, client_id bigint, code character varying(255) COLLATE pg_catalog."default", created_at timestamp without time zone, deployment_id bigint, end_date timestamp without time zone, has_children boolean NOT NULL, level bigint, level_1_code character varying(255) COLLATE pg_catalog."default", level_1_id bigint, level_1_name character varying(255) COLLATE pg_catalog."default", level_1_type character varying(255) COLLATE pg_catalog."default", level_2_code character varying(255) COLLATE pg_catalog."default", level_2_id bigint, level_2_name character varying(255) COLLATE pg_catalog."default", level_2_type character varying(255) COLLATE pg_catalog."default", level_3_code character varying(255) COLLATE pg_catalog."default", level_3_id bigint, level_3_name character varying(255) COLLATE pg_catalog."default", level_3_type character varying(255) COLLATE pg_catalog."default", level_4_code character varying(255) COLLATE pg_catalog."default", level_4_id bigint, level_4_name character varying(255) COLLATE pg_catalog."default", level_4_type character varying(255) COLLATE pg_catalog."default", level_5_code character varying(255) COLLATE pg_catalog."default", level_5_id bigint, level_5_name character varying(255) COLLATE pg_catalog."default", level_5_type character varying(255) COLLATE pg_catalog."default", level_6_code character varying(255) COLLATE pg_catalog."default", level_6_id bigint, level_6_name character varying(255) COLLATE pg_catalog."default", level_6_type character varying(255) COLLATE pg_catalog."default", merge_status character varying(255) COLLATE pg_catalog."default", name character varying(255) COLLATE pg_catalog."default", parent_id bigint, start_date timestamp without time zone, type character varying(255) COLLATE pg_catalog."default", updated_at timestamp without time zone, CONSTRAINT hierarchy_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS associations_master_id_seq;

CREATE TABLE IF NOT EXISTS associations_master( id bigint NOT NULL DEFAULT nextval('associations_master_id_seq'::regclass), type character varying(255) COLLATE pg_catalog."default", CONSTRAINT associations_master_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS hierarchy_associations_id_seq;

CREATE TABLE IF NOT EXISTS hierarchy_associations( id bigint NOT NULL DEFAULT nextval('hierarchy_associations_id_seq'::regclass), association_id bigint, hierarchy_id bigint, value text COLLATE pg_catalog."default", CONSTRAINT hierarchy_associations_pkey PRIMARY KEY (id), CONSTRAINT hierarchy_associations_fk_association_id FOREIGN KEY (association_id) REFERENCES associations_master (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT hierarchy_associations_fk_hierarchy_id FOREIGN KEY (hierarchy_id) REFERENCES hierarchy (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS config_id_seq;

CREATE TABLE IF NOT EXISTS config( id bigint NOT NULL DEFAULT nextval('config_id_seq'::regclass), created_at timestamp without time zone, default_value character varying(255) COLLATE pg_catalog."default", name character varying(255) COLLATE pg_catalog."default", type character varying(255) COLLATE pg_catalog."default", multi_mapped boolean NOT NULL DEFAULT false, CONSTRAINT config_pkey PRIMARY KEY (id));

INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, '1', 'MermMappingLevel', 'string', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'PrivatePartnership', 'TypeOfPatient', 'string', true);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'TB', 'AccessType', 'string', true);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, null, 'ProductAttributes', 'ProductAttributes', true);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, null, 'RegimenProductMapping', 'RegimenProductMap', true);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'Charts', 'OverviewPage', 'string', true);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'true', 'OverviewPageVisibility', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, '5', 'DispensationLevels', 'DispensationLevels', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'ON_TREATMENT', 'DispensationStages', 'DispensationStages', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'false', 'HasMerm', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'false', 'HasVot', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'false', 'HasNone', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'false', 'Has99Dots', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'false', 'Has99DotsLite', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, 'true', 'TeleConsultationVisibility', 'boolean', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, '["Male", "Female", "Unknown"]', 'GenderOptions', 'List<string>', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, '[]', 'DetailedReportHeaders', 'List<string>', false);
INSERT INTO config (created_at, default_value, name, type, multi_mapped) VALUES (null, '[]', 'DetailedReportHeadersWithPII', 'List<string>', false);

CREATE SEQUENCE IF NOT EXISTS hierarchy_config_map_id_seq;

CREATE TABLE IF NOT EXISTS hierarchy_config_map( id bigint NOT NULL DEFAULT nextval('hierarchy_config_map_id_seq'::regclass), active boolean NOT NULL, config_mapping_id bigint, created_at timestamp without time zone, hierarchy_id bigint, value character varying(255) COLLATE pg_catalog."default", CONSTRAINT hierarchy_config_map_pkey PRIMARY KEY (id), CONSTRAINT hierarchy_config_map_fk_config_mapping_id FOREIGN KEY (config_mapping_id) REFERENCES config (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT hierarchy_config_map_fk_hierarchy_id FOREIGN KEY (hierarchy_id) REFERENCES hierarchy (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS staff_id_seq;

CREATE TABLE IF NOT EXISTS staff( id bigint NOT NULL DEFAULT nextval('staff_id_seq'::regclass), client_id bigint, person_id bigint, designation text COLLATE pg_catalog."default", added_by bigint, selective_episode_mapping boolean, active boolean, added_on timestamp without time zone, last_updated_on timestamp without time zone, CONSTRAINT staff_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS staff_episode_map_id_seq;

CREATE TABLE IF NOT EXISTS staff_episode_map( id bigint NOT NULL DEFAULT nextval('staff_episode_map_id_seq'::regclass), staff_id bigint, episode_id bigint, added_on timestamp without time zone, last_updated_on timestamp without time zone, relationship text COLLATE pg_catalog."default", CONSTRAINT staff_episode_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS user_access_id_seq;

CREATE TABLE IF NOT EXISTS user_access( id bigint NOT NULL DEFAULT nextval('user_access_id_seq'::regclass), active boolean NOT NULL, hierarchy_id bigint, selective_hierarchy_mapping boolean, sso_id bigint NOT NULL, username character varying(255) COLLATE pg_catalog."default", client_id bigint, staff_id bigint, description character varying(1000) COLLATE pg_catalog."default", CONSTRAINT user_access_pkey PRIMARY KEY (id), CONSTRAINT user_access_fk_hierarchy_id FOREIGN KEY (hierarchy_id) REFERENCES hierarchy (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS user_access_hierarchy_map_id_seq;

CREATE TABLE IF NOT EXISTS user_access_hierarchy_map( id bigint NOT NULL DEFAULT nextval('user_access_hierarchy_map_id_seq'::regclass), created_at timestamp without time zone, hierarchy_id bigint, last_updated_by bigint, relation character varying(255) COLLATE pg_catalog."default", updated_at timestamp without time zone, user_id bigint NOT NULL, CONSTRAINT user_access_hierarchy_map_pkey PRIMARY KEY (id), CONSTRAINT user_access_hierarchy_map_fk_hierarchy_mapping FOREIGN KEY (hierarchy_id) REFERENCES hierarchy (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT user_access_hierarchy_map_fk_userid FOREIGN KEY (user_id) REFERENCES user_access (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS sidebar_item_id_seq;

CREATE TABLE IF NOT EXISTS sidebar_item( id bigint NOT NULL DEFAULT nextval('sidebar_item_id_seq'::regclass), name character varying(255) COLLATE pg_catalog."default", icon character varying(255) COLLATE pg_catalog."default", link character varying(255) COLLATE pg_catalog."default", relative_path boolean NOT NULL);


CREATE SEQUENCE IF NOT EXISTS sidebar_permission_id_seq;
CREATE SEQUENCE IF NOT EXISTS sidebar_permission_sidebar_id_seq;

CREATE TABLE IF NOT EXISTS sidebar_permission( id bigint NOT NULL DEFAULT nextval('sidebar_permission_id_seq'::regclass), deployment_id bigint, designation character varying(255) COLLATE pg_catalog."default" NOT NULL, sidebar_id bigint NOT NULL DEFAULT nextval('sidebar_permission_sidebar_id_seq'::regclass), is_active boolean NOT NULL DEFAULT true);

INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 1, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 2, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 3, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 4, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 5, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 6, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 7, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 8, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 9, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 10, true);
INSERT INTO sidebar_permission (deployment_id, designation, sidebar_id, is_active) VALUES (null, 'default', 11, true);

CREATE SEQUENCE IF NOT EXISTS trigger_id_seq;

CREATE TABLE IF NOT EXISTS trigger( id bigint NOT NULL DEFAULT nextval('trigger_id_seq'::regclass), client_id bigint, hierarchy_id bigint, trigger_id bigint, default_template_id bigint, template_ids text COLLATE pg_catalog."default", event_name text COLLATE pg_catalog."default", function_name text COLLATE pg_catalog."default", cron_time text COLLATE pg_catalog."default", time_related boolean, notification_type text COLLATE pg_catalog."default", mandatory boolean, active boolean, module text COLLATE pg_catalog."default", CONSTRAINT trigger_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS vendor_mapping_id_seq;

CREATE TABLE IF NOT EXISTS vendor_mapping( id bigint NOT NULL DEFAULT nextval('vendor_mapping_id_seq'::regclass), deployment_id bigint, vendor_id bigint, trigger_registry_id bigint, CONSTRAINT vendor_mapping_pkey PRIMARY KEY (id));

CREATE EXTENSION postgis;

ALTER TABLE hierarchy ADD if not exists geolocation geography;

create table if not exists appointment_staff_map( id bigserial not null constraint appointment_staff_map_pkey primary key, staff_id bigint not null, appointment_id integer not null);

create table if not exists staff_associations( id bigserial primary key, association_id bigint, created_at timestamp, staff_id bigint, updated_at timestamp, value varchar(255));

CREATE TABLE IF NOT EXISTS staff_associations_aud( id bigint not null, REV integer not null, REVTYPE smallint, value text, primary key (id, REV));