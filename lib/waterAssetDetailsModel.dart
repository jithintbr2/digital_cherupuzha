class WaterAssetDetailsModel {
  bool status;
  String message;
  Data data;

  WaterAssetDetailsModel({this.status, this.message, this.data});

  WaterAssetDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int detailsId;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String toiletAvailability;
  String waterAvailabilityInToilet;
  String toiletTankType;

  Data(
      {this.detailsId,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.toiletAvailability,
        this.waterAvailabilityInToilet,
        this.toiletTankType});

  Data.fromJson(Map<String, dynamic> json) {
    detailsId = json['detailsId'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    toiletAvailability = json['toilet_availability'];
    waterAvailabilityInToilet = json['water_availability_in_toilet'];
    toiletTankType = json['toilet_tank_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detailsId'] = this.detailsId;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['toilet_availability'] = this.toiletAvailability;
    data['water_availability_in_toilet'] = this.waterAvailabilityInToilet;
    data['toilet_tank_type'] = this.toiletTankType;
    return data;
  }
}