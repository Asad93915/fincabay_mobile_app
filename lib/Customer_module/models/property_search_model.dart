class PropertySearchModel {
  int? status;
  String? message;
  List<PropertySearch>? data;

  PropertySearchModel({this.status, this.message, this.data});

  PropertySearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PropertySearch>[];
      json['data'].forEach((v) {
        data!.add(new PropertySearch.fromJson(v));
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

class PropertySearch {
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
  String? imageUploadString;
  String? uploadImage;
  String? imageByPath;
  String? videoUploadString;
  String? uploadVideo;
  String? videoByPath;
  Null? city;
  int? cityId;
  Null? area;
  int? locationPhaseId;
  int? areaSizeID;
  Null? areaSize;
  int? areaId;
  String? detailAddress;
  double? amount;
  String? description;
  String? propertyStatus;
  int? propertySize;
  bool? isApproved;
  bool? isRejected;
  bool? isPending;
  String? userId;
  String? userEmail;
  String? userMobile;
  String? roleName;
  List<PropertyImages>? propertyImages;
  String? signUpUserEmail;
  String? userPassword;
  String? signUpUserName;
  String? mobile;
  String? signUpAs;
  bool? isLogin;
  bool? isSignUp;
  Null? imageIformFile;
  Null? bytesList;

  PropertySearch(
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
        this.imageUploadString,
        this.uploadImage,
        this.imageByPath,
        this.videoUploadString,
        this.uploadVideo,
        this.videoByPath,
        this.city,
        this.cityId,
        this.area,
        this.locationPhaseId,
        this.areaSizeID,
        this.areaSize,
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
        this.userMobile,
        this.roleName,
        this.propertyImages,
        this.signUpUserEmail,
        this.userPassword,
        this.signUpUserName,
        this.mobile,
        this.signUpAs,
        this.isLogin,
        this.isSignUp,
        this.imageIformFile,
        this.bytesList});

  PropertySearch.fromJson(Map<String, dynamic> json) {
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
    imageUploadString = json['imageUploadString'];
    uploadImage = json['uploadImage'];
    imageByPath = json['imageByPath'];
    videoUploadString = json['videoUploadString'];
    uploadVideo = json['uploadVideo'];
    videoByPath = json['videoByPath'];
    city = json['city'];
    cityId = json['cityId'];
    area = json['area'];
    locationPhaseId = json['locationPhaseId'];
    areaSizeID = json['areaSizeID'];
    areaSize = json['areaSize'];
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
    userMobile = json['userMobile'];
    roleName = json['roleName'];
    if (json['propertyImages'] != null) {
      propertyImages = <PropertyImages>[];
      json['propertyImages'].forEach((v) {
        propertyImages!.add(new PropertyImages.fromJson(v));
      });
    }
    signUpUserEmail = json['signUpUserEmail'];
    userPassword = json['userPassword'];
    signUpUserName = json['signUpUserName'];
    mobile = json['mobile'];
    signUpAs = json['signUpAs'];
    isLogin = json['isLogin'];
    isSignUp = json['isSignUp'];
    imageIformFile = json['imageIformFile'];
    bytesList = json['bytesList'];
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
    data['imageUploadString'] = this.imageUploadString;
    data['uploadImage'] = this.uploadImage;
    data['imageByPath'] = this.imageByPath;
    data['videoUploadString'] = this.videoUploadString;
    data['uploadVideo'] = this.uploadVideo;
    data['videoByPath'] = this.videoByPath;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['area'] = this.area;
    data['locationPhaseId'] = this.locationPhaseId;
    data['areaSizeID'] = this.areaSizeID;
    data['areaSize'] = this.areaSize;
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
    data['userMobile'] = this.userMobile;
    data['roleName'] = this.roleName;
    if (this.propertyImages != null) {
      data['propertyImages'] =
          this.propertyImages!.map((v) => v.toJson()).toList();
    }
    data['signUpUserEmail'] = this.signUpUserEmail;
    data['userPassword'] = this.userPassword;
    data['signUpUserName'] = this.signUpUserName;
    data['mobile'] = this.mobile;
    data['signUpAs'] = this.signUpAs;
    data['isLogin'] = this.isLogin;
    data['isSignUp'] = this.isSignUp;
    data['imageIformFile'] = this.imageIformFile;
    data['bytesList'] = this.bytesList;
    return data;
  }
}

class PropertyImages {
  int? id;
  int? propertyId;
  String? imageURL;
  Null? videoURL;
  String? dateTime;

  PropertyImages(
      {this.id, this.propertyId, this.imageURL, this.videoURL, this.dateTime});

  PropertyImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['propertyId'];
    imageURL = json['imageURL'];
    videoURL = json['videoURL'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propertyId'] = this.propertyId;
    data['imageURL'] = this.imageURL;
    data['videoURL'] = this.videoURL;
    data['dateTime'] = this.dateTime;
    return data;
  }
}
