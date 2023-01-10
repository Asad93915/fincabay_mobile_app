class PropertyTypeModel {
  int? status;
  String? message;
  List<PropertyTypeList>? data;

  PropertyTypeModel({this.status, this.message, this.data});

  PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PropertyTypeList>[];
      json['data'].forEach((v) {
        data!.add(new PropertyTypeList.fromJson(v));
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

class PropertyTypeList {
  int? pTypeId;
  String? type;
  String? category;

  PropertyTypeList({this.pTypeId, this.type, this.category});

  PropertyTypeList.fromJson(Map<String, dynamic> json) {
    pTypeId = json['pTypeId'];
    type = json['type'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pTypeId'] = this.pTypeId;
    data['type'] = this.type;
    data['category'] = this.category;
    return data;
  }
}
