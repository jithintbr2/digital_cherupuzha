import 'dart:convert';
import 'package:cpza/editRecordModel.dart';
import 'package:cpza/updateModel.dart';
import 'package:dio/dio.dart';
import 'package:cpza/WaterAssetDataModel.dart';
import 'package:cpza/addAgricultureDataModel.dart';
import 'package:cpza/addAnimalDataModel.dart';
import 'package:cpza/addDebitInformationModel.dart';
import 'package:cpza/addEconicDataModel.dart';
import 'package:cpza/addMemberDetailsModel.dart';
import 'package:cpza/addPiscicultureModel.dart';
import 'package:cpza/addRecordsModel.dart';
import 'package:cpza/addWaterAssetModel.dart';
import 'package:cpza/addWaterAvailableDataModel.dart';
import 'package:cpza/agricultureDetailsModel.dart';
import 'package:cpza/animalHusbandaryDetailsModel.dart';
import 'package:cpza/commonListModel.dart';
import 'package:cpza/debitInfoDataModel.dart';
import 'package:cpza/debtInformationListModel.dart';
import 'package:cpza/economicDetailListModel.dart';
import 'package:cpza/economicListModel.dart';
import 'package:cpza/familyMemberModel.dart';
import 'package:cpza/headModel.dart';
import 'package:cpza/listVillageModel.dart';
import 'package:cpza/loginModel.dart';
import 'package:cpza/memberDetails.dart';
import 'package:cpza/memberDetailsModel.dart';
import 'package:cpza/piscicultureDetailsModel.dart';
import 'package:cpza/waterAssetDetailsModel.dart';
import 'package:cpza/waterAvailabilityDetailsModel.dart';
import 'package:cpza/waterUsageAvailableDataModel.dart';

class HttpService {
  static Dio _dio = Dio();
  static final baseUrl =
      "https://login2.in/panchayath/cpza/index.php/Api/";

  //static final baseUrl = "https://login2.co.in/panchayath_survey/index.php/Api/";
  static Future forceUpdate() async {

    try {
      var result = await _dio.get(baseUrl + "app_update");
      print(result);

      UpdateModel model = UpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future login(uanemVar, pass) async {
    var params = {
      "username": uanemVar,
      "password": pass,
    };
    try {
      var result = await _dio.get(baseUrl + "login", queryParameters: params);
      print(result);

      LoginModel model = LoginModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future viewRecords(token, searchdata) async {
    var params = {
      "token": token,
      "searchKey": searchdata,
    };
    try {
      var result = await _dio.get(baseUrl + "get_master_head_data",
          queryParameters: params);
      print(result);

      HeadModel model = HeadModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future listVillage() async {
    try {
      var result = await _dio.get(baseUrl + "location_data");
      print(result);

      ListVillageModel model = ListVillageModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addRecord(mobileNumber, houseNumber, village, wardNo, token,
      lattitude, longitude,altitude) async {
    var params = {
      "mobileNumber": mobileNumber,
      "houseNumber": houseNumber,
      "villageId": village,
      "wardNumber": wardNo,
      "token": token,
      "latitude": lattitude,
      "longitude": longitude,
      "altitude": altitude
    };
    try {
      var result = await _dio.get(baseUrl + "add_member_master",
          queryParameters: params);
      print(result);

      AddRecordModel model = AddRecordModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future memberDetails(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "get_single_member_details",
          queryParameters: params);
      print(result);

      MemberDetailsModel model = MemberDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future familyMembers(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "family_member_list",
          queryParameters: params);
      print(result);
      print(params);

      FamilyMemberModel model = FamilyMemberModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future commonList() async {
    try {
      var result = await _dio.get(baseUrl + "family_member_data");
      print(result);

      CommonListModel model = CommonListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addOtherMemberDetails(
      masterHeadId,
      token,
      name,
      relation,
      age,
      gender,
      education,
      occupation,
      currentResidence,
      landIncent,
      healthIssues,whatIsTheIssue,underTreatment,typeOfTreatment,medicinePrice,place,state,city,country,maritalStatus) async {
    var params = {
      "masterHeadId": masterHeadId,
      "name": name,
      "relationId": relation,
      "age": age,
      "gender": gender,
      "educationId": education,
      "occupation": occupation,
      "landInCent": landIncent,
      "HealthIssue": healthIssues,
      "currentResidence": currentResidence,
      "token": token,
      "whatHealthIssue":whatIsTheIssue,
    "isUnderTreatment":underTreatment,
    "treatmentType":typeOfTreatment,
    "medicationPrice":medicinePrice,
      "place":place,
      "state":state,
      "city":city,
      "country":country,
      "maritalStatusId":maritalStatus
};

    try {
      var result = await _dio.get(baseUrl + "add_member_details",
          queryParameters: params);
      print(params);
      print(result);


      AddMemberDetailsModel model = AddMemberDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future economicDetails(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "economic_details_list",
          queryParameters: params);
      print(result);

      EconomicDetailsListModel model =
          EconomicDetailsListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future economicList() async {
    try {
      var result = await _dio.get(baseUrl + "economic_details_data");
      print(result);

      EconomicListModel model = EconomicListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addEcoomicData(body) async {
    print(body);
    var params = {
      "data": body,
    };
    try {
      var result = await _dio.post(baseUrl + "add_economic_details", data: jsonEncode(body));
      print(params);

      AddEconomicDataModel model = AddEconomicDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future waterAvailableDetails(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "water_use_characterstics",
          queryParameters: params);
      print(result);

      WaterAvailablityDetailsModel model =
      WaterAvailablityDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future waterUsageData() async {
    try {
      var result = await _dio.get(baseUrl + "water_usage_availibility_data");
      print(result);

      WaterUsageAvailableDataModel model = WaterUsageAvailableDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future addWaterAvailableData(
      distance,
      waterSourcePerminal,
      sourceType,
  liftingMethod,
  satisfied,reason,noOfSource,masterHeadId,token) async {
    var params = {
      "masterHeadId":masterHeadId,
      "distanceToSource": distance,
      "isPerennial": waterSourcePerminal,
      "sourceType": sourceType,
      "liftingMethord": liftingMethod,
      "waterAvailabilitySatisfaction": satisfied,
      "waterDissatisfactionReason": reason,
      "noOfSource": noOfSource,
      "token": token
    };
    try {
      var result = await _dio.get(baseUrl + "add_water_usage_availibility",
          queryParameters: params);
      print(result);
      print(params);

      AddWaterAvailableDataModel model = AddWaterAvailableDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future waterAssetData() async {
    try {
      var result = await _dio.get(baseUrl + "sanitation_data");
      print(result);

      WaterAssetDataModel model = WaterAssetDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future waterAssetDetailsList(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "sanitary_details_list",
          queryParameters: params);
      print(result);

      WaterAssetDetailsModel model =
      WaterAssetDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future addWaterAsset(
  haveToilet,waterAvailableInToilet,typeOfToiletTank,token,masterHeadId) async {
    var params = {
      "masterHeadId":masterHeadId,
      "toiletAvailability": haveToilet,
      "waterAvailabilityInToilet": waterAvailableInToilet,
      "toiletTankType": typeOfToiletTank,
      "token": token
    };
    try {
      var result = await _dio.get(baseUrl + "add_sanitary_details",
          queryParameters: params);
      print(result);
      print(params);

      AddWaterAssetModel model = AddWaterAssetModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future agricultureDetails(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "crops_agriculture_list",
          queryParameters: params);
      print(result);

      AgricultureDetailsModel model =
      AgricultureDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addAgricultureData(isRubber,rubber,rubberYielding,isCoconut,coconut,coconutYielding,
  isArecnut,arecnut,arecnutYielding,isPepper,pepper,pepperYielding,
  isCashew,cashew,cashewYielding,isCocoa,cocoa,cocoaYielding,masterHeadId,token) async {
  var params = {
      "masterHeadId":masterHeadId,
      "rubberYielding":isRubber,
      "rubberCount": rubber,
      "rubberYieldingCount": rubberYielding,
      "coconutYielding":isCoconut,
      "coconutCount": coconut,
      "coconutYieldingCount": coconutYielding,
      "arecnutYielding":isArecnut,
      "arecnutCount": arecnut,
      "arecanutYieldingCount": arecnutYielding,
      "cashewYielding":isCashew,
      "cashewCount": cashew,
      "cashewYieldingCount": cashewYielding,
      "pepperYielding":isPepper,
      "pepperCount": pepper,
      "pepperYieldingCount": pepperYielding,
      "cocoaYielding":isCocoa,
      "cocoaCount": cocoa,
      "cocoaYieldingCount": cocoaYielding,
        "token": token
    };
    try {
      var result = await _dio.get(baseUrl + "add_crops_agriculture",
          queryParameters: params);
      print(result);
      print(params);

      AddAgricultureDataModel model = AddAgricultureDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future animalhusbandaryDetails(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "animal_husbandry_list",
          queryParameters: params);
      print(result);

      AnimalHusbandaryDetailsModel model =
      AnimalHusbandaryDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future addAnimalData(
  liveStock,buffalo,cows,goats,pigs,rabits,poultryLayers,poultryBroilers,masterHeadId,token) async {

    var params = {
      "masterHeadId":masterHeadId,
      "hasLiveStock": liveStock,
      "buffaloCount": buffalo,
      "cowsCount": cows,
      "goatsCount": goats,
      "pigsCount": pigs,
      "rabitsCount": rabits,
      "poultryLayersCount": poultryLayers,
      "poultryBroilerCount": poultryBroilers,
      "token": token
    };
    try {
      var result = await _dio.get(baseUrl + "add_animal_husbandry",
          queryParameters: params);
      print(result);
      print(params);

      AddAnimalDataModel model = AddAnimalDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addPiscicultureData(haveFishFarming,masterHeadId,token
     ) async {

    var params = {
      "masterHeadId":masterHeadId,
      "fishFarming": haveFishFarming,
      "token": token
    };
    try {
      var result = await _dio.get(baseUrl + "add_pisciculture",
          queryParameters: params);
      print(result);
      print(params);

      AddPiscicultureModel model = AddPiscicultureModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future piscicultureDetails(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "pisciculture_list",
          queryParameters: params);
      print(result);

      PiscicultureDetailsModel model =
      PiscicultureDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future debtInformationList(masterHeadId, token) async {
    var params = {
      "masterHeadId": masterHeadId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "debt_organization_information_list",
          queryParameters: params);
      print(result);

      DebtInformationListModel model =
      DebtInformationListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future addDebitInformation(isDebited,bank,isFinance,financeName,
  isSocialOrganization,nameOfOrganization,masterHeadId,token
      ) async {

    var params = {
      "masterHeadId":masterHeadId,
      "debtTakenFromBank": isDebited,
      "bankId": bank,
      "debtTakenFromFinance": isFinance,
      "financeId": financeName,
      "socialOrganizationMembership": isSocialOrganization,
      "organizationName": nameOfOrganization,
      "token": token
    };
    try {
      var result = await _dio.get(baseUrl + "add_debt_organization_information",
          queryParameters: params);
      print(result);
      print(params);

      AddDebitInformationModel model = AddDebitInformationModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future debitInfo() async {
    try {
      var result = await _dio.get(baseUrl + "debt_information_data");
      print(result);

      DebitInfoDataModel model = DebitInfoDataModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editRecord(masterHeadId,token,
  mobileNumber,houseNumber,village,wardNo) async {
    var params = {
      "mobileNumber": mobileNumber,
      "houseNumber": houseNumber,
      "villageId": village,
      "wardNumber": wardNo,
      "token": token,
      "masterHeadId":masterHeadId

    };
    try {
      var result = await _dio.get(baseUrl + "edit_member_master",
          queryParameters: params);
      print(params);
      print(result);

      EditRecordModel model = EditRecordModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
}
