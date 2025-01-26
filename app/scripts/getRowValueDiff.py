import os
import json
from datetime import datetime
from app.scripts.commonDefinitions import APP_PATH
import re

buffer_in_minutes = 60 * 2

date_time_fields = {
    'adherence_new': {
        'iam_caccess': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'iam_registration': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'end_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'dbt_new': {
        'config': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'scheme': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'scheme_config_map': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'x_client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'diagnostics_new': {
        'client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'microscopy_zn': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'sample': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'test_request': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'test_result': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'test_result_mapping': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'test_result_mapping_sample': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'test_type': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'dispensation_new': {
        'ds_client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'gateway_new': {
        'client': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'event': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'subscriber_url': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'hub_new': {
        '_UserAccess': {
            'addedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastlogin': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'passwordlastrefreshedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'ins_new': {
        'ins_client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'ins_sms_logs': {
            'added_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'nikshay_new': {
        '_ArchiveLog': {
            'modifieddate': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_AuditLog': {
            'oldvalue': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': [
                    {
                        'propertyname': 'AddedOn',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'AddedTimestamp',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'CreatedAt',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'LastUpdatedManuallyAt',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'LastUpdatedOn',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'PasswordLastRefreshedOn',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'SeededAt',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'UpdatedAt',
                        'format': 'd-m-Y H:i:s'
                    }
                ]
            },
            'newvalue': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': [
                    {
                        'propertyname': 'AddedOn',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'AddedTimestamp',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'CreatedAt',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'LastUpdatedManuallyAt',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'LastUpdatedOn',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'PasswordLastRefreshedOn',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'SeededAt',
                        'format': 'd-m-Y H:i:s'
                    },
                    {
                        'propertyname': 'UpdatedAt',
                        'format': 'd-m-Y H:i:s'
                    }
                ]
            },
            'utctimestamp': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_BankPfms': {
            'addedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_Beneficiary': {
            'createdat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastupdatedmanuallyat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'seededat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_BeneficiaryBatch': {
            'lastupdatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'requestmessagedatetime': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'uploadedtopfmsat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_BeneficiaryRequest': {
            'createdat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastupdatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_Benefit': {
            'createdat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastupdatedmanuallyat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
        },
        '_BenefitsBatch': {
            'ackmessagedatetime': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'ackreadat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'createdat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastupdatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'requestmessagedatetime': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'uploadedtopfmsat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_BenefitTransaction': {
            'createdat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'creditdate': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastupdatedat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_DiagnosticsSample': {
            'addedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_FieldStaff': {
            'addedtimestamp': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_PatientFieldStaffMap': {
            'addedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_PfmsAgency': {
            'createdat': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_TestResult': {
            'addedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastupdatedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        '_UserAccess': {
            'addedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'lastlogin': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'passwordlastrefreshedon': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'registry_new': {
        'client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'config': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'deployment_disease_map': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'deployment_language_map': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'hierarchy': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'hierarchy_associations': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'hierarchy_aud': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'hierarchy_config_map': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'staff': {
            'added_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'last_updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'user_access': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'user_access_hierarchy_map': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'vendor_mapping': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'sso_new': {
        'client_token_entity': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'sso_user': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'password_last_updated': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'transition_new': {
        'client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'last_activity_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode_association': {
            'created_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode_hierarchy_linkage': {
            'created_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode_log': {
            'added_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'date_of_action': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode_stage': {
            'created_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'end_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'start_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode_stage_data': {
            'created_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'episode_tag': {
            'added_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_on': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'treatment_outcome_mapping': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    },
    'user_service_new': {
        'user_client': {
            'created_date': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'user_emails': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'stopped_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'user_mobiles': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'stopped_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        },
        'users': {
            'created_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'deleted_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            },
            'updated_at': {
                'format': '%Y-%m-%d %H:%M:%S',
                'additionalData': []
            }
        }
    }
}

timestamp_fields = {
    'adherence_new': {
        'iam_access': {
            'next_refresh': {
                'multiplier': 1000
            }
        }
    },
    'registry_new': {
        'revinfo': {
            'revstmp': {
                'multiplier': 1
            }
        }
    },
    'sso_new': {
        'client_token_entity': {
            'next_refresh': {
                'multiplier': 1000
            }
        }
    }
}

json_fields = {
    'nikshay_new': {
        '_BeneficiaryBatch': {
            'responses': {
                'additionalData': {
                    'MessageDateTime': {
                        'type': 'date_time',
                        'format': '%Y-%m-%d %H:%M:%S'
                    },
                    'ReadAt': {
                        'type': 'date_time',
                        'format': '%Y-%m-%d %H:%M:%S'
                    }
                }
            }
        },
        '_Benefit': {
            'log': {
                'additionalData': {
                    'Timestamp': {
                        'type': 'date_time',
                        'format': '%Y-%m-%dT%H:%M:%S'
                    },
                    'timestamp': {
                        'type': 'date_time',
                        'format': '%Y-%m-%d %H:%M:%S'
                    }
                }
            }
        },
        '_BenefitsBatch': {
            'responses': {
                'additionalData': {
                    'MessageDateTime': {
                        'type': 'date_time',
                        'format': '%Y-%m-%d %H:%M:%S'
                    },
                    'ReadAt': {
                        'type': 'date_time',
                        'format': '%Y-%m-%d %H:%M:%S'
                    }
                }
            }
        },
    },
    'registry_new': {
        'hierarchy_associations': {
            'value': {
                'additionalData': {
                    'UpdatedDate': {
                        'type': 'date_time',
                        'format': '%Y-%m-%d %H:%M:%S'
                    }
                }
            }
        }
    }
}

static_fields = {
    'nikshay_new': {
        '_AuditLog': {
            'newvalue': {
                'values': [],
                'additionalData': [
                    {
                        'values': [
                            'salt'
                        ],
                        'propertyname': 'Salt'
                    },
                    {
                        'values': [
                            'fZ9DjgjBHlx5PzKM9SduSnjsVTndYy9JkqzvuKOIbhw='
                        ],
                        'propertyname': 'Hash'
                    }
                ]
            }
        },
        '_UserAccess': {
            'hash': {
                'values': [
                    'fZ9DjgjBHlx5PzKM9SduSnjsVTndYy9JkqzvuKOIbhw='
                ],
                'additionalData': []
            },
            'salt': {
                'values': [
                    'salt'
                ],
                'additionalData': []
            }
        }
    },
    'sso_new': {
        'sso_user': {
            'password': {
                'values': [
                    '7d9f438e08c11e5c793f328cf5276e4a78ec5539dd632f4992acefb8a3886e1c',
                    'ea32961dbd579ef5697c367f9267921ee07f14d77fb2d4fb9500d4221d615695'
                ],
                'additionalData': []
            },
            'salt': {
                'values': [
                    'salt'
                ],
                'additionalData': []
            }
        }
    }
}

otp_fields = {
    'ins_new': {
        'ins_sms_logs': {
            'message': {
                'additionalData': {
                    'regex': [
                        r"(.*) is the OTP for - Add Field Staff under (.*) . Treat this as confidential. Do not share the OTP with anyone for security reasons. CTD -MoHFW www.nikshay.in",
                        r"(.*) is the OTP for - DBT Checker Approval for benefit . Treat this as confidential. Do not share the OTP with anyone for security reasons. CTD -MoHFW www.nikshay.in",
                        r"(.*) is the OTP for - Approval of Private Provider Beneficiaries . Treat this as confidential. Do not share the OTP with anyone for security reasons. CTD -MoHFW www.nikshay.in"
                    ]
                }
            }
        }
    }
}

id_columns = {
    'nikshay_new': {
        '_BenefitsBatch': 'requestuniquemessageid'
    }
}


def compare_datetime(old_value, new_value, date_format):
    global buffer_in_minutes

    if old_value is not None and new_value is not None:
        old_value = old_value.split('.')[0] if '.' in old_value else old_value
        new_value = new_value.split('.')[0] if '.' in new_value else new_value

        try:
            old_dt = datetime.strptime(old_value, date_format)
        except Exception as e:
            old_dt = None

        try:
            new_dt = datetime.strptime(new_value, date_format)
        except Exception as e:
            new_dt = None

        if old_dt is not None and new_dt is not None:
            diff_minutes = abs((new_dt - old_dt).total_seconds())
            return diff_minutes > buffer_in_minutes * 60
        elif old_dt is None and new_dt is None:
            return False
        else:
            return True

    elif old_value is None and new_value is None:
        return False
    else:
        return True

def compare_static_field(new_value, static_values):
    return new_value not in static_values

def compare_json(database_name, table_name, column, old_json_string, new_json_string):
    global json_fields

    if (old_json_string is None or new_json_string is None) and (old_json_string != new_json_string):
        return True

    old_json = json.loads(old_json_string)
    new_json = json.loads(new_json_string)

    additional_fields = json_fields[database_name][table_name][column]['additionalData']
    old_json_list = [old_json] if not isinstance(old_json, list) else old_json
    new_json_list = [new_json] if not isinstance(new_json, list) else new_json

    for index, old_item in enumerate(old_json_list):
        new_item = new_json_list[index]
        for key, old_value in old_item.items():
            if key not in new_item:
                return True
            new_value = new_item[key]
            if key in additional_fields:
                field_data = additional_fields[key]
                if field_data['type'] == 'date_time':
                    date_format = field_data['format']
                    if compare_datetime(old_value, new_value, date_format):
                        return True
            elif old_value != new_value:
                return True
    return False

def is_static_field(database_name, table_name, column, old_value, new_value, old_row, static_values):
    global static_fields

    static_field = False

    if database_name in static_fields and table_name in static_fields[database_name] and column in static_fields[database_name][table_name]:
        static_field = True
        additional_fields = static_fields[database_name][table_name][column]['additionalData']
        static_values[0] = static_fields[database_name][table_name][column]['values']
        if additional_fields:
            static_field = False
            for additional_field in additional_fields:
                static_check_for_field = True
                for key, value in additional_field.items():
                    if key in ['values']:
                        static_check_for_field = static_check_for_field and old_row[key] == value

                if static_check_for_field:
                    static_values = additional_field['values']
                    static_field = True
                    break

    return static_field

def compare_otp_field(new_value):
    return False

def is_date_time_field(database_name, table_name, column, old_value, new_value, old_row, format_ref):
    global date_time_fields

    if database_name in date_time_fields and \
       table_name in date_time_fields[database_name] and \
       column in date_time_fields[database_name][table_name]:
        field_data = date_time_fields[database_name][table_name][column]
        format_ref[0] = field_data['format']
        return True

    return False

def is_json_field(database_name, table_name, column, old_value, new_value):
    global json_fields

    if database_name in json_fields and table_name in json_fields[database_name] and column in json_fields[database_name][table_name]:
        additional_data = json_fields[database_name][table_name][column]['additionalData']
        for key in additional_data.keys():
            if (old_value and key in old_value) or (new_value and key in new_value):
                return True
    return False

def is_otp_field(database_name, table_name, column, old_value, new_value, old_row):
    global otp_fields

    otp_field = False

    if database_name in otp_fields and table_name in otp_fields[database_name] and column in otp_fields[database_name][table_name]:
        additional_fields = otp_fields[database_name][table_name][column]['additionalData']
        regex_list = additional_fields['regex']
        for regex in regex_list:
            matches = re.findall(regex, new_value)
            otp_field = len(matches) >= 1
            if otp_field:
                break

    return otp_field

def compare(database_name, table_name, column, old_value, new_value, old_row):
    global timestamp_fields

    different_values = old_value != new_value
    format_ref = ['']
    static_values = ['']

    if is_date_time_field(database_name, table_name, column, old_value, new_value, old_row, format_ref):
        different_values = compare_datetime(old_value, new_value, format_ref[0])
    elif database_name in timestamp_fields and \
         table_name in timestamp_fields[database_name] and \
         column in timestamp_fields[database_name][table_name]:
        field_data = timestamp_fields[database_name][table_name][column]
        multiplier = field_data['multiplier']
        diff_minutes = abs((int(new_value) - int(old_value)) / (60 * multiplier))
        different_values = diff_minutes > buffer_in_minutes
    elif is_json_field(database_name, table_name, column, old_value, new_value):
        different_values = compare_json(database_name, table_name, column, old_value, new_value)
    elif is_static_field(database_name, table_name, column, old_value, new_value, old_row, static_values):
        different_values = compare_static_field(new_value, static_values[0])
    elif is_otp_field(database_name, table_name, column, old_value, new_value, old_row):
        different_values = compare_otp_field(new_value)
    return different_values

directory_path = os.path.join(APP_PATH, 'data', 'rowValues')
files = sorted(os.listdir(directory_path), key=lambda f: int(''.join(filter(str.isdigit, f))))

if len(files) > 1:
    new_values_file_path = os.path.join(directory_path, files[-1])
    old_values_file_path = os.path.join(directory_path, files[-2])

    with open(new_values_file_path, 'r') as f:
        new_values_data = json.load(f)
    with open(old_values_file_path, 'r') as f:
        old_values_data = json.load(f)

    diff = {}

    for database_name, table_values in old_values_data.items():
        database_diff = {}

        for table_name, old_values in table_values.items():
            table_diff = {}

            if old_values:
                id_column = id_columns.get(database_name, {}).get(table_name, 'id')
                old_values_by_id = {row[id_column]: row for row in old_values}
                new_values_by_id = {row[id_column]: row for row in new_values_data[database_name][table_name]}

                for old_row in old_values:
                    id_value = old_row[id_column]

                    if id_value not in new_values_by_id:
                        table_diff[id_value] = ["Deleted"]
                    else:
                        row_diff = []
                        new_row = new_values_by_id[id_value]

                        for column, old_value in old_row.items():
                            new_value = new_row.get(column)
                            if compare(database_name, table_name, column, old_value, new_value, old_row):
                                row_diff.append({
                                    'column': column,
                                    'oldValue': old_value,
                                    'newValue': new_value
                                })
                        if row_diff:
                            table_diff[id_value] = row_diff

            if table_diff:
                database_diff[table_name] = table_diff

        if database_diff:
            diff[database_name] = database_diff

    output_file_path = os.path.join(APP_PATH, 'data', 'rowValueDiff.json')
    with open(output_file_path, 'w') as f:
            json.dump(diff, f, indent=4)
