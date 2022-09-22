class CitiesModel {
  int? status;
  String? message;
  List<Cities>? data;

  CitiesModel({this.status, this.message, this.data});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Cities>[];
      json['data'].forEach((v) {
        data!.add(new Cities.fromJson(v));
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

class Cities {
  int? cityId;
  String? name;

  Cities({this.cityId, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['name'] = this.name;
    return data;
  }
}
