class MemberDetailsModel {
  bool status;
  String message;
  Data data;

  MemberDetailsModel({this.status, this.message, this.data});

  MemberDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int masterHeadId;
  String mobileNumber;
  String houseNumber;
  String districtName;
  String talukName;
  String blockName;
  String panchayathName;
  int villageId;
  String villageName;
  int wardNumber;
  bool economicData;
  bool waterUse;
  bool sanitation;
  bool crops;
  bool animal;
  bool pisciculture;
  bool debt;

  Data(
      {this.masterHeadId,
        this.mobileNumber,
        this.houseNumber,
        this.districtName,
        this.talukName,
        this.blockName,
        this.panchayathName,
        this.villageId,
        this.villageName,
        this.wardNumber,
        this.economicData,
        this.waterUse,
        this.sanitation,
        this.crops,
        this.animal,
        this.pisciculture,
        this.debt});

  Data.fromJson(Map<String, dynamic> json) {
    masterHeadId = json['masterHeadId'];
    mobileNumber = json['mobileNumber'];
    houseNumber = json['houseNumber'];
    districtName = json['districtName'];
    talukName = json['talukName'];
    blockName = json['blockName'];
    panchayathName = json['panchayathName'];
    villageId = json['villageId'];
    villageName = json['villageName'];
    wardNumber = json['wardNumber'];
    economicData = json['economic_data'];
    waterUse = json['water_use'];
    sanitation = json['sanitation'];
    crops = json['crops'];
    animal = json['animal'];
    pisciculture = json['pisciculture'];
    debt = json['debt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masterHeadId'] = this.masterHeadId;
    data['mobileNumber'] = this.mobileNumber;
    data['houseNumber'] = this.houseNumber;
    data['districtName'] = this.districtName;
    data['talukName'] = this.talukName;
    data['blockName'] = this.blockName;
    data['panchayathName'] = this.panchayathName;
    data['villageId'] = this.villageId;
    data['villageName'] = this.villageName;
    data['wardNumber'] = this.wardNumber;
    data['economic_data'] = this.economicData;
    data['water_use'] = this.waterUse;
    data['sanitation'] = this.sanitation;
    data['crops'] = this.crops;
    data['animal'] = this.animal;
    data['pisciculture'] = this.pisciculture;
    data['debt'] = this.debt;
    return data;
  }
}