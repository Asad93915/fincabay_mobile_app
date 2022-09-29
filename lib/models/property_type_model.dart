class PropertyTypeModel {
  int? pTypeId;
  String? type;
  String? category;

  PropertyTypeModel({this.pTypeId, this.type, this.category});

  PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    pTypeId = json['pTypeId'];
    type = json['type'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pTypeId'] = this.pTypeId;
    data['type'] = this.type;
    data['category'] = this.category;
    return data;
  }
}
