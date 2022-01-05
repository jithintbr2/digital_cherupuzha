class EconomicDetailsListModel {
  bool status;
  String message;
  Data data;

  EconomicDetailsListModel({this.status, this.message, this.data});

  EconomicDetailsListModel.fromJson(Map<String, dynamic> json) {
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
  int economicId;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String socialCategory;
  String economicCategory;
  String rationCardType;
  String houseOwnershipStatus;
  int rentAmount;
  String roofType;
  String flooringMaterial;
  String noOfFloors;
  String noOfRooms;
  String noOfToilets;
  int toiletAttachedRooms;
  String financeForConstructionReceived;
  String scheme;
  String urgentRepairRequired;
  String whatRepair;
  String electricityStatus;
  String roadAccess;
  String fuelUsed;
  String cattleWealth;
  String mediaDevice;
  String vehicleStatus;
  List<VehicleType> vehicleType;
  String mediaDevices;

  Data(
      {this.economicId,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.socialCategory,
        this.economicCategory,
        this.rationCardType,
        this.houseOwnershipStatus,
        this.rentAmount,
        this.roofType,
        this.flooringMaterial,
        this.noOfFloors,
        this.noOfRooms,
        this.noOfToilets,
        this.toiletAttachedRooms,
        this.financeForConstructionReceived,
        this.scheme,
        this.urgentRepairRequired,
        this.whatRepair,
        this.electricityStatus,
        this.roadAccess,
        this.fuelUsed,
        this.cattleWealth,
        this.mediaDevice,
        this.vehicleStatus,
        this.vehicleType,
        this.mediaDevices});

  Data.fromJson(Map<String, dynamic> json) {
    economicId = json['economicId'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    socialCategory = json['socialCategory'];
    economicCategory = json['economicCategory'];
    rationCardType = json['rationCardType'];
    houseOwnershipStatus = json['houseOwnershipStatus'];
    rentAmount = json['rentAmount'];
    roofType = json['roofType'];
    flooringMaterial = json['flooringMaterial'];
    noOfFloors = json['noOfFloors'];
    noOfRooms = json['noOfRooms'];
    noOfToilets = json['noOfToilets'];
    toiletAttachedRooms = json['toiletAttachedRooms'];
    financeForConstructionReceived = json['financeForConstructionReceived'];
    scheme = json['scheme'];
    urgentRepairRequired = json['urgentRepairRequired'];
    whatRepair = json['whatRepair'];
    electricityStatus = json['electricityStatus'];
    roadAccess = json['roadAccess'];
    fuelUsed = json['fuelUsed'];
    cattleWealth = json['cattleWealth'];
    mediaDevice = json['media_device'];
    vehicleStatus = json['vehicleStatus'];
    if (json['vehicleType'] != null) {
      vehicleType = <VehicleType>[];
      json['vehicleType'].forEach((v) {
        vehicleType.add(new VehicleType.fromJson(v));
      });
    }
    mediaDevices = json['mediaDevices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['economicId'] = this.economicId;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['socialCategory'] = this.socialCategory;
    data['economicCategory'] = this.economicCategory;
    data['rationCardType'] = this.rationCardType;
    data['houseOwnershipStatus'] = this.houseOwnershipStatus;
    data['rentAmount'] = this.rentAmount;
    data['roofType'] = this.roofType;
    data['flooringMaterial'] = this.flooringMaterial;
    data['noOfFloors'] = this.noOfFloors;
    data['noOfRooms'] = this.noOfRooms;
    data['noOfToilets'] = this.noOfToilets;
    data['toiletAttachedRooms'] = this.toiletAttachedRooms;
    data['financeForConstructionReceived'] =
        this.financeForConstructionReceived;
    data['scheme'] = this.scheme;
    data['urgentRepairRequired'] = this.urgentRepairRequired;
    data['whatRepair'] = this.whatRepair;
    data['electricityStatus'] = this.electricityStatus;
    data['roadAccess'] = this.roadAccess;
    data['fuelUsed'] = this.fuelUsed;
    data['cattleWealth'] = this.cattleWealth;
    data['media_device'] = this.mediaDevice;
    data['vehicleStatus'] = this.vehicleStatus;
    if (this.vehicleType != null) {
      data['vehicleType'] = this.vehicleType.map((v) => v.toJson()).toList();
    }
    data['mediaDevices'] = this.mediaDevices;
    return data;
  }
}

class VehicleType {
  String vehicles;
  String vehicleCount;

  VehicleType({this.vehicles, this.vehicleCount});

  VehicleType.fromJson(Map<String, dynamic> json) {
    vehicles = json['vehicles'];
    vehicleCount = json['vehicle_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicles'] = this.vehicles;
    data['vehicle_count'] = this.vehicleCount;
    return data;
  }
}