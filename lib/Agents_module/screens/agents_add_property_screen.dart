import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fincabay_application/Agents_module/services/agents_add_property_service.dart';
import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/auth/provider/user_data_provider.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/customer_module/services/location_name_service.dart';
import 'package:fincabay_application/dialogs/show_will_pop_dialog.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_drop_down.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/utils/Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../configs/text_styles.dart';
import '../../../helper_widgets/custom_dropdown_text.dart';
import '../../../helper_widgets/custom_uploading_widget.dart';
import '../../customer_module/providers/cities_provider.dart';
import '../../customer_module/providers/location_name_provider.dart';
import '../../customer_module/services/cities_service.dart';

class AgentsAddPropertyScreen extends StatefulWidget {
  const AgentsAddPropertyScreen({super.key});

  @override
  State<AgentsAddPropertyScreen> createState() =>
      _AgentsAddPropertyScreenState();
}

class _AgentsAddPropertyScreenState extends State<AgentsAddPropertyScreen> {
  List<PickedFile> galleryFile = [];
  File? imageFile;
  List<String> propertyGalleryBytes = [];
  List<int> propertyCameraBytes = [];

  PickedFile? cameraFile;

  String selectedProperty = "";
  List<String> propertyTypeList = ["Homes", "Plots", "Commercial"];
  String selectedPurpose = "";
  List<String> purposeList = ["Sell", "Rent Out", "Purchase"];
  String selectedUnit = "";
  List<String> unitList = ["House", "Apartment", "Mobile Home"];
  String selectedExpiration = "";
  List<String> expiryList = [
    "After one week",
    "After two week",
    "After one month"
  ];

  UserModel user=UserModel();
  getCities() async {
    CustomLoader.showLoader(context: context);
    CitiesService().getAllCities(context: context);
    CustomLoader.hideLoader(context);
  }

  getLocationNamesHandler(int cityId) async {
    CustomLoader.showLoader(context: context);
    await GetLocationNameService().getLocName(context: context, cityId: cityId);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getInitMethod();
      setState((){});
    });
    super.initState();
  }

  String? _selectedCity;

  @override
  updateCity(String value) {
    setState(() {
      _selectedCity = value;
    });
  }

  String? selectedArea;

  @override
  updateArea(String? value) async {
    selectedArea = value;

    setState(() {});
  }

  TextEditingController _propTitleCont = TextEditingController();
  TextEditingController _contentCont = TextEditingController();
  TextEditingController _priceCont = TextEditingController();
  TextEditingController _landAreaCont = TextEditingController();
  TextEditingController _noOfBedsCont = TextEditingController();
  TextEditingController _noOfBathsCont = TextEditingController();
  TextEditingController _addressCont = TextEditingController();

  _getAreas(int cityId) async {
    CustomLoader.showLoader(context: context);
    await GetLocationNameService().getLocName(context: context, cityId: cityId);
    CustomLoader.hideLoader(context);
  }

  _addAgentPropertyHandler() async {
    CustomLoader.showLoader(context: context);
    await AgentsAddPropertyService().addAgentProperty(
        context: context,
        propTitle: _propTitleCont.text,
        content: _contentCont.text,
        category: selectedProperty,
        purpose: selectedPurpose,
        price: _priceCont.text,
        landArea: _landAreaCont.text,
        unit: selectedUnit,
        noOfBeds: isShow?_noOfBathsCont.text:"0",
        noOfBaths: isShow?_noOfBathsCont.text:"0",
        expiryDate: selectedExpiration,
        city: _selectedCity!,
        area: selectedArea!,
        detailsAddress: _addressCont.text,
        userEmail:user.email!,
        uploadImage: propertyGalleryBytes,
        uploadedVideo: []);
    CustomLoader.hideLoader(context);
  }

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.unfocus();
      },
      child: WillPopScope(
        onWillPop: ()async {
          return await showWillPopDialog(context);
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
                      setState(() {});
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
                      inputAction: TextInputAction.next,
                    ),
                    CustomTextField(
                      headerText: "Content",
                      controller: _contentCont,
                      inputAction: TextInputAction.next,
                      maxLine: 3,
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
                            borderColor: selectedProperty.isEmpty
                                ? lightBlackColor
                                : bgColor,
                            child: DropdownButton(
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text(
                                selectedProperty.isEmpty
                                    ? "Select Property"
                                    : selectedProperty,
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
                                if (selectedProperty.contains("Homes")) {
                                  isShow = true;
                                } else {
                                  isShow = false;
                                }
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
                    CustomTextField(
                      headerText: "Price",
                      controller: _priceCont,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
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
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        )),
                        Expanded(
                          child: CustomDropDown(
                            borderColor:
                                selectedUnit.isEmpty ? lightBlackColor : bgColor,
                            child: DropdownButton(
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text(selectedUnit.isEmpty
                                  ? "Select Unit"
                                  : selectedUnit),
                              items: unitList.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                selectedUnit = value!;
                                setState(() {});
                              },
                            ),
                          ),
                        )
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
                                charLength: 2,
                                controller: _noOfBedsCont,
                                suffixIcon: Icons.bed_outlined,
                              )),
                              Expanded(
                                  child: CustomTextField(
                                inputType: TextInputType.number,
                                headerText: "No. of Baths",
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
                                          print(cameraFile!.path);
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
                            cameraFile != null
                                ? Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Image.file(
                                      File(
                                        cameraFile!.path,
                                      ),
                                      fit: BoxFit.fill,
                                      height: 100.0,
                                      width: 100.0,
                                    ),
                                  )
                                : SizedBox(),
                            galleryFile .isNotEmpty
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width: double.infinity,
                                    child: ListView.builder(
                                        itemCount: galleryFile.length,
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
                                                File(galleryFile[index].path),
                                                width: 100.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : Container()
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
                                      value: item.cityName,
                                      child: Text(item.cityName!),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // if (updateCity != null) {
                                    updateCity(newValue!);
                                    cities.city!.map((item) {
                                      print("City Name ${item.cityName}");
                                      print("newValue $newValue");
                                      if (newValue == item.cityName) {
                                        if (selectedArea == null) {
                                          _getAreas(item.cityId!);
                                        } else {
                                          selectedArea = null;
                                          _getAreas(item.cityId!);
                                        }
                                      }
                                    }).toList();
                                    //
                                    // };
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
                                      value: item.areaName,
                                      child: Text(item.areaName!),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
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
                      inputAction: TextInputAction.done,
                    ),
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
                  onTap: () async{
                    await galleryImagesBytes( );
                    // await pickMultipleImage();
                    _addAgentPropertyHandler();
                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        Navigator.pop(context);

                      });
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    galleryFile = (await ImagePicker().getMultiImage())!;
    if (galleryFile != null) {
      imageFile = File(galleryFile[0].path);
      setState(() {});
    }
  }

  _getFromCamera() async {
    cameraFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (cameraFile != null) {
      imageFile = File(cameraFile!.path);
      setState(() {});
    }
  }

  galleryImagesBytes() async {
    galleryFile.forEach((element) async {
    List<int> bytesList = await File(element.path).readAsBytesSync();
    propertyGalleryBytes.add(bytesList.toString());
      print(bytesList);
    });
  }
  getInitMethod()async{
    getCities();
    user=await getUser();
    setState((){});

  }
}
