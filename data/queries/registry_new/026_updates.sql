ALTER TABLE sidebar_permission RENAME TO module_permission;
ALTER TABLE module_permission RENAME COLUMN sidebar_id TO item_id;
ALTER TABLE module_permission ADD COLUMN item_type VARCHAR;
ALTER TABLE module_permission ADD COLUMN view BOOLEAN;
ALTER TABLE module_permission ADD COLUMN add BOOLEAN;
ALTER TABLE module_permission ADD COLUMN edit BOOLEAN;
ALTER TABLE module_permission ADD COLUMN delete BOOLEAN;

alter table contracts add column if not exists deleted boolean default false;
alter table contract_hierarchy_map add column if not exists deleted boolean default false;
alter table contract_user_map add column if not exists deleted boolean default false;