class AddAnimalDataModel {
  bool status;
  String message;
  bool data;

  AddAnimalDataModel({this.status, this.message, this.data});

  AddAnimalDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}


