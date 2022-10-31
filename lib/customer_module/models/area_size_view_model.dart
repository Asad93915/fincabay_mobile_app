class AreaSizeViewModel {
  int? status;
  String? message;
  List<AreaSizeView>? data;

  AreaSizeViewModel({this.status, this.message, this.data});

  AreaSizeViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaSizeView>[];
      json['data'].forEach((v) {
        data!.add(new AreaSizeView.fromJson(v));
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

class AreaSizeView {
  int? id;
  String? propertyTitle;
  String? category;
  String? content;
  String? propertyType;
  int? pTypeId;
  String? purpose;
  String? landArea;
  String? unit;
  int? noOfBeds;
  int? noOfBaths;
  String? expireAfter;
  Null? uploadImage;
  String? imageByPath;
  Null? uploadVideo;
  String? videoByPath;
  String? city;
  int? cityId;
  String? area;
  int? locationPhaseId;
  int? areaSizeID;
  int? areaId;
  String? detailAddress;
  double? amount;
  String? description;
  String? propertyStatus;
  String? propertySize;
  bool? isApproved;
  bool? isRejected;
  bool? isPending;
  String? userId;
  String? userEmail;
  Null? signUpUserEmail;
  Null? userPassword;
  Null? signUpUserName;
  Null? mobile;
  Null? signUpAs;
  bool? isLogin;
  bool? isSignUp;

  AreaSizeView(
      {this.id,
        this.propertyTitle,
        this.category,
        this.content,
        this.propertyType,
        this.pTypeId,
        this.purpose,
        this.landArea,
        this.unit,
        this.noOfBeds,
        this.noOfBaths,
        this.expireAfter,
        this.uploadImage,
        this.imageByPath,
        this.uploadVideo,
        this.videoByPath,
        this.city,
        this.cityId,
        this.area,
        this.locationPhaseId,
        this.areaSizeID,
        this.areaId,
        this.detailAddress,
        this.amount,
        this.description,
        this.propertyStatus,
        this.propertySize,
        this.isApproved,
        this.isRejected,
        this.isPending,
        this.userId,
        this.userEmail,
        this.signUpUserEmail,
        this.userPassword,
        this.signUpUserName,
        this.mobile,
        this.signUpAs,
        this.isLogin,
        this.isSignUp});

  AreaSizeView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyTitle = json['propertyTitle'];
    category = json['category'];
    content = json['content'];
    propertyType = json['propertyType'];
    pTypeId = json['pTypeId'];
    purpose = json['purpose'];
    landArea = json['landArea'];
    unit = json['unit'];
    noOfBeds = json['noOfBeds'];
    noOfBaths = json['noOfBaths'];
    expireAfter = json['expireAfter'];
    uploadImage = json['uploadImage'];
    imageByPath = json['imageByPath'];
    uploadVideo = json['uploadVideo'];
    videoByPath = json['videoByPath'];
    city = json['city'];
    cityId = json['cityId'];
    area = json['area'];
    locationPhaseId = json['locationPhaseId'];
    areaSizeID = json['areaSizeID'];
    areaId = json['areaId'];
    detailAddress = json['detailAddress'];
    amount = json['amount'];
    description = json['description'];
    propertyStatus = json['propertyStatus'];
    propertySize = json['propertySize'];
    isApproved = json['isApproved'];
    isRejected = json['isRejected'];
    isPending = json['isPending'];
    userId = json['userId'];
    userEmail = json['userEmail'];
    signUpUserEmail = json['signUpUserEmail'];
    userPassword = json['userPassword'];
    signUpUserName = json['signUpUserName'];
    mobile = json['mobile'];
    signUpAs = json['signUpAs'];
    isLogin = json['isLogin'];
    isSignUp = json['isSignUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propertyTitle'] = this.propertyTitle;
    data['category'] = this.category;
    data['content'] = this.content;
    data['propertyType'] = this.propertyType;
    data['pTypeId'] = this.pTypeId;
    data['purpose'] = this.purpose;
    data['landArea'] = this.landArea;
    data['unit'] = this.unit;
    data['noOfBeds'] = this.noOfBeds;
    data['noOfBaths'] = this.noOfBaths;
    data['expireAfter'] = this.expireAfter;
    data['uploadImage'] = this.uploadImage;
    data['imageByPath'] = this.imageByPath;
    data['uploadVideo'] = this.uploadVideo;
    data['videoByPath'] = this.videoByPath;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['area'] = this.area;
    data['locationPhaseId'] = this.locationPhaseId;
    data['areaSizeID'] = this.areaSizeID;
    data['areaId'] = this.areaId;
    data['detailAddress'] = this.detailAddress;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['propertyStatus'] = this.propertyStatus;
    data['propertySize'] = this.propertySize;
    data['isApproved'] = this.isApproved;
    data['isRejected'] = this.isRejected;
    data['isPending'] = this.isPending;
    data['userId'] = this.userId;
    data['userEmail'] = this.userEmail;
    data['signUpUserEmail'] = this.signUpUserEmail;
    data['userPassword'] = this.userPassword;
    data['signUpUserName'] = this.signUpUserName;
    data['mobile'] = this.mobile;
    data['signUpAs'] = this.signUpAs;
    data['isLogin'] = this.isLogin;
    data['isSignUp'] = this.isSignUp;
    return data;
  }
}
