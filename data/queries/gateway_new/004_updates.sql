ALTER TABLE event_client ADD if not exists  active boolean NOT NULL DEFAULT(true);

ALTER TABLE client ADD COLUMN if not exists accessible_client bigint;
ALTER TABLE client ADD COLUMN if not exists ip varchar(255);

