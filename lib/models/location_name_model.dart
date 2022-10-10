class LocationNamesModel {
  int? status;
  String? message;
  List<LocationName>? data;

  LocationNamesModel({this.status, this.message, this.data});

  LocationNamesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LocationName>[];
      json['data'].forEach((v) {
        data!.add(new LocationName.fromJson(v));
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

class LocationName {
  int? areaId;
  String? areaName;
  int? cityId;

  LocationName({this.areaId, this.areaName, this.cityId});

  LocationName.fromJson(Map<String, dynamic> json) {
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
