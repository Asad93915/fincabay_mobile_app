
class PlotTypeModel {
  int? status;
  String? message;
  List<PlotType>? data;

  PlotTypeModel({this.status, this.message, this.data});

  PlotTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PlotType>[];
      json['data'].forEach((v) {
        data!.add(new PlotType.fromJson(v));
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

class PlotType {
  String? plotType;

  PlotType({this.plotType});

  PlotType.fromJson(Map<String, dynamic> json) {
    plotType = json['areaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['areaType'] = this.plotType;
    return data;
  }
}
