# flyway_schema_versions
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1.1', 'create schema client', 'SQL', 'V1.1__create_schema_client.sql', 1509921934, 'shreyas', '2023-12-11 11:53:23.122645', 12, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (2, '1.2', 'create schema dispensation', 'SQL', 'V1.2__create_schema_dispensation.sql', -114579741, 'shreyas', '2023-12-11 11:53:23.150268', 10, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (3, '1.3', 'create schema product', 'SQL', 'V1.3__create_schema_product.sql', -57986548, 'shreyas', '2023-12-11 11:53:23.170592', 9, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (4, '1.4', 'create schema product dispensation mapping', 'SQL', 'V1.4__create_schema_product_dispensation_mapping.sql', -295631328, 'shreyas', '2023-12-11 11:53:23.190366', 7, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (5, '1.5', 'create index clientName on schema client', 'SQL', 'V1.5__create_index_clientName_on_schema_client.sql', -778363795, 'shreyas', '2023-12-11 11:53:23.206036', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (6, '1.6', 'create index entityId clientId deleted on schema dispensation', 'SQL', 'V1.6__create_index_entityId_clientId_deleted_on_schema_dispensation.sql', -717896117, 'shreyas', '2023-12-11 11:53:23.220894', 7, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (7, '1.7', 'create index id clientId deleted on schema dispensation', 'SQL', 'V1.7__create_index_id_clientId_deleted_on_schema_dispensation.sql', -514290183, 'shreyas', '2023-12-11 11:53:23.235427', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (8, '1.8', 'create index dispensationId on schema product dispensation mapping', 'SQL', 'V1.8__create_index_dispensationId_on_schema_product_dispensation_mapping.sql', 1041655134, 'shreyas', '2023-12-11 11:53:23.248179', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (9, '3.0', 'alter schema dispensation add column dosingstartdate', 'SQL', 'V3.0__alter_schema_dispensation_add_column_dosingstartdate.sql', -1057895218, 'shreyas', '2023-12-11 11:53:23.260157', 2, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (10, '4.0', 'create schema and index dispensation log', 'SQL', 'V4.0__create_schema_and_index_dispensation_log.sql', -677246904, 'shreyas', '2023-12-11 11:53:23.269415', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (11, '4.1', 'alter schema dispensation add status', 'SQL', 'V4.1__alter_schema_dispensation_add_status.sql', -492990133, 'shreyas', '2023-12-11 11:53:23.282337', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (12, '5.1', 'add cloumn event flow id in ds client', 'SQL', 'V5.1__add_cloumn_event_flow_id_in_ds_client.sql', -1510900, 'shreyas', '2023-12-11 11:53:23.292833', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (13, '6.1', 'create schema product inventory', 'SQL', 'V6.1__create_schema_product_inventory.sql', -1585815191, 'shreyas', '2023-12-11 11:53:23.305289', 7, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (14, '6.2', 'create schema product inventory hierarchy mapping', 'SQL', 'V6.2__create_schema_product_inventory_hierarchy_mapping.sql', 861286309, 'shreyas', '2023-12-11 11:53:23.322620', 8, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (15, '6.3', 'update schema product dispensation log', 'SQL', 'V6.3__update_schema_product_dispensation_log.sql', 1089887714, 'shreyas', '2023-12-11 11:53:23.340872', 17, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (16, '6.4', 'update product id on schema product inventory log', 'SQL', 'V6.4__update_product_id_on_schema_product_inventory_log.sql', -608084631, 'shreyas', '2023-12-11 11:53:23.365087', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (17, '6.5', 'update transaction id type on schema product inventory log', 'SQL', 'V6.5__update_transaction_id_type_on_schema_product_inventory_log.sql', -715917516, 'shreyas', '2023-12-11 11:53:23.377159', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (18, '6.6', 'create index product id batch number on schema inventory', 'SQL', 'V6.6__create_index_product_id_batch_number_on_schema_inventory.sql', -869782176, 'shreyas', '2023-12-11 11:53:23.386132', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (19, '6.7', 'create index drug code on schema product', 'SQL', 'V6.7__create_index_drug_code_on_schema_product.sql', -2146220639, 'shreyas', '2023-12-11 11:53:23.398576', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (20, '6.8', 'create index product id on schema inventory', 'SQL', 'V6.8__create_index_product_id_on_schema_inventory.sql', -328814486, 'shreyas', '2023-12-11 11:53:23.411133', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (21, '6.9', 'create index inventory id hierarchy id on schema product inventory hierarchy', 'SQL', 'V6.9__create_index_inventory_id_hierarchy_id_on_schema_product_inventory_hierarchy.sql', 27036071, 'shreyas', '2023-12-11 11:53:23.422913', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (22, '6.10', 'create index all columns on schema product', 'SQL', 'V6.10__create_index_all_columns_on_schema_product.sql', 1156499193, 'shreyas', '2023-12-11 11:53:23.434789', 6, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (23, '6.11', 'create index inventory id hierarchy id client id on schema product inventory hierarchy', 'SQL', 'V6.11__create_index_inventory_id_hierarchy_id_client_id_on_schema_product_inventory_hierarchy.sql', 1622176103, 'shreyas', '2023-12-11 11:53:23.448170', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (24, '6.12', 'create index transaction id on schema product inventory log', 'SQL', 'V6.12__create_index_transaction_id_on_schema_product_inventory_log.sql', -1041431493, 'shreyas', '2023-12-11 11:53:23.459123', 5, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (25, '6.13', 'change UOM', 'SQL', 'V6.13__change_UOM.sql', 2120354059, 'shreyas', '2023-12-11 11:53:23.469328', 3, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (26, '6.14', 'add column category in ds product', 'SQL', 'V6.14__add_column_category_in_ds_product.sql', -1744097220, 'shreyas', '2023-12-11 11:53:23.478698', 4, true);
    INSERT INTO flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (27, '6.15', 'create index hierarchy mapping id on product inventory hierarchy mapping', 'SQL', 'V6.15__create_index_hierarchy_mapping_id_on_product_inventory_hierarchy_mapping.sql', 1270626009, 'shreyas', '2023-12-11 11:53:23.488586', 5, true);