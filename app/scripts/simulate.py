from app.utils.Logger import Logger
from app.utils.Utils import shell_exec_with_immediate_output, replace_time_strings
from app.helpers.FileHelper import FileHelper
from app.scripts.commonDefinitions import APP_PATH
import os
import sys
import subprocess
from app.helpers.NikshayHelper import NikshayHelper
from app.helpers.RegistryHelper import RegistryHelper
from app.helpers.DbtHelper import DbtHelper
from app.helpers.RedisHelper import RedisHelper
from app.helpers.EpisodeHelper import EpisodeHelper
from app.helpers.IamHelper import IamHelper
import json
from datetime import datetime

if len(sys.argv) > 2:
    starting_version = int(sys.argv[1])
    ending_version = int(sys.argv[2])
else:
    print("Usage: python3 app/scripts/simulate.py <starting_version> <ending_version>")
    sys.exit(1)

version_map = {
    'NikshayState': 535,
    'NikshayDistrict': 536,
    'NikshayTU': 537,
    'NikshayPfmsAgency': 538,
    'NikshayPHI': 539,
    'NikshaySingleClinic': 540,
    'NikshayMultiClinic': 541,
    'NikshayPrivateLab': 542,
    'NikshayPrivateChemist': 543,
    'NikshayDmcLab': 544,
    'NikshayTruenatLab': 545,
    'NikshayCbnaatLab': 546,
    'NikshayXrayLab': 547,
    'NikshayIctcLab': 548,
    'NikshayCdstLab': 549,
    'NikshayDmScreeningLab': 550,
    'NikshayTobaccoClinic': 551,
    'NikshayAncClinic': 552,
    'NikshayNutritionalCentre': 553,
    'NikshayDeAddictionCentre': 554,
    'NikshayPrison': 555,
    'NikshayArtCentre': 556,
    'NikshayDrugStore': 557,
    'NikshayMedicalCollege': 558,
    'NikshayNuhmFacility': 559,
    'NikshayDistrictDrtb': 560,
    'NikshayNodalDrtb': 561,
    'NikshayIrl': 562,
    'NikshayNgo': 563,
    'NikshayPediatricFacility': 564,
    'NikshayCghs': 565,
    'NikshayWellnessCentre': 566,
    'NikshayMicroscopyServiceLab': 567,
    'NikshayTribalTU': 568,
    'NikshayPfmsAgencyTribal': 569,
    'NikshayTribalPhi': 570,
    'NikshayDBTChecker': 571,
    'NikshayDBTMaker': 572,
    'NikshayDBTMakerTribal': 573,
    'NikshayAddPublicPatient': 574,
    'NikshayAddPrivatePatient': 575,
    'NikshayAddDiagnosedNotOnTreatmentPublic': 576,
    'NikshayAddDiagnosedNotOnTreatmentPrivate': 577,
    'NikshayAddDiagnosedOnTreatmentPublic': 578,
    'NikshayAddDiagnosedOnTreatmentPrivate': 579,
    'NikshayAddDiagnosedOutcomeAssignedPublic': 580,
    'NikshayAddDiagnosedOutcomeAssignedPrivate': 581,
    'NikshayAddDirectTreatmentPrivate': 582,
    'NikshayAddSystemIdentifiedDuplicatePatient': 583,
    'NikshayAddUserConfirmedDuplicatePatient': 584,
    'NikshayAddUserConfirmedUniquePatient': 585,
    'NikshayAddVaccinationFollowupOnePatient': 586,
    'NikshayAddVaccinationFollowupTwoPatient': 587,
    'NikshayAddVaccinationFollowupThreePatient': 588,
    'NikshayAddVaccinationFollowupFourPatient': 589,
    'NikshayAddVaccinationFollowupFivePatient': 590,
    'NikshayAddVaccinationFollowupSixPatient': 591,
    'NikshayAddVaccinationFollowupSevenPatient': 592,
    'NikshayAddVaccinationFollowupEightPatient': 593,
    'NikshayAddVaccinationFollowupNinePatient': 594,
    'NikshayAddVaccinationFollowupTenPatient': 595,
    'NikshayAddVaccinationFollowupElevenPatient': 596,
    'NikshayAddVaccinationFollowupTwelvePatient': 597,
    'NikshayAddVaccinationFollowupThirteenPatient': 598,
    'NikshayAddVaccinationFollowupFourteenPatient': 599,
    'NikshayAddNSOldBenefit': 600,
    'NikshayAddNSV2Benefit': 601,
    'NikshayAddTSBenefit': 602,
    'NikshayPSNInformantBenefitPrivatePatient': 603,
    'NikshayInformantBenefit': 604
}

nikshay_helper = NikshayHelper()
registry_helper = RegistryHelper()
dbt_helper = DbtHelper()
redis_helper = RedisHelper()
episode_helper = EpisodeHelper()
iam_helper = IamHelper()

if starting_version <= version_map['NikshayState'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating state')
    state_data = nikshay_helper.create_state(all_india_token)
    nikshay_helper.update_state_type_of_staff_allowed_to_add()
    Logger.info('simulate', 'Adding associations')
    registry_helper.add_state_associations()
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_state_sidebar_permissions()
    Logger.info('simulate', 'Adding configs')
    registry_helper.add_state_configs()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDistrict'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating district')
    state_data = nikshay_helper.create_district(all_india_token)
    Logger.info('simulate', 'Adding associations')
    registry_helper.add_district_associations()
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_district_sidebar_permissions()
    Logger.info('simulate', 'Adding patient tab permissions')
    registry_helper.add_district_patient_tab_permissions()
    Logger.info('simulate', 'Adding configs')
    registry_helper.add_district_configs()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayTU'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating TU')
    state_data = nikshay_helper.create_tu(all_india_token, {
        'name': 'tu',
        'mobile': '9999999994',
        'email': 'mail.three@gmail.com',
        'secondaryMobile1': '9999999993',
        'secondaryMobile2': '9999999992'
    })
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_tu_sidebar_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPfmsAgency'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating PFMS Agency')
    state_data = nikshay_helper.create_pfms_agency(all_india_token, {
        'name': 'Agency Name',
        'code': 'AGC',
        'tuName': 'tu'
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPHI'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating PHI')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'phi',
        'mobile': '9999999991',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "DmcNin": "",
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "MobileNo": "9999999991",
            "Address": "address",
            "FacilityType": "PHI",
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_phi_sidebar_permissions()
    Logger.info('simulate', 'Adding patient tab permissions')
    registry_helper.add_phi_patient_tab_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshaySingleClinic'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Single clinic')
    state_data = nikshay_helper.create_single_clinic(all_india_token, {
        'name': 'single clinic',
        'mobile': '9999999990',
        'extraData': json.dumps({
            "DmcNin": "",
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "MobileNo": "9999999990",
            "Address": "address",
            "FacilityType": "SINGLE",
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        }),
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4)
    })
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_single_clinic_sidebar_permissions()
    Logger.info('simulate', 'Adding patient tab permissions')
    registry_helper.add_single_clinic_patient_tab_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayMultiClinic'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Multi clinic')
    state_data = nikshay_helper.create_multi_clinic(all_india_token)
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayMultiClinic'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Multi clinic')
    state_data = nikshay_helper.create_multi_clinic(all_india_token)
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPrivateLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Private Lab')
    state_data = nikshay_helper.create_private_lab(all_india_token)
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_private_lab_sidebar_permissions()
    Logger.info('simulate', 'Adding patient tab permissions')
    registry_helper.add_private_lab_patient_tab_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPrivateChemist'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Private Chemist')
    state_data = nikshay_helper.create_private_chemist(all_india_token)
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_private_chemist_sidebar_permissions()
    Logger.info('simulate', 'Adding patient tab permissions')
    registry_helper.add_private_chemist_patient_tab_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDmcLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Dmc Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'dmc lab',
        'mobile': '9999999986',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": True,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999986",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayTruenatLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating truenat Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'truenat lab',
        'mobile': '9999999985',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": True,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999985",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayCbnaatLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating cbnaat Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'cbnaat lab',
        'mobile': '9999999984',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": True,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999984",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayXrayLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating xray Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'xray lab',
        'mobile': '9999999983',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": True,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999983",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayIctcLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating ictc Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'ictc lab',
        'mobile': '9999999982',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": True,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999982",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayCdstLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating cdst Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'cdst lab',
        'mobile': '9999999981',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": True,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999981",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDmScreeningLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating dm screening Lab')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'dm screening lab',
        'mobile': '9999999980',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": True,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999980",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayTobaccoClinic'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating tobacco clinic')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'tobacco clinic',
        'mobile': '9999999979',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": True,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999979",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAncClinic'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating anc clinic')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'anc clinic',
        'mobile': '9999999978',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": True,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999978",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayNutritionalCentre'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating nutritional centre')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'nutritional centre',
        'mobile': '9999999977',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": True,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999977",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDeAddictionCentre'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating de addiction centre')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'de addiction centre',
        'mobile': '9999999976',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": True,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999976",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPrison'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating prison')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'prison',
        'mobile': '9999999975',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": True,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999975",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayArtCentre'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating art centre')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'art centre',
        'mobile': '9999999974',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": True,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999974",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDrugStore'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating drug store')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'drug store',
        'mobile': '9999999973',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": True,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999973",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayMedicalCollege'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating medical college')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'medical college',
        'mobile': '9999999972',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": True,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999972",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayNuhmFacility'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating nuhm facility')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'nuhm facility',
        'mobile': '9999999971',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": True,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999971",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDistrictDrtb'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating district drtb')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'drtb centre',
        'mobile': '9999999970',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": True,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999970",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayNodalDrtb'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating district drtb')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'nodal drtb',
        'mobile': '9999999969',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": True,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999969",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayIrl'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating irl')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'irl',
        'mobile': '9999999968',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": True,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999968",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayNgo'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating ngo')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'ngo',
        'mobile': '9999999967',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": True,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999967",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPediatricFacility'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating pediatric facility')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'pediatric facility',
        'mobile': '9999999966',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": True,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999966",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayCghs'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating cghs')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'cghs',
        'mobile': '9999999965',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": True,
            "IfYesCGHSCoal": "CGHS",
            "MobileNo": "9999999965",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayWellnessCentre'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating wellness centre')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'wellness centre',
        'mobile': '9999999964',
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4),
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": True,
            "PhiHealthAndWellnessCentreType": "Sub Centre (SC)",
            "PhiParentPhi": nikshay_helper.get_hierarchy_id('phi', 5),
            "PhiTuForParentPhi": nikshay_helper.get_hierarchy_id('tu', 4),
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999964",
            "Address": "address",
            "FacilityType": "PHI",
            "MicroscopyService": None,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayMicroscopyServiceLab'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating microscopy service')
    nikshay_helper.create_single_clinic(all_india_token, {
        'name': 'microscopy service lab',
        'mobile': '9999999963',
        'extraData': json.dumps({
            "Dmc": None,
            "Irl": None,
            "Cbnaat": None,
            "Ndrtb": None,
            "Ddrtb": None,
            "DmcNin": "",
            "MedicalCollege": None,
            "ArtCentre": None,
            "IctcFictc": None,
            "CdstLabIncludingLpa": None,
            "Ngo": None,
            "PediatricCareFacility": None,
            "PhiHealthAndWellnessCentre": None,
            "PhiHealthAndWellnessCentreType": None,
            "PhiParentPhi": None,
            "PhiTuForParentPhi": None,
            "IsDrugStore": None,
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "IsTruNat": None,
            "IsXray": None,
            "IsDMScreen": None,
            "IsTobaccoClinic": None,
            "IsANCClinic": None,
            "IsNutriRehabCenter": None,
            "IsDeAddictCenter": None,
            "IsPrision": None,
            "IsNUHMFacility": None,
            "IsCGHSCoal": None,
            "IfYesCGHSCoal": None,
            "MobileNo": "9999999963",
            "Address": "address",
            "FacilityType": "SINGLE",
            "MicroscopyService": True,
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        }),
        'parentId': nikshay_helper.get_hierarchy_id('tu', 4)
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayTribalTU'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating tribal TU')
    state_data = nikshay_helper.create_tu(all_india_token, {
        'name': 'tuTribal',
        'mobile': '9999999945',
        'email': 'mail.four@gmail.com',
        'secondaryMobile1': '9999999944',
        'secondaryMobile2': '9999999943'
    })
    Logger.info('simulate', 'Adding associations')
    registry_helper.add_hierarchy_associations(nikshay_helper.get_hierarchy_id('tuTribal', 4), {
        'isTribal': 'true'
    }, registry_helper.get_token(registry_helper.get_client_id()))
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPfmsAgencyTribal'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating PFMS Agency')
    state_data = nikshay_helper.create_pfms_agency(all_india_token, {
        'name': 'Tribal Agency',
        'code': 'TGC',
        'tuName': 'tuTribal'
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayTribalPhi'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating PHI Tribal')
    state_data = nikshay_helper.create_phi(all_india_token, {
        'name': 'tribal phi',
        'mobile': '9999999941',
        'parentId': nikshay_helper.get_hierarchy_id('tuTribal', 4),
        'extraData': json.dumps({
            "DmcNin": "",
            "HFRegNo": "",
            "ContactPersonName": "",
            "ContactPersonDesg": "",
            "ContactPersonEmail": "",
            "MobileNo": "9999999941",
            "Address": "address",
            "FacilityType": "PHI",
            "IsAfterLogin": True,
            "UpdatedBy": "india-all",
            "UpdatedDate": replace_time_strings('DATE_TIME_PLUS_0_DAY')
        })
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDBTChecker'] <= ending_version:
    Logger.info('simulate', 'Generating state token')
    state_token = nikshay_helper.get_token('sto-ka', 'Test@123')
    Logger.info('simulate', 'Creating DBT Checker')
    state_data = nikshay_helper.add_dbt_checker(state_token, {
        'hierarchyName': 'Dharwad',
        'mobile': '9999999947',
        'name': 'DBT Checker'
    })
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_dbt_checker_sidebar_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDBTMaker'] <= ending_version:
    Logger.info('simulate', 'Generating district token')
    district_token = nikshay_helper.get_token('dto-kadha', 'Test@123')
    Logger.info('simulate', 'Creating DBT Maker')
    state_data = nikshay_helper.add_dbt_maker(district_token, {
        'hierarchyName': 'tu',
        'mobile': '9999999938',
        'name': 'DBT Maker'
    })
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_dbt_maker_sidebar_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayDBTMakerTribal'] <= ending_version:
    Logger.info('simulate', 'Generating district token')
    district_token = nikshay_helper.get_token('dto-kadha', 'Test@123')
    Logger.info('simulate', 'Creating DBT Maker')
    state_data = nikshay_helper.add_dbt_maker(district_token, {
        'hierarchyName': 'tuTribal',
        'mobile': '9999999934',
        'name': 'DBT Maker Tribal'
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddPublicPatient'] <= ending_version:
    Logger.info('simulate', 'Creating public patient')
    Logger.info('simulate', 'Generating phi token')
    token = nikshay_helper.get_token('phi-kadha01-001', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPublic',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': 'Public',
        'lastName': 'Patient',
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999961,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': 'phi',
        'residenceHierarchyName': 'phi',
        'residenceHierarchyLevel': 5
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddPrivatePatient'] <= ending_version:
    Logger.info('simulate', 'Creating private patient')
    Logger.info('simulate', 'Generating single clinic token')
    token = nikshay_helper.get_token('6', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPrivate',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': 'Private',
        'lastName': 'Patient',
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999960,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': 'single clinic',
        'residenceHierarchyName': 'single clinic',
        'residenceHierarchyLevel': 5
    })
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDiagnosedNotOnTreatmentPublic'] <= ending_version:
    Logger.info('simulate', 'Creating diagnosed not on treatment patient')
    Logger.info('simulate', 'Generating phi token')
    token = nikshay_helper.get_token('phi-kadha01-001', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Diagnosed'
    last_name = 'Not on Treatment Public'
    facility_name = 'phi'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPublic',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999959,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    Logger.info('verify', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_helper.get_episode_id(first_name, last_name)
    })

    Logger.info('verify', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('verify', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')
    
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDiagnosedNotOnTreatmentPrivate'] <= ending_version:
    Logger.info('simulate', 'Creating diagnosed not on treatment private patient')
    Logger.info('simulate', 'Generating single clinic token')
    token = nikshay_helper.get_token('6', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Diagnosed'
    last_name = 'Not on Treatment Private'
    facility_name = 'single clinic'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPrivate',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999958,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    Logger.info('verify', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_helper.get_episode_id(first_name, last_name)
    })

    Logger.info('verify', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('verify', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDiagnosedOnTreatmentPublic'] <= ending_version:
    Logger.info('simulate', 'Creating on treatment public patient')
    Logger.info('simulate', 'Generating phi token')
    token = nikshay_helper.get_token('phi-kadha01-001', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Diagnosed'
    last_name = 'On Treatment Public'
    facility_name = 'phi'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPublic',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999957,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_id
    })

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPublic'
    })

    Logger.info('simulate', 'Getting adherence')
    iam_helper.get_adherence('Nikshay', episode_id)

    Logger.info('simulate', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('simulate', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDiagnosedOnTreatmentPrivate'] <= ending_version:
    Logger.info('simulate', 'Creating on treatment private patient')
    Logger.info('simulate', 'Generating single clinic token')
    token = nikshay_helper.get_token('6', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Diagnosed'
    last_name = 'On Treatment Private'
    facility_name = 'single clinic'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPrivate',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999956,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_id
    })

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPrivate'
    })

    Logger.info('simulate', 'Getting adherence')
    iam_helper.get_adherence('Nikshay', episode_id)

    Logger.info('verify', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('verify', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDiagnosedOutcomeAssignedPublic'] <= ending_version:
    Logger.info('simulate', 'Creating outcome assigned public patient')
    Logger.info('simulate', 'Generating phi token')
    token = nikshay_helper.get_token('phi-kadha01-001', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Outcome'
    last_name = 'Assigned Public'
    facility_name = 'phi'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPublic',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999955,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_id
    })

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPublic'
    })

    Logger.info('simulate', 'Closing case')
    nikshay_helper.close_case(token, {
        'episodeId': episode_id,
        'treatmentOutcome': 'CURED',
        'endDate': replace_time_strings('UTC_DATE_TIME_MINUS_1_DAY_WITH_TIMEZONE_SEPARATION'),
        'stage': 'DIAGNOSED_OUTCOME_ASSIGNED'
    })

    Logger.info('simulate', 'Getting adherence')
    iam_helper.get_adherence('Nikshay', episode_id)

    Logger.info('simulate', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('simulate', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDiagnosedOnTreatmentPrivate'] <= ending_version:
    Logger.info('simulate', 'Creating outcome assigned private patient')
    Logger.info('simulate', 'Generating single clinic token')
    token = nikshay_helper.get_token('6', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Outcome'
    last_name = 'Assigned Private'
    facility_name = 'single clinic'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPrivate',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999954,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_id
    })

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPrivate'
    })

    Logger.info('simulate', 'Closing case')
    nikshay_helper.close_case(token, {
        'episodeId': episode_id,
        'treatmentOutcome': 'CURED',
        'endDate': replace_time_strings('UTC_DATE_TIME_MINUS_1_DAY_WITH_TIMEZONE_SEPARATION'),
        'stage': 'DIAGNOSED_OUTCOME_ASSIGNED'
    })

    Logger.info('simulate', 'Getting adherence')
    iam_helper.get_adherence('Nikshay', episode_id)

    Logger.info('verify', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('verify', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddDirectTreatmentPrivate'] <= ending_version:
    Logger.info('simulate', 'Creating outcome direct treatment patient')
    Logger.info('simulate', 'Generating single clinic token')
    token = nikshay_helper.get_token('6', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'Direct Treatment'
    last_name = 'Private'
    facility_name = 'single clinic'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPrivate',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999953,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPrivate'
    })

    Logger.info('simulate', 'Getting adherence')
    iam_helper.get_adherence('Nikshay', episode_id)

    Logger.info('verify', 'Initializing benefits')
    dbt_helper.initiate_v3_benefits()
    redis_helper.delete_all_keys()
    dbt_helper.delete_logs_for_benefits()
    dbt_maker_token = nikshay_helper.get_token(nikshay_helper.get_dbt_maker_user_name(facility_name, 5), 'Test@123')
    Logger.info('verify', 'Removing benefits')
    nikshay_helper.remove_benefits(dbt_maker_token, episode_helper.get_episode_id(first_name, last_name), 'NS')

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddSystemIdentifiedDuplicatePatient'] <= ending_version:
    Logger.info('simulate', 'Creating system identified duplicate patient')
    Logger.info('simulate', 'Generating phi token')
    token = nikshay_helper.get_token('phi-kadha01-001', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'System Identified'
    last_name = 'Duplicate'
    facility_name = 'phi'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPublic',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999957,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_id
    })

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPublic'
    })

    Logger.info('simulate', 'Getting adherence')
    iam_helper.get_adherence('Nikshay', episode_id)

    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayAddUserConfirmedDuplicatePatient'] <= ending_version:
    Logger.info('simulate', 'Creating user confirmed duplicate patient')
    Logger.info('simulate', 'Generating phi token')
    token = nikshay_helper.get_token('phi-kadha01-001', 'Test@123')
    Logger.info('simulate', 'Adding patient')
    first_name = 'User Confirmed'
    last_name = 'Duplicate'
    facility_name = 'phi'
    nikshay_helper.add_patient(token, {
        'typeOfEpisode': 'IndiaTbPublic',
        'enrollmentDate': 'DATE_TIME_PLUS_0_DAY_DATE_FIRST',
        'firstName': first_name,
        'lastName': last_name,
        'age': int(datetime.now().strftime('%Y')) - 2000,
        'dateOfBirth': '01-01-2000',
        'gender': 'Male',
        'mobile': 9999999957,
        'address': 'Address',
        'pincode': 999999,
        'area': 'Unknown',
        'maritalStatus': 'Unknown',
        'occupation': 'Unknown',
        'socioEconomicStatus': 'Unknown',
        'keyPopulation': 'Not Applicable',
        'symptom': 'Asymptomatic,',
        'hivStatus': 'Unknown',
        'typeOfCaseFinding': 'Passive (Routine programme)',
        'selectedHierarchyName': facility_name,
        'residenceHierarchyName': facility_name,
        'residenceHierarchyLevel': 5
    })

    episode_id = episode_helper.get_episode_id(first_name, last_name)

    Logger.info('simulate', 'Adding test')
    nikshay_helper.add_test(token, {
        'reason': 'Diagnosis of TB',
        'typeOfCase': 'New',
        'type': 'Microscopy ZN',
        'testFacilityName': 'dmc lab',
        'sampleCollectionFacilityName': facility_name,
        'sampleCollectionDate': replace_time_strings('DATE_ONLY_MINUS_4_DAY'),
        'diagnosisDate': replace_time_strings('DATE_ONLY_MINUS_3_DAY'),
        'finalInterpretation': 'Positive',
        'sampleDescription': 'Mucopurulent',
        'sampleSputumCollectionDetail': 'Early Morning',
        'sampleSpecimenType': 'Sputum',
        'episodeId': episode_id
    })

    Logger.info('simulate', 'Starting treatment')
    nikshay_helper.start_treatment(token, {
        'episodeId': episode_id,
        'typeOfTreatment': 'DSTB',
        'weight': 50,
        'height': 100,
        'testType': 'Microscopy ZN',
        'diagnosisDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_3_DAY'),
        'startDate': replace_time_strings('DATE_ONLY_YEAR_FIRST_MINUS_2_DAY'),
        'treatmentPhase': 'IP',
        'siteOfDisease': 'Pulmonary',
        'regimen': '2HRZE/4HRE',
        'hasDstbTest': 'True',
        'hasDrtbTest': None,
        'hasLtbiTest': None,
        'monitoringMethod': 'None',
        'typeOfEpisode': 'IndiaTbPublic'
    })

    Logger.info('simulate', 'Updating duplicate status')
    dto_token = nikshay_helper.get_token('dto-kadha', 'Test@123')
    nikshay_helper.update_duplicate_status(dto_token, {
        'episodeId': episode_id,
        'status': 'USER_CONFIRMED_DUPLICATE',
        'duplicateOf': episode_helper.get_episode_id('Diagnosed', 'On Treatment Public')
    })

    Logger.info('simulate', '-------------------------------------------')
