create table hierarchy_benefit_status (id  bigserial not null, hierarchyId int4 not null, lastBenefitGeneratedAt timestamp, schemeCode varchar(255), primary key (id));
create table hierarchy_benefit_status_AUD (id int8 not null, REV int4 not null, REVTYPE int2, hierarchyId int4, lastBenefitGeneratedAt timestamp, schemeCode varchar(255), primary key (id, REV));
create table REVINFO (REV int4 not null, REVTSTMP int8, primary key (REV));
create table x_client (id  bigserial not null, EventFlowId int8, createdDate timestamp, name varchar(255), password varchar(255), primary key (id));
create sequence hibernate_sequence start 1 increment 1;
alter table hierarchy_benefit_status_AUD add constraint FKpf3af228kiou8sicf1idctil1 foreign key (REV) references REVINFO;