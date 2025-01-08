UPDATE field_customizations SET attribute_value = REPLACE(attribute_value, 'AdherenceTechOptions', 'adherenceTechOptions') WHERE attribute_value LIKE '%AdherenceTechOptions%';

UPDATE field_dependency SET lookups = REPLACE(lookups, 'AdherenceTechOptions', 'adherenceTechOptions') WHERE lookups LIKE '%AdherenceTechOptions%';

UPDATE field_dependency SET property_and_values = REPLACE(property_and_values, 'AdherenceTechOptions', 'adherenceTechOptions') WHERE property_and_values LIKE '%AdherenceTechOptions%';

UPDATE field SET field_options = REPLACE(field_options, 'AdherenceTechOptions', 'adherenceTechOptions') WHERE field_options LIKE '%AdherenceTechOptions%';