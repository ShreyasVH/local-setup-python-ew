create sequence ds_client_id_seq;

create table ds_client( id bigserial not null constraint ds_client_pkey primary key, created_date timestamp, name varchar(255), password varchar(255), event_flow_id bigint);

create index idx_client_name on ds_client (name);

create sequence ds_product_id_seq;

create table ds_product( id bigserial not null constraint ds_product_pkey primary key, composition varchar(255), dosage varchar(255), dosage_form varchar(255) not null, drug_code varchar(255), manufacturer varchar(255), product_name varchar(255) not null, category varchar(255));

create index idx_drugcode on ds_product (drug_code);

create index idx_composition_dosage_dosageforn_drugcode_manufacturer_product on ds_product (composition, dosage, dosage_form, drug_code, manufacturer, product_name);

create sequence ds_product_inventory_id_seq;

create table ds_product_inventory( id bigserial not null constraint ds_product_inventory_pkey primary key, product_id bigint not null, batch_number varchar(255), expiry_date timestamp);

create index idx_productid_batchnumber on ds_product_inventory (product_id, batch_number);

create index idx_productid on ds_product_inventory (product_id);

create sequence ds_product_inventory_log_id_seq;

create table ds_product_inventory_log( id bigserial not null constraint ds_product_inventory_log_pkey primary key, transaction_type integer not null, transaction_id bigint not null, transaction_quantity bigint not null, comment_type integer, comment varchar(255), date_of_action timestamp not null, p_inventory_id bigint, product_id bigint, transaction_id_type integer, updated_by bigint);

create index idx_transactionid_ds_prodinvlog on ds_product_inventory_log (transaction_id);

create sequence ds_product_inventory_hierarchy_mapping_id_seq;

create table ds_product_inventory_hierarchy_mapping( id bigserial not null constraint ds_product_inventory__hierarchy_mapping_pkey primary key, inventory_id bigint not null, hierarchy_mapping_id bigint not null, client_id bigint not null, available_quantity bigint, last_updated_by bigint, last_updated_at timestamp);

create index idx_inventoryid_hierarchymappingid on ds_product_inventory_hierarchy_mapping (inventory_id, hierarchy_mapping_id);

create index idx_inventoryid_hierarchymappingid_clientid on ds_product_inventory_hierarchy_mapping (inventory_id, hierarchy_mapping_id, client_id);

create index idx_hierarchy_mapping_id on ds_product_inventory_hierarchy_mapping (hierarchy_mapping_id);

create sequence ds_dispensation_id_seq;

create table ds_dispensation( id bigserial not null constraint ds_dispensation_pkey primary key, added_by bigint not null, added_date timestamp not null, client_id bigint, date_of_prescription timestamp, deleted boolean, drug_dispensed_for_days bigint, entity_id bigint not null, issue_date timestamp, issuing_facility bigint, notes varchar(1000), phase varchar(255), refill_date timestamp, weight bigint, weight_band varchar(255), dosing_start_date timestamp, status integer default 0);

create index idx_entityid_clientid_deleted on ds_dispensation (entity_id, client_id, deleted);

create index idx_id_clientid_deleted on ds_dispensation (id, client_id, deleted);

create sequence ds_product_dispensation_mapping_id_seq;

create table ds_product_dispensation_mapping( id bigserial not null constraint ds_product_dispensation_mapping_pkey primary key, dispensation_id bigint not null, dosing_schedule varchar(255), number_of_units_issued bigint, product_config_id bigint not null, product_id bigint not null, refill_date timestamp);

create index idx_dispensationid on ds_product_dispensation_mapping (dispensation_id);




