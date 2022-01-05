class WaterAssetDataModel {
  bool status;
  String message;
  Data data;

  WaterAssetDataModel({this.status, this.message, this.data});

  WaterAssetDataModel.fromJson(Map<String, dynamic> json) {
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
  List<ToiletTankType> toiletTankType;
  List<ToiletAvailability> toiletAvailability;
  List<WaterAvailabilityInToilet> waterAvailabilityInToilet;

  Data(
      {this.toiletTankType,
        this.toiletAvailability,
        this.waterAvailabilityInToilet});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['toilet_tank_type'] != null) {
      toiletTankType = new List<ToiletTankType>();
      json['toilet_tank_type'].forEach((v) {
        toiletTankType.add(new ToiletTankType.fromJson(v));
      });
    }
    if (json['toilet_availability'] != null) {
      toiletAvailability = new List<ToiletAvailability>();
      json['toilet_availability'].forEach((v) {
        toiletAvailability.add(new ToiletAvailability.fromJson(v));
      });
    }
    if (json['water_availability_in_toilet'] != null) {
      waterAvailabilityInToilet = new List<WaterAvailabilityInToilet>();
      json['water_availability_in_toilet'].forEach((v) {
        waterAvailabilityInToilet
            .add(new WaterAvailabilityInToilet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.toiletTankType != null) {
      data['toilet_tank_type'] =
          this.toiletTankType.map((v) => v.toJson()).toList();
    }
    if (this.toiletAvailability != null) {
      data['toilet_availability'] =
          this.toiletAvailability.map((v) => v.toJson()).toList();
    }
    if (this.waterAvailabilityInToilet != null) {
      data['water_availability_in_toilet'] =
          this.waterAvailabilityInToilet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToiletTankType {
  int toiletTankTypeId;
  String toiletTankType;

  ToiletTankType({this.toiletTankTypeId, this.toiletTankType});

  ToiletTankType.fromJson(Map<String, dynamic> json) {
    toiletTankTypeId = json['toilet_tank_type_id'];
    toiletTankType = json['toilet_tank_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toilet_tank_type_id'] = this.toiletTankTypeId;
    data['toilet_tank_type'] = this.toiletTankType;
    return data;
  }
}

class ToiletAvailability {
  int toiletAvailabilityId;
  String toiletAvailability;

  ToiletAvailability({this.toiletAvailabilityId, this.toiletAvailability});

  ToiletAvailability.fromJson(Map<String, dynamic> json) {
    toiletAvailabilityId = json['toilet_availability_id'];
    toiletAvailability = json['toilet_availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toilet_availability_id'] = this.toiletAvailabilityId;
    data['toilet_availability'] = this.toiletAvailability;
    return data;
  }
}

class WaterAvailabilityInToilet {
  int id;
  String waterAvailabilityInToilet;

  WaterAvailabilityInToilet({this.id, this.waterAvailabilityInToilet});

  WaterAvailabilityInToilet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    waterAvailabilityInToilet = json['water_availability_in_toilet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['water_availability_in_toilet'] = this.waterAvailabilityInToilet;
    return data;
  }
}