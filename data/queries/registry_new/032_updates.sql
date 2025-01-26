CREATE INDEX if not exists idx_merm_management ON merm_management (active, current_status, hierarchy_mapping);

CREATE TABLE IF NOT EXISTS staff_aud( id BIGINT NOT NULL, rev INTEGER NOT NULL, revtype SMALLINT, client_id BIGINT, person_id BIGINT, designation TEXT, added_by BIGINT, selective_episode_mapping BOOLEAN, active BOOLEAN, added_on timestamp, last_updated_on timestamp, visible BOOLEAN, PRIMARY KEY (id, rev));

CREATE TABLE IF NOT EXISTS user_access_aud( id BIGINT NOT NULL, rev INTEGER NOT NULL, revtype SMALLINT, active BOOLEAN, hierarchy_id BIGINT, selective_hierarchy_mapping BOOLEAN, sso_id BIGINT, username VARCHAR(255), client_id BIGINT, staff_id BIGINT, description VARCHAR(1000), view_only BOOLEAN, visible BOOLEAN, can_delete_patients BOOLEAN, restricted_view BOOLEAN, created_at timestamp, updated_at timestamp, PRIMARY KEY (id, rev));

