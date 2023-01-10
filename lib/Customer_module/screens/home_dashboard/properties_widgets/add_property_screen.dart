import 'dart:async';
import 'dart:io';
import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:fincabay_application/Agents_module/services/agents_add_property_service.dart';
import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/Customer_module/providers/select_area_units_provider.dart';
import 'package:fincabay_application/Customer_module/services/select_area_unit_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_drop_down.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/utils/Functions.dart';
import 'package:fincabay_application/utils/handlers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../configs/text_styles.dart';
import '../../../../helper_services/custom_snackbar.dart';
import '../../../../helper_widgets/custom_dropdown_text.dart';
import '../../../../helper_widgets/custom_uploading_widget.dart';
import '../../../providers/cities_provider.dart';
import '../../../providers/location_name_provider.dart';
import '../../../providers/property_type_provider.dart';
import '../../../services/add_property_service.dart';
import '../../../services/cities_service.dart';
import '../../../services/location_name_service.dart';
import '../../../services/property_typer_service.dart';

class AddPropertyScreen extends StatefulWidget {
  final bool isSelected;
  final String userEmail;

  AddPropertyScreen({this.isSelected = true, required this.userEmail});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  // List<PickedFile>? galleryFile;
  // File? imageFile;
  List<String> uploadMultImagesBytes = [];

  // List<int> propertyCameraBytes = [];
  //
  // PickedFile? fromCamera;
  // List<PickedFile> cameraFile=[];
  List<PickedFile> imagesList = [];

  String? selectedProperty;
  int? selectedPropType;
  List<String> propertyTypeList = ["Home", "Plots", "Commercial"];
  String selectedPurpose = "";
  List<String> purposeList = ["Sell", "Rent Out"];

  String selectedExpiration = "";
  List<String> expiryList = [
    "After one week",
    "After two week",
    "After one month"
  ];

  String selectedWhoIAm = "";
  List<String> whoIamList = [
    "I'm a real estate agent",
    "I'm a real property owner"
  ];

  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  TextEditingController _regNameCont = TextEditingController();
  TextEditingController _regMobileCont = TextEditingController();
  TextEditingController _phoneNoCont = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _regNameFocus = FocusNode();
  FocusNode _regMobileFocus = FocusNode();
  FocusNode _phoneNoFocus = FocusNode();

  int selectedIndex = 1;

  _getCities() async {
    CustomLoader.showLoader(context: context);
    await CitiesService().getAllCities(context: context);
    CustomLoader.hideLoader(context);
  }

  getPropertyTypeHandler(String categoryType) async {
    CustomLoader.showLoader(context: context);
    await PropertyTypeService()
        .getPropertyType(context: context, categoryType: "$categoryType");
    CustomLoader.hideLoader(context);
  }

  _getAreaUnitsHandler() async {
    CustomLoader.showLoader(context: context);
    await SelectAreaUnitsService().selectUnit(context: context);
    CustomLoader.hideLoader(context);
  }

  _getLocNameHandler(int cityId) async {
    CustomLoader.showLoader(context: context);
    await GetLocationNameService().getLocName(context: context, cityId: cityId);
    print("City $cityId");
    CustomLoader.hideLoader(context);
  }

  postAddressHandler() async {
    CustomLoader.showLoader(context: context);

    widget.isSelected == true
        ? await AddPropertyService().addProperty(
            context: context,
            propertyTitle: _propTitleCont.text,
            content: _contentCont.text,
            propType: selectedProperty ?? "",
            propPurpose: selectedPurpose,
            price: _priceCont.text,
            landArea: _landAreaCont.text,
            unit: selectedUnit ?? "",
            noOfBeds: selectedProperty == 'Home' ? _noOfBedsCont.text : "0",
            noOfBaths: selectedProperty == "Home" ? _noOfBathsCont.text : '0',
            expiryDate: _expiryCont.text,
            cityId: _selectedCity ?? 1,
            uploadImage: uploadMultImagesBytes,
            areaId: selectedArea ?? 1,
            detailAddress: _addressCont.text,
            email: _emailCont.text,
            password: _passwordCont.text,
            name: _regNameCont.text,
            signUpAs: selectedWhoIAm,
            isLogin: selectedIndex == 0 ? true : false,
            isSignup: selectedIndex == 1 ? true : false,
            phoneNo: _phoneNoCont.text,
            pTypeId: selectedPropType.toString(),
          )
        : await AgentsAddPropertyService().addAgentProperty(
            context: context,
            propTitle: _propTitleCont.text,
            content: _contentCont.text,
            category: selectedProperty ?? "",
            purpose: selectedPurpose,
            price: _priceCont.text,
            landArea: _landAreaCont.text,
            unit: selectedUnit ?? "",
            noOfBeds: selectedProperty == 'Home' ? _noOfBedsCont.text : "0",
            noOfBaths: selectedProperty == "Home" ? _noOfBathsCont.text : '0',
            expiryDate: selectedExpiration,
            cityId: _selectedCity ?? 0,
            areaId: selectedArea ?? 0,
            detailsAddress: _addressCont.text,
            userEmail: widget.isSelected == false ? widget.userEmail : "",
            uploadImage: uploadMultImagesBytes,
            phoneNo: _phoneNoCont.text,
            pTypeId: selectedPropType ?? 0,
            uploadedVideo: []);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("Is Selected ${widget.isSelected}");
      _getCities();
      _getAreaUnitsHandler();

      initMethod();
    });
    setState(() {});
    super.initState();
  }

  String? selectedUnit;

  updateUnit(String value) {
    setState(() {
      selectedUnit = value;
    });
  }

  int? _selectedCity;

  updateCity(int value) {
    setState(() {
      _selectedCity = value;
    });
  }

  int? selectedArea;

  @override
  updateArea(int? value) async {
    selectedArea = value;

    setState(() {});
  }

  TextEditingController _propTitleCont = TextEditingController();
  TextEditingController _contentCont = TextEditingController();
  TextEditingController _priceCont = TextEditingController();
  TextEditingController _landAreaCont = TextEditingController();
  TextEditingController _noOfBedsCont = TextEditingController();
  TextEditingController _noOfBathsCont = TextEditingController();
  TextEditingController _expiryCont = TextEditingController();
  TextEditingController _addressCont = TextEditingController();

  FocusNode _propTitleFocus = FocusNode();
  FocusNode _contentFocus = FocusNode();
  FocusNode _priceFocus = FocusNode();
  FocusNode _landAreaFocus = FocusNode();
  FocusNode _noOfBedsFocus = FocusNode();
  FocusNode _noOfBathsFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  bool isShow = false;

  CameraPosition initCamerPosition =
      CameraPosition(target: LatLng(31.5204, 74.3587), zoom: 20.0);
  List<Marker> _markers = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(31.5204, 74.3587),
        infoWindow: InfoWindow(title: "My Location"))
  ];
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                title: Text(
                  "Post an Ad",
                ),
                backgroundColor: postColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeDashboardScreen());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: whiteColor,
                  ),
                ),
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/add_property_header.png",
                    fit: BoxFit.fill,
                  ),
                )
                // flexibleSpace: const FlexibleSpaceBar(
                //   title: Text('SliverAppBar'),
                //   background: FlutterLogo(),
                // ),
                ),
            SliverToBoxAdapter(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Property",
                    style: titleStyle,
                  ),
                  CustomTextField(
                    headerText: "Property Title",
                    controller: _propTitleCont,
                    focusNode: _propTitleFocus,
                    inputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    headerText: "Content",
                    controller: _contentCont,
                    focusNode: _contentFocus,
                    inputAction: TextInputAction.next,
                    maxLine: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropDownText(
                          text: "Select Property",
                        ),
                      ),
                      Expanded(
                        child: CustomDropDownText(
                          text: "Purpose",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropDown(
                          borderColor: selectedProperty == null
                              ? lightBlackColor
                              : bgColor,
                          child: DropdownButton(
                            value: selectedProperty,
                            isExpanded: true,
                            underline: SizedBox(),
                            hint: Text(
                              "Select Property",
                              style: TextStyle(
                                height: 1.0,
                              ),
                            ),
                            items: propertyTypeList.map((item) {
                              return DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              selectedProperty = value!;
                              if (selectedProperty!.contains('Home')) {
                                isShow = true;
                              } else {
                                isShow = false;
                              }
                              propertyTypeList.map((item) {
                                if (value == item) {
                                  if (selectedPropType == null) {
                                    getPropertyTypeHandler(item);
                                  } else {
                                    selectedPropType = null;
                                    getPropertyTypeHandler(item);
                                  }
                                  // cities.city!.clear();

                                }
                              }).toList();

                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomDropDown(
                          borderColor: selectedPurpose.isEmpty
                              ? lightBlackColor
                              : bgColor,
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            hint: Text(
                              selectedPurpose.isEmpty
                                  ? "Select Purpose"
                                  : selectedPurpose,
                              style: TextStyle(height: 1.0),
                            ),
                            items: purposeList.map((item) {
                              return DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              selectedPurpose = value!;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropDownText(
                          text: "Property Type",
                        ),
                      ),
                      Expanded(
                        child: CustomDropDownText(
                          text: "Price",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<PropertyTypeProvider>(
                          builder: (context, prop, _) {
                        return Expanded(
                          child: CustomDropDown(
                            borderColor: selectedPropType == null
                                ? lightBlackColor
                                : bgColor,
                            child: DropdownButton(
                              value: selectedPropType,
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text(
                                "Property Type",
                                style: TextStyle(
                                  height: 1.0,
                                ),
                              ),
                              items: prop.propertyType!.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item.type ?? ""),
                                  value: item.pTypeId,
                                );
                              }).toList(),
                              onChanged: (int? value) {
                                selectedPropType = value!;
                                print("Selected Prop Type $selectedPropType");

                                setState(() {});
                              },
                            ),
                          ),
                        );
                      }),
                      Expanded(
                        child: CustomTextField(
                          // headerText: "Price",
                          controller: _priceCont,
                          focusNode: _priceFocus,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropDownText(
                          text: "Land Area",
                        ),
                      ),
                      Expanded(
                        child: CustomDropDownText(
                          text: "Select Unit",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomTextField(
                        controller: _landAreaCont,
                        focusNode: _landAreaFocus,
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                      )),
                      Consumer<SelectAreaUnitsProvider>(
                          builder: (context, area, _) {
                        return Expanded(
                          child: CustomDropDown(
                            borderColor: selectedUnit == null
                                ? lightBlackColor
                                : bgColor,
                            child: DropdownButton(
                              value: selectedUnit,
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text(selectedUnit == null
                                  ? "Select Unit"
                                  : selectedUnit!),
                              items: area.areaUnit!.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item.name!),
                                  value: item.name,
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                updateUnit(newValue!);

                                setState(() {});
                              },
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                  isShow == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: CustomTextField(
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                              headerText: "No. of Beds",
                              focusNode: _noOfBedsFocus,
                              charLength: 2,
                              controller: _noOfBedsCont,
                              suffixIcon: Icons.bed_outlined,
                            )),
                            Expanded(
                                child: CustomTextField(
                              inputType: TextInputType.number,
                              headerText: "No. of Baths",
                              focusNode: _noOfBathsFocus,
                              controller: _noOfBathsCont,
                              suffixIcon: Icons.bathtub_outlined,
                              inputAction: TextInputAction.next,
                            )),
                          ],
                        )
                      : SizedBox(),
                  CustomDropDownText(
                    text: "Expire After",
                  ),
                  CustomDropDown(
                    borderColor:
                        selectedExpiration.isEmpty ? lightBlackColor : bgColor,
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text(selectedExpiration.isEmpty
                          ? "Select Expiration Date"
                          : selectedExpiration),
                      items: expiryList.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        selectedExpiration = value!;

                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: black12,
                        ),
                        child: Icon(
                          Icons.photo,
                          size: 20.0,
                        ),
                      ),
                      SizedBox(width: 13.0),
                      Text("Upload image of your property", style: imageStyle),
                    ],
                  ),
                  CustomUploadingWidget(
                    suggestionText:
                        "Upload good quality picture with proper lighting",
                  ),
                  CustomUploadingWidget(
                    suggestionText: "Covers all area of your property",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Center(
                      child: Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 1.5,
                            dashPattern: [12, 4],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            padding: EdgeInsets.all(6),
                            color: bgColor,
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 5.3,
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      _getFromGallery();

                                      setState(() {});
                                    },
                                    icon: Icon(Icons.photo_library_rounded),
                                    label: Text("From Gallery  "),
                                    style: ElevatedButton.styleFrom(
                                        primary: bgColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0))),
                                  ),
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          primary: whiteColor,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(color: black26),
                                              borderRadius:
                                                  BorderRadius.circular(8.0))),
                                      onPressed: () {
                                        _getFromCamera();

                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: bgColor,
                                      ),
                                      label: Text(
                                        "From Camera  ",
                                        style: cameraStyle,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          imagesList.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.only(
                                      top: 10.0, left: 10.0, right: 10.0),
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemCount: imagesList!.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.file(
                                              File(imagesList[index].path),
                                              width: 100.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : Container(
                                  color: Colors.red,
                                )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropDownText(
                          text: "Select City",
                        ),
                      ),
                      Expanded(
                        child: CustomDropDownText(
                          text: "Select Area",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Consumer<CitiesProvider>(
                            builder: (context, cities, _) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            margin: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 8.0),
                            height: 45.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: _selectedCity == null
                                        ? lightBlackColor
                                        : bgColor,
                                    width: 1.5)),
                            child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                value: _selectedCity,
                                hint: Text(
                                  "Select City",
                                  style: labelStyle2,
                                ),
                                items: cities.city!.toSet().map((item) {
                                  return DropdownMenuItem(
                                    value: item.cityId,
                                    child: Text(item.cityName!),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  // if (updateCity != null) {
                                  updateCity(newValue!);
                                  cities.city!.map((item) {
                                    if (newValue == item.cityId) {
                                      if (selectedArea == null) {
                                        _getLocNameHandler(item.cityId!);
                                      } else {
                                        selectedArea = null;
                                        _getLocNameHandler(item.cityId!);
                                      }
                                      print("Selected Area $selectedArea");
                                      // cities.city!.clear();

                                    }
                                  }).toList();
                                  //
                                  // };
                                  print("Selected City $_selectedCity");
                                  setState(() {});
                                }),
                          );
                        }),
                      ),
                      Expanded(
                        child: Consumer<LocationNameProvider>(
                            builder: (context, name, _) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            margin: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 8.0),
                            height: 45.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: selectedArea == null
                                        ? lightBlackColor
                                        : bgColor,
                                    width: 1.5)),
                            child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                value: selectedArea,
                                hint: Text(
                                  "Select Area",
                                  style: labelStyle2,
                                ),
                                items: name.locName!.map((item) {
                                  return DropdownMenuItem(
                                    value: item.areaId,
                                    child: Text(item.areaName!),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  // if (updateArea != null) {
                                  updateArea(newValue!);

                                  // }
                                  setState(() {});
                                }),
                          );
                        }),
                      ),
                    ],
                  ),
                  CustomTextField(
                    headerText: "Details Address",
                    maxLine: 1,
                    controller: _addressCont,
                    focusNode: _addressFocus,
                    inputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    headerText: "Phone Number",
                    controller: _phoneNoCont,
                    focusNode: _phoneNoFocus,
                    charLength: 11,
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.done,
                  ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: black12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 200.0,
                    width: double.infinity,
                    child: GoogleMap(
                      initialCameraPosition: initCamerPosition,
                      markers: Set<Marker>.of(_markers),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  if (widget.isSelected == true)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomButton(
                                horizontalMargin: 5.0,
                                text: "Log In",
                                verticalMargin: 5.0,
                                bgColor: selectedIndex == 0
                                    ? postColor
                                    : Colors.transparent,
                                onTap: () {
                                  selectedIndex = 0;
                                  // _emailCont.clear();
                                  // _passwordCont.clear();
                                  setState(() {});
                                },
                              ),
                            ),
                            Expanded(
                                child: CustomButton(
                              horizontalMargin: 5.0,
                              verticalMargin: 5.0,
                              bgColor:
                                  selectedIndex == 1 ? postColor : Colors.grey,
                              text: "Register Now",
                              onTap: () {
                                selectedIndex = 1;
                                // _emailCont.clear();
                                // _passwordCont.clear();
                                setState(() {});
                              },
                            ))
                          ],
                        ),
                        if (selectedIndex == 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login Now",
                                  style: loginStyle,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                CustomTextField(
                                  hintText: "Email Address",
                                  controller: _emailCont,
                                  focusNode: _emailFocus,
                                  inputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.next,
                                ),
                                CustomTextField(
                                  hintText: "Password",
                                  focusNode: _passwordFocus,
                                  controller: _passwordCont,
                                  inputType: TextInputType.visiblePassword,
                                ),
                              ],
                            ),
                          ),
                        if (selectedIndex == 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register Yoursself",
                                  style: loginStyle,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                CustomDropDown(
                                  borderColor: selectedWhoIAm.isEmpty
                                      ? lightBlackColor
                                      : bgColor,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    hint: Text(selectedWhoIAm.isEmpty
                                        ? "I'M a"
                                        : selectedWhoIAm),
                                    items: whoIamList.map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      selectedWhoIAm = value!;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                CustomTextField(
                                  hintText: "Enter Your Name",
                                  focusNode: _regNameFocus,
                                  controller: _regNameCont,
                                  inputAction: TextInputAction.next,
                                ),
                                CustomTextField(
                                  hintText: "Email Address",
                                  inputType: TextInputType.emailAddress,
                                  focusNode: _emailFocus,
                                  controller: _emailCont,
                                  inputAction: TextInputAction.next,
                                ),
                                CustomTextField(
                                  hintText: "Mobile",
                                  focusNode: _regMobileFocus,
                                  controller: _regMobileCont,
                                  inputType: TextInputType.phone,
                                  charLength: 11,
                                  inputAction: TextInputAction.next,
                                ),
                                CustomTextField(
                                  focusNode: _passwordFocus,
                                  hintText: "Password",
                                  inputType: TextInputType.visiblePassword,
                                  controller: _passwordCont,
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: kToolbarHeight * 1.0,
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: black26, width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                verticalMargin: 5.0,
                horizontalMargin: 12.0,
                height: 40.0,
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                width: MediaQuery.of(context).size.width / 3,
                text: "Post Ad",
                onTap: () async {
                  // await propertyGalleryImageIntoBytes();
                  // await pickMultipleImage();
                  if (_addPropValidation()) {
                    await uploadedImagesIntoBytes();
                    await postAddressHandler();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    List<PickedFile>? galleryImages = await ImagePicker().getMultiImage();

    galleryImages!.forEach((element) {
      imagesList.add(element);
    });
    setState(() {});
  }

  _getFromCamera() async {
    PickedFile? fromCamera =
        await ImagePicker().getImage(source: ImageSource.camera);
    imagesList.add(fromCamera!);
    setState(() {});
  }

  uploadedImagesIntoBytes() async {
    imagesList.forEach((element) async {
      List<int> temp = await File(element.path).readAsBytesSync();
      uploadMultImagesBytes.add(temp.toString());
      log('temp $temp');
      //log(uploadImagesBytes.toString());
    });
  }

  _addPropValidation() {
    if (_propTitleCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Property Title");
      _propTitleFocus.requestFocus();
      return false;
    } else if (_contentCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Property Description");
      _contentFocus.requestFocus();
      return false;
    } else if (selectedProperty!.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Selected Property Type");
    } else if (selectedPropType == null) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Select Property Type");
      return null;
    } else if (selectedPurpose.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Selected Property Purpose");
    } else if (_priceCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Property Price");
      _priceFocus.requestFocus();
      return false;
    } else if (_landAreaCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Total Land");
      _landAreaFocus.requestFocus();
      return false;
    } else if (selectedUnit == null) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Selected Property Unit");
    }

    if (isShow == true) {
      if (_noOfBedsCont.text.isEmpty) {
        CustomSnackBar.failedSnackBar(
            context: context, message: "Enter No Of Beds");
        _noOfBedsFocus.requestFocus();
        return false;
      } else if (_noOfBathsCont.text.isEmpty) {
        CustomSnackBar.failedSnackBar(
            context: context, message: "Enter No Of Baths");
        _noOfBathsFocus.requestFocus();
        return false;
      } else {
        return true;
      }
    }
    else if (selectedExpiration.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Selected Expiration Date");
      return false;
    } else if (selectedExpiration.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Select Expiration Date");
      return false;
    }
    else if (imagesList.isEmpty) {
      CustomSnackBar.failedSnackBar(context: context, message: "Select images");
      return false;
    }
    else if (_selectedCity == null) {
      CustomSnackBar.failedSnackBar(context: context, message: "Selected City");
      return false;
    } else if (_addressCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Address Details");
      _addressFocus.requestFocus();
      return false;
    } else if (_phoneNoCont.text.isEmpty || _phoneNoCont.text.length < 11) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Phone number should be 11 characters");
      _phoneNoFocus.requestFocus();
      return false;
    }
    print("Selected Index $selectedIndex");

    if (widget.isSelected == true) {
      if (selectedIndex == 0) {
        if (_emailCont.text.isEmpty || !validateEmail(_emailCont.text)) {
          CustomSnackBar.failedSnackBar(
              context: context, message: "Enter Valid Email Address");
          _emailFocus.requestFocus();
          return false;
        } else if (_passwordCont.text.length < 8) {
          CustomSnackBar.failedSnackBar(
              context: context, message: "Enter valid Password");

          _passwordFocus.requestFocus();
          return false;
        } else {
          return true;
        }
      } else if (selectedIndex == 1) {
        if (selectedWhoIAm.isEmpty) {
          CustomSnackBar.failedSnackBar(
              context: context, message: "Select Who I am");
          return false;
        } else if (_regNameCont.text.isEmpty) {
          CustomSnackBar.failedSnackBar(
              context: context, message: "Enter Your Name");
          _regNameFocus.requestFocus();
          return false;
        } else if (_emailCont.text.isEmpty || !validateEmail(_emailCont.text)) {
          CustomSnackBar.failedSnackBar(
              context: context, message: "Enter Valid Email Address");
          _emailFocus.requestFocus();
          return false;
        } else if (_passwordCont.text.length < 8) {
          CustomSnackBar.failedSnackBar(
              context: context, message: "Enter valid Password");

          _passwordFocus.requestFocus();
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    }
    else {
      return true;
    }

  }


  Future<Position> _getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error $error");
    });

    return await Geolocator.getCurrentPosition();
  }

  ////Get Location in init or at start

  initMethod() async {
    _getCurrentLocation().then((value) async {
      print("My Current Location");
      print("Lonitude ${value.longitude}");
      print("Latitude ${value.latitude}");
      _markers.add(Marker(
          markerId: MarkerId('3'),
          infoWindow: InfoWindow(title: "My Current Location"),
          position: LatLng(value.latitude, value.longitude)));
      setState(() {});
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14);
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }
}