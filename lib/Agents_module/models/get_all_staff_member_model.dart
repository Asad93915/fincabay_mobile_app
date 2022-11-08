class AllStaffMemberModel {
  int? status;
  String? message;
  List<StaffMember>? data;

  AllStaffMemberModel({this.status, this.message, this.data});

  AllStaffMemberModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StaffMember>[];
      json['data'].forEach((v) {
        data!.add(new StaffMember.fromJson(v));
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

class StaffMember {
  int? id;
  String? contactPerson;
  String? email;
  String? password;
  String? mobile;
  String? address;
  String? agentEmail;
  String? areaName;
  bool? isApproved;
  bool? isRejected;
  bool? isPending;
  Null? signingUp;
  Null? city;
  Null? country;
  String? roleName;

  StaffMember(
      {this.id,
        this.contactPerson,
        this.email,
        this.password,
        this.mobile,
        this.address,
        this.agentEmail,
        this.areaName,
        this.isApproved,
        this.isRejected,
        this.isPending,
        this.signingUp,
        this.city,
        this.country,
        this.roleName});

  StaffMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactPerson = json['contactPerson'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    address = json['address'];
    agentEmail = json['agentEmail'];
    areaName = json['areaName'];
    isApproved = json['isApproved'];
    isRejected = json['isRejected'];
    isPending = json['isPending'];
    signingUp = json['signingUp'];
    city = json['city'];
    country = json['country'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contactPerson'] = this.contactPerson;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['agentEmail'] = this.agentEmail;
    data['areaName'] = this.areaName;
    data['isApproved'] = this.isApproved;
    data['isRejected'] = this.isRejected;
    data['isPending'] = this.isPending;
    data['signingUp'] = this.signingUp;
    data['city'] = this.city;
    data['country'] = this.country;
    data['roleName'] = this.roleName;
    return data;
  }
}
