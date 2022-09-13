class AreaSizeModel {
  int? status;
  String? message;
  List<AreaSize>? data;

  AreaSizeModel({this.status, this.message, this.data});

  AreaSizeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaSize>[];
      json['data'].forEach((v) {
        data!.add(new AreaSize.fromJson(v));
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

class AreaSize {
  String? totalArea;
  String? areaType;

  AreaSize({this.totalArea, this.areaType});

  AreaSize.fromJson(Map<String, dynamic> json) {
    totalArea = json['totalArea'];
    areaType = json['areaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalArea'] = this.totalArea;
    data['areaType'] = this.areaType;
    return data;
  }
}