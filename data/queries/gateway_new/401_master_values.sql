# event
    INSERT INTO event (event_name, created_at,updated_at) VALUES('fetch-npho-kpi', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'add-test', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_PLUS_0_DAY', 'abdm-add-update-consent', 'UTC_DATE_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_DUPLICATES', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_STATE_DISTRICT', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_TU_LIST', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_FACILITIES', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'ADD_PATIENT', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_PATIENT', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'ADD_EPISODE', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'UPDATE_EPISODE', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_EPISODE', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO event (created_at, event_name, updated_at) VALUES ('UTC_DATE_TIME_PLUS_0_DAY', 'GET_POSSIBLE_DUPLICATES', 'UTC_DATE_TIME_PLUS_0_DAY');

# publisher_queue_info
    INSERT INTO publisher_queue_info (event_name, exchange, queue_name, reply_to_routing_key, routing_key) VALUES ('add-test', 'direct-incoming', 'q.dg.add_test', 'add-test', 'q.dg.add_test');
    INSERT INTO publisher_queue_info (event_name, exchange, queue_name, reply_to_routing_key, routing_key) VALUES ('abdm-add-update-consent', 'direct-incoming', 'q.dg.abdm_add_update_consent', 'abdm-add-update-consent', 'q.dg.abdm_add_update_consent');
    INSERT INTO publisher_queue_info (event_name, exchange, queue_name, reply_to_routing_key, routing_key) VALUES ('ADD_PATIENT', 'direct-incoming', 'q.dg.add_patient', 'add-patient', 'q.dg.add_patient');
    INSERT INTO publisher_queue_info (event_name, exchange, queue_name, reply_to_routing_key, routing_key) VALUES ('ADD_EPISODE', 'direct-incoming', 'q.dg.add_patient', 'add-patient', 'q.dg.add_patient');
    INSERT INTO publisher_queue_info (event_name, exchange, queue_name, reply_to_routing_key, routing_key) VALUES ('UPDATE_EPISODE', 'direct-incoming', 'q.dg.update_episode', 'update-episode', 'q.dg.update_episode');

# flyway_schema_history
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', null, 'null', '2022-11-08 20:40:34.231081', 0, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (2, '2.0', 'Insert Publisher Queue Info Data', 'SQL', 'V2.0__Insert_Publisher_Queue_Info_Data.sql', 1847056677, 'postgres', '2022-11-08 20:40:34.267465', 7, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (3, '2.1', 'Delete ClientRequests Unused Columns', 'SQL', 'V2.1__Delete_ClientRequests_Unused_Columns.sql', -1687576439, 'postgres', '2022-11-08 20:40:34.290024', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (4, '3.0', 'Insert Dispensation Event Info Data', 'SQL', 'V3.0__Insert_Dispensation_Event_Info_Data.sql', 744531512, 'postgres', '2022-11-08 20:40:34.310012', 9, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (5, '3.1', 'Insert Dispensation Publisher Queue Info Data', 'SQL', 'V3.1__Insert_Dispensation_Publisher_Queue_Info_Data.sql', 130984594, 'postgres', '2022-11-08 20:40:34.334477', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (6, '3.2', 'Insert ProcessCall Event and publisher queue info', 'SQL', 'V3.2__Insert_ProcessCall_Event_and_publisher_queue_info.sql', -880533816, 'postgres', '2022-11-08 20:40:34.359073', 4, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (7, '3.3', 'Insert ProcessCall Publisher queue info', 'SQL', 'V3.3__Insert_ProcessCall_Publisher_queue_info.sql', -437440193, 'postgres', '2022-11-08 20:40:34.375031', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (8, '3.4', 'Insert Share Dispensation Event Info Data', 'SQL', 'V3.4__Insert_Share_Dispensation_Event_Info_Data.sql', 279515887, 'postgres', '2022-11-08 20:40:34.390631', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (9, '3.5', 'Create Index Client Authorization typeid', 'SQL', 'V3.5__Create_Index_Client_Authorization_typeid.sql', -1778617635, 'postgres', '2022-11-08 20:40:34.405672', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (10, '3.6', 'Insert Missed adherence in Event Table', 'SQL', 'V3.6__Insert_Missed_adherence_in_Event_Table.sql', 2145797778, 'postgres', '2022-11-08 20:40:34.423575', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (11, '3.7', 'Insert Add Patient Data In PublisherQueueInfo', 'SQL', 'V3.7__Insert_Add_Patient_Data_In_PublisherQueueInfo.sql', 645795953, 'postgres', '2022-11-08 20:40:34.439092', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (12, '3.9', 'Insert Event for iam and dispensation', 'SQL', 'V3.9__Insert_Event_for_iam_and_dispensation.sql', 1477045632, 'postgres', '2022-11-08 20:40:34.454131', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (13, '4.0', 'Add Missing Indexes', 'SQL', 'V4.0__Add_Missing_Indexes.sql', -361635374, 'postgres', '2022-11-08 20:40:34.471495', 19, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (14, '4.2', 'Update Client Requests Table', 'SQL', 'V4.2__Update_Client_Requests_Table.sql', -1961939865, 'postgres', '2022-11-08 20:44:31.109812', 25, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (15, '4.3', 'Add ClientRequest Archive Table', 'SQL', 'V4.3__Add_ClientRequest_Archive_Table.sql', 134412338, 'postgres', '2022-11-08 20:44:31.166677', 11, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (16, '3.10', 'Add response type column in event client', 'SQL', 'V3.10__Add_response_type_column_in_event_client.sql', 307673159, 'postgres', '2023-03-05 13:19:17.404801', 28, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (17, '3.11', 'Insert Event for abdm add update consent', 'SQL', 'V3.11__Insert_Event_for_abdm_add_update_consent.sql', 1741046081, 'postgres', '2023-03-05 13:19:17.440914', 2, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (18, '3.12', 'Insert Add Update Consent In PublisherQueueInfo', 'SQL', 'V3.12__Insert_Add_Update_Consent_In_PublisherQueueInfo.sql', -683959388, 'postgres', '2023-03-05 13:19:17.450524', 2, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (19, '3.13', 'Add abdm data exchange event', 'SQL', 'V3.13__Add_abdm_data_exchange_event.sql', -1367095763, 'postgres', '2023-03-05 13:19:17.460304', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (20, '3.14', 'Insert abdm data exchange queue info', 'SQL', 'V3.14__Insert_abdm_data_exchange_queue_info.sql', 55104652, 'postgres', '2023-03-05 13:19:17.465854', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (21, '4.1', 'Insert Events For ABDM Care context', 'SQL', 'V4.1__Insert_Events_For_ABDM_Care_context.sql', -168302298, 'postgres', '2023-03-05 13:19:17.471902', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (22, '4.4', 'Insert ABDM Care Context queues in publisher queues', 'SQL', 'V4.4__Insert_ABDM_Care_Context_queues_in_publisher_queues.sql', 1735033556, 'postgres', '2023-03-05 13:19:17.477268', 168, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (23, '4.7', 'Insert event for user discovery abdm', 'SQL', 'V4.7__Insert_event_for_user_discovery_abdm.sql', 1099239863, 'postgres', '2023-03-05 13:19:17.650712', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (24, '4.8', 'Insert event for link initiation abdm', 'SQL', 'V4.8__Insert_event_for_link_initiation_abdm.sql', 824193052, 'postgres', '2023-03-05 13:19:17.655931', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (25, '4.9', 'Insert event for link confirmation abdm', 'SQL', 'V4.9__Insert_event_for_link_confirmation_abdm.sql', -1024297388, 'postgres', '2023-03-05 13:19:17.663498', 2, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (26, '5.0', 'Insert Merm Events', 'SQL', 'V5.0__Insert_Merm_Events.sql', 600324437, 'postgres', '2023-03-05 13:19:17.670251', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (27, '5.1', 'Add Gmri Events And Queue', 'SQL', 'V5.1__Add_Gmri_Events_And_Queue.sql', 1932590315, 'postgres', '2023-03-05 13:19:17.679180', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (28, '5.3', 'Add Get imei event', 'SQL', 'V5.3__Add_Get_imei_event.sql', -49077165, 'postgres', '2023-03-05 13:19:17.686995', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (29, '5.4', 'Add event for get all available imei', 'SQL', 'V5.4__Add_event_for_get_all_available_imei.sql', 1550052731, 'postgres', '2023-03-05 13:19:17.695020', 1, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (30, '5.5', 'Add Outgoing Webhook Log Table', 'SQL', 'V5.5__Add_Outgoing_Webhook_Log_Table.sql', 1565005821, 'postgres', '2023-03-05 13:19:17.701080', 110, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (31, '5.6', 'Insert event for consent request inititation', 'SQL', 'V5.6__Insert_event_for_consent_request_inititation.sql', -596932034, 'postgres', '2023-05-31 13:46:18.365616', 7, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (32, '5.7', 'Add event for consent Notification', 'SQL', 'V5.7__Add_event_for_consent_Notification.sql', 881371504, 'postgres', '2023-05-31 13:46:18.396852', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (33, '5.9', 'Add Active flag in event client table', 'SQL', 'V5.9__Add_Active_flag_in_event_client_table.sql', -982604099, 'postgres', '2023-06-28 10:56:30.082551', 8, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (34, '7.1', 'Add request method column', 'SQL', 'V7.1__Add_request_method_column.sql', 1794817676, 'postgres', '2023-06-28 10:56:30.106003', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (35, '7.2', 'Add event for ecbss', 'SQL', 'V7.2__Add_event_for_ecbss.sql', -1654970290, 'postgres', '2023-06-28 10:56:30.122468', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (36, '10.1', 'Insert event for NPHO', 'SQL', 'V10.1__Insert_event_for_NPHO.sql', -1767907791, 'shreyas', '2023-11-08 14:07:28.549198', 8, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (37, '11.1', 'Add triggers for dbt bharat jobs', 'SQL', 'V11.1__Add_triggers_for_dbt_bharat_jobs.sql', 1015242539, 'shreyas', '2023-11-08 14:07:28.549198', 8, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (38, '5.8', 'Add event for consent fetch and data request', 'SQL', 'V5.8__Add_event_for_consent_fetch_and_data_request.sql', -1941511657, 'shreyas', '2024-03-08 18:14:02.985019', 9, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (39, '5.10', 'Add event for data transfer requests', 'SQL', 'V5.10__Add_event_for_data_transfer_requests.sql', -2121109521, 'shreyas', '2024-03-08 18:14:03.007553', 2, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (40, '13.39', 'Add Episode Event Changes', 'SQL', 'V13.39__Add_Episode_Event_Changes.sql', -1621299890, 'shreyas', '2024-03-16 09:56:15.730636', 8, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (41, '12.1', 'Add update episode event', 'SQL', 'V12.1__Add_update_episode_event.sql', -1926043583, 'shreyas', '2024-05-04 08:28:42.500969', 8, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (42, '14.87', 'Add get episode event', 'SQL', 'V14.87__Add_get_episode_event.sql', -477076275, 'shreyas', '2024-06-25 07:51:08.128205', 23, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (43, '13.1', 'Get possible duplicates event', 'SQL', 'V13.1__Get_possible_duplicates_event.sql', -805576698, 'shreyas', '2025-01-25 13:52:51.561095', 7, true);