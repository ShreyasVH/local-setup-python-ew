alter table if exists test_type add column sample_supported BOOLEAN DEFAULT FALSE not null;
UPDATE test_type SET sample_supported = true WHERE name in ('Microscopy ZN', 'Microscopy Fluorescent', 'Truenat (MTB)', 'Truenat (MTB-RIF)', 'CBNAAT', 'Culture', 'FLLPA', 'SLLPA', 'DST', 'Pathodetect - MTB, Rif & Inh');

