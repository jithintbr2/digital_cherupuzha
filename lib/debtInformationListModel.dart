class DebtInformationListModel {
  bool status;
  String message;
  Data data;

  DebtInformationListModel({this.status, this.message, this.data});

  DebtInformationListModel.fromJson(Map<String, dynamic> json) {
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
  int id;
  int masterHeadId;
  String houseNumber;
  String mobileNumber;
  String debtTakenFromBank;
  int bankId;
  String bankName;
  String debtTakenFromFinance;
  int financeId;
  String finance;
  String memberInSocialOrganization;
  String organizationName;

  Data(
      {this.id,
        this.masterHeadId,
        this.houseNumber,
        this.mobileNumber,
        this.debtTakenFromBank,
        this.bankId,
        this.bankName,
        this.debtTakenFromFinance,
        this.financeId,
        this.finance,
        this.memberInSocialOrganization,
        this.organizationName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masterHeadId = json['masterHeadId'];
    houseNumber = json['houseNumber'];
    mobileNumber = json['mobileNumber'];
    debtTakenFromBank = json['debtTakenFromBank'];
    bankId = json['bankId'];
    bankName = json['bankName'];
    debtTakenFromFinance = json['debtTakenFromFinance'];
    financeId = json['financeId'];
    finance = json['finance'];
    memberInSocialOrganization = json['member_in_social_organization'];
    organizationName = json['organization_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masterHeadId'] = this.masterHeadId;
    data['houseNumber'] = this.houseNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['debtTakenFromBank'] = this.debtTakenFromBank;
    data['bankId'] = this.bankId;
    data['bankName'] = this.bankName;
    data['debtTakenFromFinance'] = this.debtTakenFromFinance;
    data['financeId'] = this.financeId;
    data['finance'] = this.finance;
    data['member_in_social_organization'] = this.memberInSocialOrganization;
    data['organization_name'] = this.organizationName;
    return data;
  }
}