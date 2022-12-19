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
  int? id;
  String? name;
  String? category;

  AreaSize({this.id, this.name, this.category});

  AreaSize.fromJson(Map<String, dynamic> json) {
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
