INSERT INTO ds_product_inventory (product_id, batch_number, expiry_date) VALUES ((SELECT id FROM ds_product WHERE product_name = 'My Drug'), 'BA1234', 'DATE_TIME_PLUS_730_DAY');
INSERT INTO ds_product_inventory_hierarchy_mapping (inventory_id, hierarchy_mapping_id, client_id, available_quantity, last_updated_by, last_updated_at) VALUES ((SELECT id FROM ds_product_inventory WHERE product_id = (SELECT id FROM ds_product WHERE product_name = 'My Drug') AND batch_number = 'BA1234'), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = 5), (SELECT id FROM ds_client WHERE name = 'Nikshay'), 100, (SELECT id FROM foreign_user_access WHERE user_name = 'dispensation-client'), 'UTC_DATE_TIME_PLUS_22_MINUTE');
INSERT INTO ds_product_inventory_log (transaction_type, transaction_id, transaction_quantity, comment_type, comment, date_of_action, p_inventory_id, product_id, transaction_id_type, updated_by) VALUES ((SELECT id FROM foreign_dispensation_transaction_type WHERE name = 'CREDIT'), 1234567890123, 100, (SELECT id FROM foreign_dispensation_comment_type WHERE name = 'REASON_FOR_CREDIT'), 'Credit from external vendor', 'UTC_DATE_TIME_PLUS_22_MINUTE', (SELECT id FROM ds_product_inventory WHERE product_id = (SELECT id FROM ds_product WHERE product_name = 'My Drug') AND batch_number = 'BA1234'), (SELECT id FROM ds_product WHERE product_name = 'My Drug'), (SELECT id FROM foreign_dispensation_transaction_id_type WHERE name = 'EXTERNAL'), (SELECT id FROM foreign_data_gateway_client WHERE user_name = 'dispensation-client'));