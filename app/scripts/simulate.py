from app.utils.Logger import Logger
from app.utils.Utils import shell_exec_with_immediate_output
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
    state_data = nikshay_helper.create_tu(all_india_token)
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_tu_sidebar_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPfmsAgency'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating PFMS Agency')
    state_data = nikshay_helper.create_pfms_agency(all_india_token)
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshayPHI'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating PHI')
    state_data = nikshay_helper.create_phi(all_india_token)
    Logger.info('simulate', 'Adding sidebar permissions')
    registry_helper.add_phi_sidebar_permissions()
    Logger.info('simulate', 'Adding patient tab permissions')
    registry_helper.add_phi_patient_tab_permissions()
    Logger.info('simulate', '-------------------------------------------')

if starting_version <= version_map['NikshaySingleClinic'] <= ending_version:
    Logger.info('simulate', 'Generating all india token')
    all_india_token = nikshay_helper.get_token('india-all', 'Test@123')
    Logger.info('simulate', 'Creating Single clinic')
    state_data = nikshay_helper.create_single_clinic(all_india_token)
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


