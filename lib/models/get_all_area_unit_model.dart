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
  int? areaId;
  String? areaName;
  int? cityId;

  AreaUnit({this.areaId, this.areaName, this.cityId});

  AreaUnit.fromJson(Map<String, dynamic> json) {
    areaId = json['areaId'];
    areaName = json['areaName'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaId'] = this.areaId;
    data['areaName'] = this.areaName;
    data['cityId'] = this.cityId;
    return data;
  }
}
