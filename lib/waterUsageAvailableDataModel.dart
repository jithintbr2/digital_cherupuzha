class WaterUsageAvailableDataModel {
  bool status;
  String message;
  Data data;

  WaterUsageAvailableDataModel({this.status, this.message, this.data});

  WaterUsageAvailableDataModel.fromJson(Map<String, dynamic> json) {
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
  List<DistanceToSource> distanceToSource;
  List<WaterSources> waterSources;
  List<LiftingMethod> liftingMethod;
  List<WaterPerennial> waterPerennial;
  List<WaterDissatisfactionReason> waterDissatisfactionReason;

  Data(
      {this.distanceToSource,
        this.waterSources,
        this.liftingMethod,
        this.waterPerennial,
        this.waterDissatisfactionReason});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['distance_to_source'] != null) {
      distanceToSource = new List<DistanceToSource>();
      json['distance_to_source'].forEach((v) {
        distanceToSource.add(new DistanceToSource.fromJson(v));
      });
    }
    if (json['water_sources'] != null) {
      waterSources = new List<WaterSources>();
      json['water_sources'].forEach((v) {
        waterSources.add(new WaterSources.fromJson(v));
      });
    }
    if (json['lifting_method'] != null) {
      liftingMethod = new List<LiftingMethod>();
      json['lifting_method'].forEach((v) {
        liftingMethod.add(new LiftingMethod.fromJson(v));
      });
    }
    if (json['water_perennial'] != null) {
      waterPerennial = new List<WaterPerennial>();
      json['water_perennial'].forEach((v) {
        waterPerennial.add(new WaterPerennial.fromJson(v));
      });
    }
    if (json['water_dissatisfaction_reason'] != null) {
      waterDissatisfactionReason = new List<WaterDissatisfactionReason>();
      json['water_dissatisfaction_reason'].forEach((v) {
        waterDissatisfactionReason
            .add(new WaterDissatisfactionReason.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distanceToSource != null) {
      data['distance_to_source'] =
          this.distanceToSource.map((v) => v.toJson()).toList();
    }
    if (this.waterSources != null) {
      data['water_sources'] = this.waterSources.map((v) => v.toJson()).toList();
    }
    if (this.liftingMethod != null) {
      data['lifting_method'] =
          this.liftingMethod.map((v) => v.toJson()).toList();
    }
    if (this.waterPerennial != null) {
      data['water_perennial'] =
          this.waterPerennial.map((v) => v.toJson()).toList();
    }
    if (this.waterDissatisfactionReason != null) {
      data['water_dissatisfaction_reason'] =
          this.waterDissatisfactionReason.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistanceToSource {
  int distanceToSourceId;
  String distanceToSource;

  DistanceToSource({this.distanceToSourceId, this.distanceToSource});

  DistanceToSource.fromJson(Map<String, dynamic> json) {
    distanceToSourceId = json['distance_to_source_id'];
    distanceToSource = json['distance_to_source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance_to_source_id'] = this.distanceToSourceId;
    data['distance_to_source'] = this.distanceToSource;
    return data;
  }
}

class WaterSources {
  int waterSourcesId;
  String waterSources;

  WaterSources({this.waterSourcesId, this.waterSources});

  WaterSources.fromJson(Map<String, dynamic> json) {
    waterSourcesId = json['water_sources_id'];
    waterSources = json['water_sources'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['water_sources_id'] = this.waterSourcesId;
    data['water_sources'] = this.waterSources;
    return data;
  }
}

class LiftingMethod {
  int liftingMethodId;
  String liftingMethod;

  LiftingMethod({this.liftingMethodId, this.liftingMethod});

  LiftingMethod.fromJson(Map<String, dynamic> json) {
    liftingMethodId = json['lifting_method_id'];
    liftingMethod = json['lifting_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lifting_method_id'] = this.liftingMethodId;
    data['lifting_method'] = this.liftingMethod;
    return data;
  }
}

class WaterPerennial {
  int id;
  String isPerennial;

  WaterPerennial({this.id, this.isPerennial});

  WaterPerennial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPerennial = json['is_perennial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_perennial'] = this.isPerennial;
    return data;
  }
}

class WaterDissatisfactionReason {
  int dissatisfactionReasonId;
  String dissatisfactionReason;

  WaterDissatisfactionReason(
      {this.dissatisfactionReasonId, this.dissatisfactionReason});

  WaterDissatisfactionReason.fromJson(Map<String, dynamic> json) {
    dissatisfactionReasonId = json['dissatisfaction_reason_id'];
    dissatisfactionReason = json['dissatisfaction_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dissatisfaction_reason_id'] = this.dissatisfactionReasonId;
    data['dissatisfaction_reason'] = this.dissatisfactionReason;
    return data;
  }
}