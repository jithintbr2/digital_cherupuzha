class PiscicultureDetailsModel {
  bool status;
  String message;
  Data data;

  PiscicultureDetailsModel({this.status, this.message, this.data});

  PiscicultureDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int id;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String haveFishFarming;

  Data(
      {this.id,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.haveFishFarming});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    haveFishFarming = json['have_fish_farming'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['have_fish_farming'] = this.haveFishFarming;
    return data;
  }
}