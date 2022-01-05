class AnimalHusbandaryDetailsModel {
  bool status;
  String message;
  Data data;

  AnimalHusbandaryDetailsModel({this.status, this.message, this.data});

  AnimalHusbandaryDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int animalHusbandryId;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String hasLiveStock;
  int buffaloCount;
  int cowsCount;
  int goatsCount;
  int pigsCount;
  int rabitsCount;
  int poultryLayersCount;
  int poultryBroilerCount;

  Data(
      {this.animalHusbandryId,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.hasLiveStock,
        this.buffaloCount,
        this.cowsCount,
        this.goatsCount,
        this.pigsCount,
        this.rabitsCount,
        this.poultryLayersCount,
        this.poultryBroilerCount});

  Data.fromJson(Map<String, dynamic> json) {
    animalHusbandryId = json['animalHusbandryId'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    hasLiveStock = json['has_live_stock'];
    buffaloCount = json['buffalo_count'];
    cowsCount = json['cows_count'];
    goatsCount = json['goats_count'];
    pigsCount = json['pigs_count'];
    rabitsCount = json['rabits_count'];
    poultryLayersCount = json['poultry_layers_count'];
    poultryBroilerCount = json['poultry_broiler_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animalHusbandryId'] = this.animalHusbandryId;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['has_live_stock'] = this.hasLiveStock;
    data['buffalo_count'] = this.buffaloCount;
    data['cows_count'] = this.cowsCount;
    data['goats_count'] = this.goatsCount;
    data['pigs_count'] = this.pigsCount;
    data['rabits_count'] = this.rabitsCount;
    data['poultry_layers_count'] = this.poultryLayersCount;
    data['poultry_broiler_count'] = this.poultryBroilerCount;
    return data;
  }
}