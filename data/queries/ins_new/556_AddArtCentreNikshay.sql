INSERT INTO ins_sms_logs (added_on, api_response, entity_id, message, message_id, phone_number, status, template_id, trigger_id, vendor_id) VALUES ('UTC_DATE_TIME_PLUS_15_MINUTE_WITH_MICRO_SECONDS', 'TEST', '0', 'Your Username is phi-KADHA01-014. Use the Id and the password you set while registering, to login to Nikshay platform. CTD-MoHFW www.nikshay.in', 'TEST', '9999999974', null, (SELECT id FROM ins_template WHERE content = 'Your Username is %(user). Use the Id and the password you set while registering, to login to Nikshay platform. CTD-MoHFW www.nikshay.in'), (SELECT id FROM ins_trigger WHERE trigger_name = 'Username New Facility'), (SELECT id FROM ins_vendor WHERE gateway = 'PLIVO'));