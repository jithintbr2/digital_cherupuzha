class ListVillageModel {
  bool status;
  String message;
  List<Data> data;

  ListVillageModel({this.status, this.message, this.data});

  ListVillageModel.fromJson(Map<String, dynamic> json) {
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
  int villageId;
  int panchayathId;
  String villageName;

  Data({this.villageId, this.panchayathId, this.villageName});

  Data.fromJson(Map<String, dynamic> json) {
    villageId = json['villageId'];
    panchayathId = json['panchayathId'];
    villageName = json['villageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['villageId'] = this.villageId;
    data['panchayathId'] = this.panchayathId;
    data['villageName'] = this.villageName;
    return data;
  }
}