ALTER TABLE field ADD COLUMN IF NOT EXISTS type varchar(255);

UPDATE field set type = 'String';