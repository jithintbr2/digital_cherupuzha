class HeadModel {
  bool status;
  String message;
  List<Data> data;

  HeadModel({this.status, this.message, this.data});

  HeadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
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
  String villageName;
  int wardNumber;

  Data(
      {this.masterHeadId,
        this.mobileNumber,
        this.houseNumber,
        this.districtName,
        this.talukName,
        this.blockName,
        this.panchayathName,
        this.villageName,
        this.wardNumber});

  Data.fromJson(Map<String, dynamic> json) {
    masterHeadId = json['masterHeadId'];
    mobileNumber = json['mobileNumber'];
    houseNumber = json['houseNumber'];
    districtName = json['districtName'];
    talukName = json['talukName'];
    blockName = json['blockName'];
    panchayathName = json['panchayathName'];
    villageName = json['villageName'];
    wardNumber = json['wardNumber'];
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
    data['villageName'] = this.villageName;
    data['wardNumber'] = this.wardNumber;
    return data;
  }
}