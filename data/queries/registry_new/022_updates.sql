ALTER TABLE contracts ADD COLUMN IF NOT EXISTS last_kpi_inspection_date TIMESTAMP;

UPDATE field SET config = null WHERE field_name = 'resultSampleId';
