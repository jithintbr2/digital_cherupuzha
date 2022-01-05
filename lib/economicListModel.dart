class EconomicListModel {
  bool status;
  String message;
  Data data;

  EconomicListModel({this.status, this.message, this.data});

  EconomicListModel.fromJson(Map<String, dynamic> json) {
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
  List<SocialCategory> socialCategory;
  List<EconomicCategory> economicCategory;
  List<RationCardType> rationCardType;
  List<HouseOwnershipStatus> houseOwnershipStatus;
  List<RoofType> roofType;
  List<FlooringMaterial> flooringMaterial;
  List<NoOfRooms> noOfRooms;
  List<NoOfBathrooms> noOfBathrooms;
  List<NoFloors> noFloors;
  List<FinanceScheme> financeScheme;
  List<HouseRepair> houseRepair;
  List<ElectricityStatus> electricityStatus;
  List<RoadAccess> roadAccess;
  List<FuelUsed> fuelUsed;
  List<CattleWealth> cattleWealth;
  List<VehicleType> vehicleType;
  List<MediaDevices> mediaDevices;

  Data(
      {this.socialCategory,
        this.economicCategory,
        this.rationCardType,
        this.houseOwnershipStatus,
        this.roofType,
        this.flooringMaterial,
        this.noOfRooms,
        this.noOfBathrooms,
        this.noFloors,
        this.financeScheme,
        this.houseRepair,
        this.electricityStatus,
        this.roadAccess,
        this.fuelUsed,
        this.cattleWealth,
        this.vehicleType,
        this.mediaDevices});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['social_category'] != null) {
      socialCategory = new List<SocialCategory>();
      json['social_category'].forEach((v) {
        socialCategory.add(new SocialCategory.fromJson(v));
      });
    }
    if (json['economic_category'] != null) {
      economicCategory = new List<EconomicCategory>();
      json['economic_category'].forEach((v) {
        economicCategory.add(new EconomicCategory.fromJson(v));
      });
    }
    if (json['ration_card_type'] != null) {
      rationCardType = new List<RationCardType>();
      json['ration_card_type'].forEach((v) {
        rationCardType.add(new RationCardType.fromJson(v));
      });
    }
    if (json['house_ownership_status'] != null) {
      houseOwnershipStatus = new List<HouseOwnershipStatus>();
      json['house_ownership_status'].forEach((v) {
        houseOwnershipStatus.add(new HouseOwnershipStatus.fromJson(v));
      });
    }
    if (json['roof_type'] != null) {
      roofType = new List<RoofType>();
      json['roof_type'].forEach((v) {
        roofType.add(new RoofType.fromJson(v));
      });
    }
    if (json['flooring_material'] != null) {
      flooringMaterial = new List<FlooringMaterial>();
      json['flooring_material'].forEach((v) {
        flooringMaterial.add(new FlooringMaterial.fromJson(v));
      });
    }
    if (json['no_of_rooms'] != null) {
      noOfRooms = new List<NoOfRooms>();
      json['no_of_rooms'].forEach((v) {
        noOfRooms.add(new NoOfRooms.fromJson(v));
      });
    }
    if (json['no_of_bathrooms'] != null) {
      noOfBathrooms = new List<NoOfBathrooms>();
      json['no_of_bathrooms'].forEach((v) {
        noOfBathrooms.add(new NoOfBathrooms.fromJson(v));
      });
    }
    if (json['no_floors'] != null) {
      noFloors = new List<NoFloors>();
      json['no_floors'].forEach((v) {
        noFloors.add(new NoFloors.fromJson(v));
      });
    }
    if (json['finance_scheme'] != null) {
      financeScheme = new List<FinanceScheme>();
      json['finance_scheme'].forEach((v) {
        financeScheme.add(new FinanceScheme.fromJson(v));
      });
    }
    if (json['house_repair'] != null) {
      houseRepair = new List<HouseRepair>();
      json['house_repair'].forEach((v) {
        houseRepair.add(new HouseRepair.fromJson(v));
      });
    }
    if (json['electricity_status'] != null) {
      electricityStatus = new List<ElectricityStatus>();
      json['electricity_status'].forEach((v) {
        electricityStatus.add(new ElectricityStatus.fromJson(v));
      });
    }
    if (json['road_access'] != null) {
      roadAccess = new List<RoadAccess>();
      json['road_access'].forEach((v) {
        roadAccess.add(new RoadAccess.fromJson(v));
      });
    }
    if (json['fuel_used'] != null) {
      fuelUsed = new List<FuelUsed>();
      json['fuel_used'].forEach((v) {
        fuelUsed.add(new FuelUsed.fromJson(v));
      });
    }
    if (json['cattle_wealth'] != null) {
      cattleWealth = new List<CattleWealth>();
      json['cattle_wealth'].forEach((v) {
        cattleWealth.add(new CattleWealth.fromJson(v));
      });
    }
    if (json['vehicle_type'] != null) {
      vehicleType = new List<VehicleType>();
      json['vehicle_type'].forEach((v) {
        vehicleType.add(new VehicleType.fromJson(v));
      });
    }
    if (json['media_devices'] != null) {
      mediaDevices = new List<MediaDevices>();
      json['media_devices'].forEach((v) {
        mediaDevices.add(new MediaDevices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.socialCategory != null) {
      data['social_category'] =
          this.socialCategory.map((v) => v.toJson()).toList();
    }
    if (this.economicCategory != null) {
      data['economic_category'] =
          this.economicCategory.map((v) => v.toJson()).toList();
    }
    if (this.rationCardType != null) {
      data['ration_card_type'] =
          this.rationCardType.map((v) => v.toJson()).toList();
    }
    if (this.houseOwnershipStatus != null) {
      data['house_ownership_status'] =
          this.houseOwnershipStatus.map((v) => v.toJson()).toList();
    }
    if (this.roofType != null) {
      data['roof_type'] = this.roofType.map((v) => v.toJson()).toList();
    }
    if (this.flooringMaterial != null) {
      data['flooring_material'] =
          this.flooringMaterial.map((v) => v.toJson()).toList();
    }
    if (this.noOfRooms != null) {
      data['no_of_rooms'] = this.noOfRooms.map((v) => v.toJson()).toList();
    }
    if (this.noOfBathrooms != null) {
      data['no_of_bathrooms'] =
          this.noOfBathrooms.map((v) => v.toJson()).toList();
    }
    if (this.noFloors != null) {
      data['no_floors'] = this.noFloors.map((v) => v.toJson()).toList();
    }
    if (this.financeScheme != null) {
      data['finance_scheme'] =
          this.financeScheme.map((v) => v.toJson()).toList();
    }
    if (this.houseRepair != null) {
      data['house_repair'] = this.houseRepair.map((v) => v.toJson()).toList();
    }
    if (this.electricityStatus != null) {
      data['electricity_status'] =
          this.electricityStatus.map((v) => v.toJson()).toList();
    }
    if (this.roadAccess != null) {
      data['road_access'] = this.roadAccess.map((v) => v.toJson()).toList();
    }
    if (this.fuelUsed != null) {
      data['fuel_used'] = this.fuelUsed.map((v) => v.toJson()).toList();
    }
    if (this.cattleWealth != null) {
      data['cattle_wealth'] = this.cattleWealth.map((v) => v.toJson()).toList();
    }
    if (this.vehicleType != null) {
      data['vehicle_type'] = this.vehicleType.map((v) => v.toJson()).toList();
    }
    if (this.mediaDevices != null) {
      data['media_devices'] = this.mediaDevices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialCategory {
  int socialCategoryId;
  String socialCategory;

  SocialCategory({this.socialCategoryId, this.socialCategory});

  SocialCategory.fromJson(Map<String, dynamic> json) {
    socialCategoryId = json['socialCategoryId'];
    socialCategory = json['socialCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['socialCategoryId'] = this.socialCategoryId;
    data['socialCategory'] = this.socialCategory;
    return data;
  }
}

class EconomicCategory {
  int economicCategoryId;
  String economicCategory;

  EconomicCategory({this.economicCategoryId, this.economicCategory});

  EconomicCategory.fromJson(Map<String, dynamic> json) {
    economicCategoryId = json['economicCategoryId'];
    economicCategory = json['economicCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['economicCategoryId'] = this.economicCategoryId;
    data['economicCategory'] = this.economicCategory;
    return data;
  }
}

class RationCardType {
  int rationCardTypeId;
  String rationCardType;

  RationCardType({this.rationCardTypeId, this.rationCardType});

  RationCardType.fromJson(Map<String, dynamic> json) {
    rationCardTypeId = json['rationCardTypeId'];
    rationCardType = json['rationCardType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rationCardTypeId'] = this.rationCardTypeId;
    data['rationCardType'] = this.rationCardType;
    return data;
  }
}

class HouseOwnershipStatus {
  int houseOwnershipStatusId;
  String houseOwnershipStatus;

  HouseOwnershipStatus(
      {this.houseOwnershipStatusId, this.houseOwnershipStatus});

  HouseOwnershipStatus.fromJson(Map<String, dynamic> json) {
    houseOwnershipStatusId = json['houseOwnershipStatusId'];
    houseOwnershipStatus = json['houseOwnershipStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['houseOwnershipStatusId'] = this.houseOwnershipStatusId;
    data['houseOwnershipStatus'] = this.houseOwnershipStatus;
    return data;
  }
}

class RoofType {
  int roofTypeId;
  String roofType;

  RoofType({this.roofTypeId, this.roofType});

  RoofType.fromJson(Map<String, dynamic> json) {
    roofTypeId = json['roofTypeId'];
    roofType = json['roofType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roofTypeId'] = this.roofTypeId;
    data['roofType'] = this.roofType;
    return data;
  }
}

class FlooringMaterial {
  int flooringMaterialId;
  String flooringMaterial;

  FlooringMaterial({this.flooringMaterialId, this.flooringMaterial});

  FlooringMaterial.fromJson(Map<String, dynamic> json) {
    flooringMaterialId = json['flooringMaterialId'];
    flooringMaterial = json['flooringMaterial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flooringMaterialId'] = this.flooringMaterialId;
    data['flooringMaterial'] = this.flooringMaterial;
    return data;
  }
}

class NoOfRooms {
  int noOfRoomsId;
  String noOfRooms;

  NoOfRooms({this.noOfRoomsId, this.noOfRooms});

  NoOfRooms.fromJson(Map<String, dynamic> json) {
    noOfRoomsId = json['noOfRoomsId'];
    noOfRooms = json['noOfRooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfRoomsId'] = this.noOfRoomsId;
    data['noOfRooms'] = this.noOfRooms;
    return data;
  }
}

class NoOfBathrooms {
  int noOfBathroomsId;
  String noOfBathrooms;

  NoOfBathrooms({this.noOfBathroomsId, this.noOfBathrooms});

  NoOfBathrooms.fromJson(Map<String, dynamic> json) {
    noOfBathroomsId = json['noOfBathroomsId'];
    noOfBathrooms = json['noOfBathrooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfBathroomsId'] = this.noOfBathroomsId;
    data['noOfBathrooms'] = this.noOfBathrooms;
    return data;
  }
}

class NoFloors {
  int noOfFloorsId;
  String noOfFloors;

  NoFloors({this.noOfFloorsId, this.noOfFloors});

  NoFloors.fromJson(Map<String, dynamic> json) {
    noOfFloorsId = json['noOfFloorsId'];
    noOfFloors = json['noOfFloors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfFloorsId'] = this.noOfFloorsId;
    data['noOfFloors'] = this.noOfFloors;
    return data;
  }
}

class FinanceScheme {
  int schemeId;
  String scheme;

  FinanceScheme({this.schemeId, this.scheme});

  FinanceScheme.fromJson(Map<String, dynamic> json) {
    schemeId = json['schemeId'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schemeId'] = this.schemeId;
    data['scheme'] = this.scheme;
    return data;
  }
}

class HouseRepair {
  int repairWorkId;
  String repairWork;

  HouseRepair({this.repairWorkId, this.repairWork});

  HouseRepair.fromJson(Map<String, dynamic> json) {
    repairWorkId = json['repairWorkId'];
    repairWork = json['repairWork'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repairWorkId'] = this.repairWorkId;
    data['repairWork'] = this.repairWork;
    return data;
  }
}

class ElectricityStatus {
  int electricityStatusId;
  String electricityStatus;

  ElectricityStatus({this.electricityStatusId, this.electricityStatus});

  ElectricityStatus.fromJson(Map<String, dynamic> json) {
    electricityStatusId = json['electricityStatusId'];
    electricityStatus = json['electricityStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['electricityStatusId'] = this.electricityStatusId;
    data['electricityStatus'] = this.electricityStatus;
    return data;
  }
}

class RoadAccess {
  int roadAccessId;
  String roadAccess;

  RoadAccess({this.roadAccessId, this.roadAccess});

  RoadAccess.fromJson(Map<String, dynamic> json) {
    roadAccessId = json['roadAccessId'];
    roadAccess = json['roadAccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roadAccessId'] = this.roadAccessId;
    data['roadAccess'] = this.roadAccess;
    return data;
  }
}

class FuelUsed {
  int fuelUsedId;
  String fuelUsed;

  FuelUsed({this.fuelUsedId, this.fuelUsed});

  FuelUsed.fromJson(Map<String, dynamic> json) {
    fuelUsedId = json['fuelUsedId'];
    fuelUsed = json['fuelUsed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fuelUsedId'] = this.fuelUsedId;
    data['fuelUsed'] = this.fuelUsed;
    return data;
  }
}

class CattleWealth {
  int cattleWealthId;
  String cattleWealth;

  CattleWealth({this.cattleWealthId, this.cattleWealth});

  CattleWealth.fromJson(Map<String, dynamic> json) {
    cattleWealthId = json['cattleWealthId'];
    cattleWealth = json['cattleWealth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cattleWealthId'] = this.cattleWealthId;
    data['cattleWealth'] = this.cattleWealth;
    return data;
  }
}

class VehicleType {
  int vehicleTypeId;
  String vehicleType;

  VehicleType({this.vehicleTypeId, this.vehicleType});

  VehicleType.fromJson(Map<String, dynamic> json) {
    vehicleTypeId = json['vehicleTypeId'];
    vehicleType = json['vehicleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleTypeId'] = this.vehicleTypeId;
    data['vehicleType'] = this.vehicleType;
    return data;
  }
}

class MediaDevices {
  int mediaDevicesId;
  String mediaDevices;

  MediaDevices({this.mediaDevicesId, this.mediaDevices});

  MediaDevices.fromJson(Map<String, dynamic> json) {
    mediaDevicesId = json['mediaDevicesId'];
    mediaDevices = json['mediaDevices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mediaDevicesId'] = this.mediaDevicesId;
    data['mediaDevices'] = this.mediaDevices;
    return data;
  }
}