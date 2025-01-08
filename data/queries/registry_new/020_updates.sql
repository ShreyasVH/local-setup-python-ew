create table if not exists contract_staff_map( id bigserial primary key, contract_id uuid constraint "FK_contract_staff_map.contractId" references contracts, staff_id bigint constraint "FK_contract_staff_map.staffId" references staff, created_by bigint constraint "FK_contract_staff_map.createdBy" references user_access, created_on timestamp);

ALTER TABLE contract_staff_map RENAME TO contract_user_map;

ALTER table contract_user_map DROP CONSTRAINT "FK_contract_staff_map.staffId";

ALTER TABLE contract_user_map RENAME COLUMN staff_id to user_id;

ALTER TABLE contract_user_map ADD CONSTRAINT "FK_contract_user_map.userId" FOREIGN KEY (user_id) REFERENCES user_access(id);

create table if not exists deployment_superset_map( id bigserial NOT NULL, deployment_id bigint NOT NULL, dashboard_id bigint NOT NULL, primary key (id));

create index if not exists deployment_superset_map_deployment_id on deployment_superset_map(deployment_id);

create index if not exists deployment_superset_map_dashboard_id on deployment_superset_map(dashboard_id);

CREATE SEQUENCE IF NOT EXISTS merm_management_id_seq;
create table if not exists merm_management( id bigint not null DEFAULT nextval('merm_management_id_seq'::regclass), imei varchar(255), last_battery varchar(255), last_seen timestamp, last_opened timestamp, active boolean, deactivated_on timestamp, alarm_enabled boolean, alarm_time timestamp, refill_alarm_enabled boolean, refill_date timestamp, rt_hours bigint, hierarchy_mapping bigint, lid_feedback bigint, current_status varchar(50), primary key (id));

UPDATE trigger SET time_related = false WHERE time_related IS NULL;

UPDATE trigger SET mandatory = false WHERE mandatory IS NULL;

UPDATE trigger SET active = false WHERE active IS NULL;

ALTER TABLE trigger ALTER COLUMN time_related SET DATA TYPE BOOLEAN USING time_related::boolean;
ALTER TABLE trigger ALTER COLUMN time_related SET NOT NULL;
ALTER TABLE trigger ALTER COLUMN mandatory SET DATA TYPE BOOLEAN USING mandatory::boolean;
ALTER TABLE trigger ALTER COLUMN mandatory SET NOT NULL;
ALTER TABLE trigger ALTER COLUMN active SET DATA TYPE BOOLEAN USING active::boolean;
ALTER TABLE trigger ALTER COLUMN active SET NOT NULL;

ALTER TABLE appointment_staff_map ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE appointment_staff_map ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE associations_master ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE associations_master ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE client ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE client ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE config ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE contract_hierarchy_map ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE contract_hierarchy_map ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE contract_user_map ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deployment ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deployment ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deployment_superset_map ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deployment_superset_map ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deployment_task_list ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deployment_task_list ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE hierarchy_config_map ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE hierarchy_config_map ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE merm_management ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE merm_management ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE sidebar_item ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE sidebar_item ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE sidebar_permission ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE sidebar_permission ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE trigger ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE trigger ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE user_access ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE user_access ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE vendor_mapping ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE vendor_mapping ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE;