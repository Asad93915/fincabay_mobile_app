class LocationPhasesModel {
  int? status;
  String? message;
  List<Location>? data;

  LocationPhasesModel({this.status, this.message, this.data});

  LocationPhasesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Location>[];
      json['data'].forEach((v) {
        data!.add(new Location.fromJson(v));
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

class Location {
  int? phaseId;
  String? name;
  int? locationId;
  String? locationName;
  Null? titleImage;
  String? titleImageByPath;

  Location(
      {this.phaseId,
        this.name,
        this.locationId,
        this.locationName,
        this.titleImage,
        this.titleImageByPath});

  Location.fromJson(Map<String, dynamic> json) {
    phaseId = json['phaseId'];
    name = json['name'];
    locationId = json['locationId'];
    locationName = json['locationName'];
    titleImage = json['titleImage'];
    titleImageByPath = json['titleImageByPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phaseId'] = this.phaseId;
    data['name'] = this.name;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['titleImage'] = this.titleImage;
    data['titleImageByPath'] = this.titleImageByPath;
    return data;
  }
}
