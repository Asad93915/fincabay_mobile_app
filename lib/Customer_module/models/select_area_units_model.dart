class SelecteAreaUnitModel {
  int? status;
  String? message;
  List<AreaUnits>? data;

  SelecteAreaUnitModel({this.status, this.message, this.data});

  SelecteAreaUnitModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaUnits>[];
      json['data'].forEach((v) {
        data!.add(new AreaUnits.fromJson(v));
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

class AreaUnits {
  int? id;
  String? name;
  String? category;

  AreaUnits({this.id, this.name, this.category});

  AreaUnits.fromJson(Map<String, dynamic> json) {
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
