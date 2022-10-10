class GetAllAreaUnitModel {
  int? status;
  String? message;
  List<AreaUnit>? data;

  GetAllAreaUnitModel({this.status, this.message, this.data});

  GetAllAreaUnitModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaUnit>[];
      json['data'].forEach((v) {
        data!.add(new AreaUnit.fromJson(v));
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

class AreaUnit {
  int? id;
  String? name;
  String? category;

  AreaUnit({this.id, this.name, this.category});

  AreaUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    return data;
  }
}
