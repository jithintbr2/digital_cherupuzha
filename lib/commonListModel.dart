class CommonListModel {
  bool status;
  String message;
  Data data;

  CommonListModel({this.status, this.message, this.data});

  CommonListModel.fromJson(Map<String, dynamic> json) {
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
  List<Relationship> relationship;
  List<Gender> gender;
  List<Education> education;
  List<Occupation> occupation;
  List<MaritalStatus> maritalStatus;
  List<LandOwnership> landOwnership;
  List<CurrentResidence> currentResidence;
  List<HealthIssueStatus> healthIssueStatus;
  List<HealthTreatment> healthTreatment;

  Data(
      {this.relationship,
        this.gender,
        this.education,
        this.occupation,
        this.maritalStatus,
        this.landOwnership,
        this.currentResidence,
        this.healthIssueStatus,
        this.healthTreatment});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['relationship'] != null) {
      relationship = <Relationship>[];
      json['relationship'].forEach((v) {
        relationship.add(new Relationship.fromJson(v));
      });
    }
    if (json['gender'] != null) {
      gender = <Gender>[];
      json['gender'].forEach((v) {
        gender.add(new Gender.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education.add(new Education.fromJson(v));
      });
    }
    if (json['occupation'] != null) {
      occupation = <Occupation>[];
      json['occupation'].forEach((v) {
        occupation.add(new Occupation.fromJson(v));
      });
    }
    if (json['marital_status'] != null) {
      maritalStatus = <MaritalStatus>[];
      json['marital_status'].forEach((v) {
        maritalStatus.add(new MaritalStatus.fromJson(v));
      });
    }
    if (json['land_ownership'] != null) {
      landOwnership = <LandOwnership>[];
      json['land_ownership'].forEach((v) {
        landOwnership.add(new LandOwnership.fromJson(v));
      });
    }
    if (json['current_residence'] != null) {
      currentResidence = <CurrentResidence>[];
      json['current_residence'].forEach((v) {
        currentResidence.add(new CurrentResidence.fromJson(v));
      });
    }
    if (json['health_issue_status'] != null) {
      healthIssueStatus = <HealthIssueStatus>[];
      json['health_issue_status'].forEach((v) {
        healthIssueStatus.add(new HealthIssueStatus.fromJson(v));
      });
    }
    if (json['health_treatment'] != null) {
      healthTreatment = <HealthTreatment>[];
      json['health_treatment'].forEach((v) {
        healthTreatment.add(new HealthTreatment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.relationship != null) {
      data['relationship'] = this.relationship.map((v) => v.toJson()).toList();
    }
    if (this.gender != null) {
      data['gender'] = this.gender.map((v) => v.toJson()).toList();
    }
    if (this.education != null) {
      data['education'] = this.education.map((v) => v.toJson()).toList();
    }
    if (this.occupation != null) {
      data['occupation'] = this.occupation.map((v) => v.toJson()).toList();
    }
    if (this.maritalStatus != null) {
      data['marital_status'] =
          this.maritalStatus.map((v) => v.toJson()).toList();
    }
    if (this.landOwnership != null) {
      data['land_ownership'] =
          this.landOwnership.map((v) => v.toJson()).toList();
    }
    if (this.currentResidence != null) {
      data['current_residence'] =
          this.currentResidence.map((v) => v.toJson()).toList();
    }
    if (this.healthIssueStatus != null) {
      data['health_issue_status'] =
          this.healthIssueStatus.map((v) => v.toJson()).toList();
    }
    if (this.healthTreatment != null) {
      data['health_treatment'] =
          this.healthTreatment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Relationship {
  int relationshipId;
  String relationship;

  Relationship({this.relationshipId, this.relationship});

  Relationship.fromJson(Map<String, dynamic> json) {
    relationshipId = json['relationshipId'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relationshipId'] = this.relationshipId;
    data['relationship'] = this.relationship;
    return data;
  }
}

class Gender {
  int genderId;
  String gender;

  Gender({this.genderId, this.gender});

  Gender.fromJson(Map<String, dynamic> json) {
    genderId = json['genderId'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genderId'] = this.genderId;
    data['gender'] = this.gender;
    return data;
  }
}

class Education {
  int educationId;
  String educationName;

  Education({this.educationId, this.educationName});

  Education.fromJson(Map<String, dynamic> json) {
    educationId = json['educationId'];
    educationName = json['educationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['educationId'] = this.educationId;
    data['educationName'] = this.educationName;
    return data;
  }
}

class Occupation {
  int occupationId;
  String occupationName;

  Occupation({this.occupationId, this.occupationName});

  Occupation.fromJson(Map<String, dynamic> json) {
    occupationId = json['occupationId'];
    occupationName = json['occupationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occupationId'] = this.occupationId;
    data['occupationName'] = this.occupationName;
    return data;
  }
}

class MaritalStatus {
  int maritalStatusId;
  String maritalStatus;

  MaritalStatus({this.maritalStatusId, this.maritalStatus});

  MaritalStatus.fromJson(Map<String, dynamic> json) {
    maritalStatusId = json['maritalStatusId'];
    maritalStatus = json['maritalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maritalStatusId'] = this.maritalStatusId;
    data['maritalStatus'] = this.maritalStatus;
    return data;
  }
}

class LandOwnership {
  int landOwnershipId;
  String landOwnership;

  LandOwnership({this.landOwnershipId, this.landOwnership});

  LandOwnership.fromJson(Map<String, dynamic> json) {
    landOwnershipId = json['landOwnershipId'];
    landOwnership = json['landOwnership'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['landOwnershipId'] = this.landOwnershipId;
    data['landOwnership'] = this.landOwnership;
    return data;
  }
}

class CurrentResidence {
  int residenceId;
  String residence;

  CurrentResidence({this.residenceId, this.residence});

  CurrentResidence.fromJson(Map<String, dynamic> json) {
    residenceId = json['residenceId'];
    residence = json['residence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['residenceId'] = this.residenceId;
    data['residence'] = this.residence;
    return data;
  }
}

class HealthIssueStatus {
  int healthIssueStatusId;
  String healthIssueStatus;

  HealthIssueStatus({this.healthIssueStatusId, this.healthIssueStatus});

  HealthIssueStatus.fromJson(Map<String, dynamic> json) {
    healthIssueStatusId = json['healthIssueStatusId'];
    healthIssueStatus = json['healthIssueStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['healthIssueStatusId'] = this.healthIssueStatusId;
    data['healthIssueStatus'] = this.healthIssueStatus;
    return data;
  }
}

class HealthTreatment {
  int healthTreatmentId;
  String healthTreatment;

  HealthTreatment({this.healthTreatmentId, this.healthTreatment});

  HealthTreatment.fromJson(Map<String, dynamic> json) {
    healthTreatmentId = json['healthTreatmentId'];
    healthTreatment = json['healthTreatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['healthTreatmentId'] = this.healthTreatmentId;
    data['healthTreatment'] = this.healthTreatment;
    return data;
  }
}