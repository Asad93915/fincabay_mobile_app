class AgentsListModel {
  int? status;
  String? message;
  List<AgentsList>? data;

  AgentsListModel({this.status, this.message, this.data});

  AgentsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AgentsList>[];
      json['data'].forEach((v) {
        data!.add(new AgentsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgentsList {
  int? id;
  String? agencyName;
  String? dealCity;
  String? dealMobileNumber;
  String? companyPhone;
  String? companyFax;
  String? companyEmail;
  String? servicesDescription;
  String? roleName;
  String? userEmail;
  bool? isApproved;
  bool? isRejected;
  bool? isPending;

  AgentsList(
      {this.id,
        this.agencyName,
        this.dealCity,
        this.dealMobileNumber,
        this.companyPhone,
        this.companyFax,
        this.companyEmail,
        this.servicesDescription,
        this.roleName,
        this.userEmail,
        this.isApproved,
        this.isRejected,
        this.isPending});

  AgentsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyName = json['agency_Name'];
    dealCity = json['deal_City'];
    dealMobileNumber = json['deal_MobileNumber'];
    companyPhone = json['company_Phone'];
    companyFax = json['company_Fax'];
    companyEmail = json['company_Email'];
    servicesDescription = json['services_Description'];
    roleName = json['roleName'];
    userEmail = json['userEmail'];
    isApproved = json['isApproved'];
    isRejected = json['isRejected'];
    isPending = json['isPending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_Name'] = this.agencyName;
    data['deal_City'] = this.dealCity;
    data['deal_MobileNumber'] = this.dealMobileNumber;
    data['company_Phone'] = this.companyPhone;
    data['company_Fax'] = this.companyFax;
    data['company_Email'] = this.companyEmail;
    data['services_Description'] = this.servicesDescription;
    data['roleName'] = this.roleName;
    data['userEmail'] = this.userEmail;
    data['isApproved'] = this.isApproved;
    data['isRejected'] = this.isRejected;
    data['isPending'] = this.isPending;
    return data;
  }
}

