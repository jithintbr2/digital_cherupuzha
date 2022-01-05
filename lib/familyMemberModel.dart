class FamilyMemberModel {
  bool status;
  String message;
  List<Data> data;

  FamilyMemberModel({this.status, this.message, this.data});

  FamilyMemberModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
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
  int memberId;
  int masterHeadId;
  String name;
  int relationId;
  String relationship;
  int age;
  int genderId;
  String gender;
  int educationId;
  String educationName;
  int occupationId;
  String occupation;
  String maritalStatus;
  int currentResidenceId;
  String place;
  String state;
  String city;
  String country;
  String currentResidence;
  int landInCentId;
  String landInCent;
  int healthIssueId;
  String healthIssue;
  String whatHealthIssue;
  String isUnderTreatment;
  String treatmentType;
  String treatmentInstitution;
  int medicationPrice;

  Data(
      {this.memberId,
        this.masterHeadId,
        this.name,
        this.relationId,
        this.relationship,
        this.age,
        this.genderId,
        this.gender,
        this.educationId,
        this.educationName,
        this.occupationId,
        this.occupation,
        this.maritalStatus,
        this.currentResidenceId,
        this.place,
        this.state,
        this.city,
        this.country,
        this.currentResidence,
        this.landInCentId,
        this.landInCent,
        this.healthIssueId,
        this.healthIssue,
        this.whatHealthIssue,
        this.isUnderTreatment,
        this.treatmentType,
        this.treatmentInstitution,
        this.medicationPrice});

  Data.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    masterHeadId = json['masterHeadId'];
    name = json['name'];
    relationId = json['relation_id'];
    relationship = json['relationship'];
    age = json['age'];
    genderId = json['gender_id'];
    gender = json['gender'];
    educationId = json['education_id'];
    educationName = json['educationName'];
    occupationId = json['occupation_id'];
    occupation = json['occupation'];
    maritalStatus = json['maritalStatus'];
    currentResidenceId = json['currentResidenceId'];
    place = json['place'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    currentResidence = json['currentResidence'];
    landInCentId = json['landInCentId'];
    landInCent = json['landInCent'];
    healthIssueId = json['HealthIssueId'];
    healthIssue = json['HealthIssue'];
    whatHealthIssue = json['whatHealthIssue'];
    isUnderTreatment = json['isUnderTreatment'];
    treatmentType = json['treatmentType'];
    treatmentInstitution = json['treatmentInstitution'];
    medicationPrice = json['medicationPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberId'] = this.memberId;
    data['masterHeadId'] = this.masterHeadId;
    data['name'] = this.name;
    data['relation_id'] = this.relationId;
    data['relationship'] = this.relationship;
    data['age'] = this.age;
    data['gender_id'] = this.genderId;
    data['gender'] = this.gender;
    data['education_id'] = this.educationId;
    data['educationName'] = this.educationName;
    data['occupation_id'] = this.occupationId;
    data['occupation'] = this.occupation;
    data['maritalStatus'] = this.maritalStatus;
    data['currentResidenceId'] = this.currentResidenceId;
    data['place'] = this.place;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['currentResidence'] = this.currentResidence;
    data['landInCentId'] = this.landInCentId;
    data['landInCent'] = this.landInCent;
    data['HealthIssueId'] = this.healthIssueId;
    data['HealthIssue'] = this.healthIssue;
    data['whatHealthIssue'] = this.whatHealthIssue;
    data['isUnderTreatment'] = this.isUnderTreatment;
    data['treatmentType'] = this.treatmentType;
    data['treatmentInstitution'] = this.treatmentInstitution;
    data['medicationPrice'] = this.medicationPrice;
    return data;
  }
}