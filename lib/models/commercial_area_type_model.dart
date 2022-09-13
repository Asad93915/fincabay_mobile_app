class CommercialAreaTypeModel {
  int? status;
  String? message;
  List<CommercialAreaType>? data;

  CommercialAreaTypeModel({this.status, this.message, this.data});

  CommercialAreaTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CommercialAreaType>[];
      json['data'].forEach((v) {
        data!.add(new CommercialAreaType.fromJson(v));
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

class CommercialAreaType {
  String? commercialAreaType;

  CommercialAreaType({this.commercialAreaType});

  CommercialAreaType.fromJson(Map<String, dynamic> json) {
    commercialAreaType = json['commercialAreaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commercialAreaType'] = this.commercialAreaType;
    return data;
  }
}
