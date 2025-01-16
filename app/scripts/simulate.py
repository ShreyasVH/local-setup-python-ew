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
    'NIkshayAddSystemIdentifiedDuplicatePatient': 583,
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
