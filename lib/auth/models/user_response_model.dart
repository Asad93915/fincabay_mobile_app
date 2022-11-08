class UserResponseModel {
  int? status;
  String? message;
  UserModel? data;

  UserResponseModel({this.status, this.message, this.data});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? name;
  String? roleName;
  String? password;
  Null? phone;
  String? city;
  String? country;
  Null? signingUp;
  bool? isAgent;
  bool? isActive;
  Null? agencyName;
  Null? dealCity;
  Null? dealMobileNumber;
  Null? companyPhone;
  Null? companyFax;
  Null? companyEmail;
  Null? servicesDescription;
  Null? agentEmail;
  Null? areaName;
  Null? address;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  Null? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  UserModel(
      {this.name,
        this.roleName,
        this.password,
        this.phone,
        this.city,
        this.country,
        this.signingUp,
        this.isAgent,
        this.isActive,
        this.agencyName,
        this.dealCity,
        this.dealMobileNumber,
        this.companyPhone,
        this.companyFax,
        this.companyEmail,
        this.servicesDescription,
        this.agentEmail,
        this.areaName,
        this.address,
        this.id,
        this.userName,
        this.normalizedUserName,
        this.email,
        this.normalizedEmail,
        this.emailConfirmed,
        this.passwordHash,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roleName = json['roleName'];
    password = json['password'];
    phone = json['phone'];
    city = json['city'];
    country = json['country'];
    signingUp = json['signing_up'];
    isAgent = json['isAgent'];
    isActive = json['isActive'];
    agencyName = json['agency_Name'];
    dealCity = json['deal_City'];
    dealMobileNumber = json['deal_MobileNumber'];
    companyPhone = json['company_Phone'];
    companyFax = json['company_Fax'];
    companyEmail = json['company_Email'];
    servicesDescription = json['services_Description'];
    agentEmail = json['agentEmail'];
    areaName = json['areaName'];
    address = json['address'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['roleName'] = this.roleName;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['country'] = this.country;
    data['signing_up'] = this.signingUp;
    data['isAgent'] = this.isAgent;
    data['isActive'] = this.isActive;
    data['agency_Name'] = this.agencyName;
    data['deal_City'] = this.dealCity;
    data['deal_MobileNumber'] = this.dealMobileNumber;
    data['company_Phone'] = this.companyPhone;
    data['company_Fax'] = this.companyFax;
    data['company_Email'] = this.companyEmail;
    data['services_Description'] = this.servicesDescription;
    data['agentEmail'] = this.agentEmail;
    data['areaName'] = this.areaName;
    data['address'] = this.address;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
    data['normalizedEmail'] = this.normalizedEmail;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['concurrencyStamp'] = this.concurrencyStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['lockoutEnd'] = this.lockoutEnd;
    data['lockoutEnabled'] = this.lockoutEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    return data;
  }
}
