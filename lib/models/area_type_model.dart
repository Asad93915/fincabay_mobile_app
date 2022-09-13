class AreaTypeModel {
  int? status;
  String? message;
  List<AreaType>? data;

  AreaTypeModel({this.status, this.message, this.data});

  AreaTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaType>[];
      json['data'].forEach((v) {
        data!.add(new AreaType.fromJson(v));
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

class AreaType {
  String? areaType;

  AreaType({this.areaType});

  AreaType.fromJson(Map<String, dynamic> json) {
    areaType = json['areaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['areaType'] = this.areaType;
    return data;
  }
}
