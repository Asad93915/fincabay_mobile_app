import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_drop_down.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/location_name_provider.dart';
import 'package:fincabay_application/providers/location_phases_provider.dart';
import 'package:fincabay_application/services/add_property_service.dart';
import 'package:fincabay_application/services/cities_service.dart';
import 'package:fincabay_application/services/location_name_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../configs/text_styles.dart';
import '../helper_widgets/custom_dropdown_text.dart';
import '../helper_widgets/custom_uploading_widget.dart';


class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final imagePick = ImagePicker();
  List<XFile> image = [];
  PickedFile? galleryFile;
  File? imageFile;
  List<int>propertyGalleryBytes = [];
  List<int>propertyCameraBytes = [];

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

  String selectedWhoIAm = "";
  List<String> whoIamList = [
    "I'm a real estate agent",
    "I'm a real property owner"
  ];

  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();

  TextEditingController _regNameCont = TextEditingController();

  TextEditingController _regMobileCont = TextEditingController();
  int selectedIndex = 1;

  _getCities() async {
    CustomLoader.showLoader(context: context);
    await CitiesService().getAllCities(context: context);

    CustomLoader.hideLoader(context);
  }

  _getLocNameHandler(int cityId)async{
    CustomLoader.showLoader(context: context);

    await GetLocationNameService().getLocName(context: context, cityId: cityId);

    print("City $cityId");
    CustomLoader.hideLoader(context);
  }
  postAddressHandler() async {
    CustomLoader.showLoader(context: context);
    await AddPropertyService().addProperty(context: context,
        propertyTitle: _propTitleCont.text,
        content: _contentCont.text,
        propType: selectedProperty,
        propPurpose: selectedPurpose,
        price: _priceCont.text,
        landArea: _landAreaCont.text,
        unit: selectedUnit,
        noOfBeds: _noOfBedsCont.text,
        noOfBaths: _noOfBathsCont.text,
        expiryDate: _expiryCont.text,
        city: _selectedCity!,
        area: selectedArea!,
        detailAddress: _addressCont.text,
        email: _emailCont.text,
        password: _passwordCont.text,
        name: _regNameCont.text,
        signUpAs: selectedWhoIAm,

        isLogin: selectedIndex == 0 ? true : false,
        isSignup: selectedIndex == 1 ? true : false);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCities();
    });
    setState(() {});
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
  updateArea(String? value)async {
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
                                hint: Text(selectedProperty.isEmpty
                                    ? "Select Property"
                                    : selectedProperty,
                                  style: TextStyle(height: 1.0,),),
                                items: propertyTypeList.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  selectedProperty = value!;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomDropDown(
                              borderColor:
                              selectedPurpose.isEmpty
                                  ? lightBlackColor
                                  : bgColor,
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text(selectedPurpose.isEmpty
                                    ? "Select Purpose"
                                    : selectedPurpose,
                                  style: TextStyle(height: 1.0),),
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
                          Expanded(child: CustomTextField(
                            controller: _landAreaCont,
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
                      Row(
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
                      ),
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
                          Text("Upload image of your property",
                              style: imageStyle),
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
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 5.3,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: ()async {
                                          // _getFromGallery();
                                          image = (await imagePick.pickMultiImage())!;
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
                                                  side: BorderSide(
                                                      color: black26),
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
                              (image.isNotEmpty)
                              ?  Container(
                                margin: EdgeInsets.only(top: 12.0),
                                height: 100,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: image.length,
                                    itemBuilder: (context, index) {
                                      print('image length ${image.length}');
                                      return Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 3.0),
                                        child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: Colors.black),
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.file(
                                                  File(image[index].path.toString()),
                                                  fit: BoxFit.cover,
                                                  isAntiAlias: true,
                                                ),
                                              ),
                                            )),
                                      );
                                    }),
                              ):SizedBox(),
                              // galleryFile != null
                              //     ? Container(
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10.0)),
                              //   margin: EdgeInsets.only(top: 10.0),
                              //   child: Image.file(
                              //     File(
                              //       galleryFile!.path,
                              //     ),
                              //     fit: BoxFit.fill,
                              //     height: 100.0,
                              //     width: 100.0,
                              //   ),
                              // )

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
                            child: Consumer<CitiesProvider>(builder: (context,
                                cities, _) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                margin:
                                EdgeInsets.symmetric(
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
                                    items: cities.city!.map((item) {
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
                                          if(newValue==item.cityName){

                                            if(selectedArea==null){
                                              _getLocNameHandler(
                                                  item.cityId!);
                                            }
                                            else{
                                              selectedArea=null;
                                              _getLocNameHandler(
                                                  item.cityId!);
                                            }
                                            // cities.city!.clear();

                                          }

                                        }).toList();
                                      //
                                      // };
                                            setState(() {});
                                    }
                                    ),
                              );
                            }),
                          ),
                          Expanded(
                            child: Consumer<LocationNameProvider>(builder: (
                                context, name, _) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                margin:
                                EdgeInsets.symmetric(
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
                                    onChanged: (String? newValue){
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
                        maxLine: 3,
                        controller: _addressCont,
                        inputAction: TextInputAction.done,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomButton(
                              horizontalMargin: 5.0,
                              text: "Log In",
                              verticalMargin: 5.0,
                              bgColor: selectedIndex == 0 ? postColor : Colors
                                  .transparent,
                              onTap: () {
                                selectedIndex = 0;
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(child: CustomButton(
                            horizontalMargin: 5.0,
                            verticalMargin: 5.0,
                            bgColor: selectedIndex == 1 ? postColor : Colors
                                .grey,
                            text: "Register Now",
                            onTap: () {
                              selectedIndex = 1;
                              setState(() {});
                            },
                          ))
                        ],
                      ),
                      if(selectedIndex == 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Login Now", style: loginStyle,),
                              SizedBox(height: 10.0,),
                              CustomTextField(
                                hintText: "Email Address",
                                controller: _emailCont,
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                              ),
                              CustomTextField(
                                hintText: "Password",
                                controller: _passwordCont,
                                inputType: TextInputType.visiblePassword,

                              ),
                            ],
                          ),
                        ),
                      if(selectedIndex == 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Register Yoursself", style: loginStyle,),
                              SizedBox(height: 10.0,),
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
                                controller: _regNameCont,
                                inputAction: TextInputAction.next,
                              ),
                              CustomTextField(
                                hintText: "Email Address",
                                inputType: TextInputType.emailAddress,
                                controller: _emailCont,
                                inputAction: TextInputAction.next,
                              ),
                              CustomTextField(
                                hintText: "Mobile",
                                controller: _regMobileCont,
                                inputType: TextInputType.phone,
                                charLength: 11,
                                inputAction: TextInputAction.next,
                              ),

                              CustomTextField(
                                hintText: "Password",
                                inputType: TextInputType.visiblePassword,
                                controller: _passwordCont,
                              ),
                            ],
                          ),
                        ),


                      // To choose multiple Images
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: CustomButton(
                      //       onTap: () async {
                      //         image = (await imagePick.pickMultiImage())!;
                      //         setState(() {});
                      //       },
                      //       text: 'Choose Image',
                      //     )),
                      // (image.isNotEmpty)
                      //     ? SizedBox(
                      //         height: 100,
                      //         width: double.infinity,
                      //         child: ListView.builder(
                      //             scrollDirection: Axis.horizontal,
                      //             shrinkWrap: true,
                      //             itemCount: image.length,
                      //             itemBuilder: (context, index) {
                      //               print('image length ${image.length}');
                      //               return Padding(
                      //                 padding:
                      //                     const EdgeInsets.symmetric(horizontal: 3.0),
                      //                 child: SizedBox(
                      //                     height: 100,
                      //                     width: 100,
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                           border:
                      //                               Border.all(color: Colors.black),
                      //                           borderRadius:
                      //                               BorderRadius.circular(10)),
                      //                       child: ClipRRect(
                      //                         borderRadius: BorderRadius.circular(10),
                      //                         child: Image.file(
                      //                           File(image[index].path.toString()),
                      //                           fit: BoxFit.cover,
                      //                           isAntiAlias: true,
                      //                         ),
                      //                       ),
                      //                     )),
                      //               );
                      //             }),
                      //       )
                      //     : const Align(
                      //         alignment: Alignment.bottomCenter,
                      //         child: Card(
                      //             child: Padding(
                      //           padding: EdgeInsets.all(8.0),
                      //           child: Icon(Icons.image),
                      //         ))),


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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                text: "Post Ad",
                onTap: () {
                  // await propertyGalleryImageIntoBytes();
                  // await pickMultipleImage();
                  postAddressHandler(

                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    galleryFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (galleryFile != null) {
      setState(() {
        imageFile = File(galleryFile!.path);
      });
    }
  }

  _getFromCamera() async {
    cameraFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (cameraFile != null) {
      imageFile = File(cameraFile!.path);
      setState(() {});
    }
  }

  propertyGalleryImageIntoBytes() async {
    propertyGalleryBytes = await File(galleryFile!.path).readAsBytesSync();
    print(propertyGalleryBytes);
    setState(() {});
  }

  pickMultipleImage() async {
    image.forEach((element) async {
      propertyGalleryBytes = await File(element.path).readAsBytesSync();
      log("$propertyGalleryBytes");
    });
  }
}
