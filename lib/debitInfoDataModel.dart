class DebitInfoDataModel {
  bool status;
  String message;
  Data data;

  DebitInfoDataModel({this.status, this.message, this.data});

  DebitInfoDataModel.fromJson(Map<String, dynamic> json) {
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
  List<Bank> bank;
  List<FinanceFirm> financeFirm;

  Data({this.bank, this.financeFirm});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bank'] != null) {
      bank = new List<Bank>();
      json['bank'].forEach((v) {
        bank.add(new Bank.fromJson(v));
      });
    }
    if (json['finance_firm'] != null) {
      financeFirm = new List<FinanceFirm>();
      json['finance_firm'].forEach((v) {
        financeFirm.add(new FinanceFirm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bank != null) {
      data['bank'] = this.bank.map((v) => v.toJson()).toList();
    }
    if (this.financeFirm != null) {
      data['finance_firm'] = this.financeFirm.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  int bankId;
  String bankName;

  Bank({this.bankId, this.bankName});

  Bank.fromJson(Map<String, dynamic> json) {
    bankId = json['bank_id'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_id'] = this.bankId;
    data['bank_name'] = this.bankName;
    return data;
  }
}

class FinanceFirm {
  int financeId;
  String finance;

  FinanceFirm({this.financeId, this.finance});

  FinanceFirm.fromJson(Map<String, dynamic> json) {
    financeId = json['finance_id'];
    finance = json['finance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['finance_id'] = this.financeId;
    data['finance'] = this.finance;
    return data;
  }
}