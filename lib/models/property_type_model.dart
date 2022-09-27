class PropertyTypeModel {
  int? status;
  String? message;
  List<PropertyType>? data;

  PropertyTypeModel({this.status, this.message, this.data});

  PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PropertyType>[];
      json['data'].forEach((v) {
        data!.add(new PropertyType.fromJson(v));
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

class PropertyType {
  int? pTypeId;
  String? type;

  PropertyType({this.pTypeId, this.type});

  PropertyType.fromJson(Map<String, dynamic> json) {
    pTypeId = json['pTypeId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pTypeId'] = this.pTypeId;
    data['type'] = this.type;
    return data;
  }
}
