alter table if exists ins_pn_template add column episode_notification boolean;
alter table if exists ins_pn_template add column type varchar(255);
alter table if exists episode_notification add constraint FKgaq8w0vyrialwklt3v3lewsxm foreign key (pn_log_id) references ins_pn_logs;
alter table if exists ins_pn_logs add constraint FKr5b87y51f7k39x6dtaq95gjae foreign key (template_id) references ins_pn_template;