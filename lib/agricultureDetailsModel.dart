class AgricultureDetailsModel {
  bool status;
  String message;
  Data data;

  AgricultureDetailsModel({this.status, this.message, this.data});

  AgricultureDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int cropsId;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String rubberYielding;
  int rubberCount;
  int rubberYieldingCount;
  String coconutYielding;
  int coconutCount;
  int coconutYieldingCount;
  String arecnutYielding;
  int arecnutCount;
  int arecanutYieldingCount;
  String cashewYielding;
  int cashewCount;
  int cashewYieldingCount;
  String pepperYielding;
  int pepperCount;
  int pepperYieldingCount;
  String cocoaYielding;
  int cocoaCount;
  int cocoaYieldingCount;

  Data(
      {this.cropsId,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.rubberYielding,
        this.rubberCount,
        this.rubberYieldingCount,
        this.coconutYielding,
        this.coconutCount,
        this.coconutYieldingCount,
        this.arecnutYielding,
        this.arecnutCount,
        this.arecanutYieldingCount,
        this.cashewYielding,
        this.cashewCount,
        this.cashewYieldingCount,
        this.pepperYielding,
        this.pepperCount,
        this.pepperYieldingCount,
        this.cocoaYielding,
        this.cocoaCount,
        this.cocoaYieldingCount});

  Data.fromJson(Map<String, dynamic> json) {
    cropsId = json['cropsId'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    rubberYielding = json['rubber_yielding'];
    rubberCount = json['rubber_count'];
    rubberYieldingCount = json['rubber_yielding_count'];
    coconutYielding = json['coconut_yielding'];
    coconutCount = json['coconut_count'];
    coconutYieldingCount = json['coconut_yielding_count'];
    arecnutYielding = json['arecnut_yielding'];
    arecnutCount = json['arecnut_count'];
    arecanutYieldingCount = json['arecanut_yielding_count'];
    cashewYielding = json['cashew_yielding'];
    cashewCount = json['cashew_count'];
    cashewYieldingCount = json['cashew_yielding_count'];
    pepperYielding = json['pepper_yielding'];
    pepperCount = json['pepper_count'];
    pepperYieldingCount = json['pepper_yielding_count'];
    cocoaYielding = json['cocoa_yielding'];
    cocoaCount = json['cocoa_count'];
    cocoaYieldingCount = json['cocoa_yielding_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cropsId'] = this.cropsId;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['rubber_yielding'] = this.rubberYielding;
    data['rubber_count'] = this.rubberCount;
    data['rubber_yielding_count'] = this.rubberYieldingCount;
    data['coconut_yielding'] = this.coconutYielding;
    data['coconut_count'] = this.coconutCount;
    data['coconut_yielding_count'] = this.coconutYieldingCount;
    data['arecnut_yielding'] = this.arecnutYielding;
    data['arecnut_count'] = this.arecnutCount;
    data['arecanut_yielding_count'] = this.arecanutYieldingCount;
    data['cashew_yielding'] = this.cashewYielding;
    data['cashew_count'] = this.cashewCount;
    data['cashew_yielding_count'] = this.cashewYieldingCount;
    data['pepper_yielding'] = this.pepperYielding;
    data['pepper_count'] = this.pepperCount;
    data['pepper_yielding_count'] = this.pepperYieldingCount;
    data['cocoa_yielding'] = this.cocoaYielding;
    data['cocoa_count'] = this.cocoaCount;
    data['cocoa_yielding_count'] = this.cocoaYieldingCount;
    return data;
  }
}