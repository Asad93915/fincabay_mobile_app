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
  int? unitId;
  String? name;

  AreaUnit({this.unitId, this.name});

  AreaUnit.fromJson(Map<String, dynamic> json) {
    unitId = json['unitId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unitId'] = this.unitId;
    data['name'] = this.name;
    return data;
  }
}
