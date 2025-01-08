create table if not exists line_list_item( id serial not null constraint line_list_item_pkey primary key, episode_id bigint, type varchar(255), order_identifier smallint, relation_id int, value text, created_on timestamp, updated_on timestamp);
create index if not exists line_list_item_index on line_list_item (episode_id, order_identifier, relation_id);
