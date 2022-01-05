class WaterAvailablityDetailsModel {
  bool status;
  String message;
  Data data;

  WaterAvailablityDetailsModel({this.status, this.message, this.data});

  WaterAvailablityDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int waterUsageId;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String distanceToSource;
  String sourceType;
  int noOfSource;
  String isPerennial;
  String liftingMethod;
  String isSatisfiedWaterAvailability;
  String dissatisfactionReason;

  Data(
      {this.waterUsageId,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.distanceToSource,
        this.sourceType,
        this.noOfSource,
        this.isPerennial,
        this.liftingMethod,
        this.isSatisfiedWaterAvailability,
        this.dissatisfactionReason});

  Data.fromJson(Map<String, dynamic> json) {
    waterUsageId = json['water_usage_id'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    distanceToSource = json['distanceToSource'];
    sourceType = json['sourceType'];
    noOfSource = json['noOfSource'];
    isPerennial = json['isPerennial'];
    liftingMethod = json['liftingMethod'];
    isSatisfiedWaterAvailability = json['is_satisfied_water_availability'];
    dissatisfactionReason = json['dissatisfactionReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['water_usage_id'] = this.waterUsageId;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['distanceToSource'] = this.distanceToSource;
    data['sourceType'] = this.sourceType;
    data['noOfSource'] = this.noOfSource;
    data['isPerennial'] = this.isPerennial;
    data['liftingMethod'] = this.liftingMethod;
    data['is_satisfied_water_availability'] = this.isSatisfiedWaterAvailability;
    data['dissatisfactionReason'] = this.dissatisfactionReason;
    return data;
  }
}