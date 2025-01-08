CREATE INDEX IF NOT EXISTS primary_user_idx ON episode_notification (((extras ->> 'primaryUserId')::int));

ALTER TABLE episode_notification DROP CONSTRAINT if EXISTS fkgaq8w0vyrialwklt3v3lewsxm;