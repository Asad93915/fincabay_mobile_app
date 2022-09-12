import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_drop_down.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  PickedFile? cameraFile;

  String selectedProperty = "";
  List<String> propertyTypeList = ["Homes", "Plots", "Commercial"];
  String selectedPurpose = "";
  List<String> purposeList = ["Sell", "Rent Out"];
  String selectedUnit = "";
  List<String> unitList = ["House", "Apartment", "Mobile Home"];
  String selectedExpiration = "";
  List<String> expiryList = [
    "After one week",
    "After two week",
    "After one month"
  ];
  String selectedCity = '';
  List<String> citiesList = ["Lahore", "Karachi", "Islamabad"];
  String selectedArea = "";
  List<String> areaList = ["Nishter", "Central Park", "Pak Arab"];

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              title: Text(
                "Post an Ad",
              ),
              backgroundColor: Color(0xFFAFBCD9),
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
                CustomTextField(),
                CustomTextField(
                  headerText: "Content",
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
                              : selectedProperty),
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
                            selectedPurpose.isEmpty ? lightBlackColor : bgColor,
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text(selectedPurpose.isEmpty
                              ? "Select Purpose"
                              : selectedPurpose),
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
                    Expanded(child: CustomTextField()),
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
                      suffixIcon: Icons.bed_outlined,
                    )),
                    Expanded(
                        child: CustomTextField(
                      inputType: TextInputType.number,
                      headerText: "No. of Baths",
                      suffixIcon: Icons.bathtub_outlined,
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
                        color: Colors.black12,
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
                                  onPressed: () {
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
                        galleryFile != null
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.only(top: 10.0),
                                child: Image.file(
                                  File(
                                    galleryFile!.path,
                                  ),
                                  fit: BoxFit.fill,
                                  height: 100.0,
                                  width: 100.0,
                                ),
                              )
                            : SizedBox(),
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
                      child: CustomDropDown(
                        child: DropdownButton(
                          hint: Text(selectedCity.isEmpty
                              ? "Select City"
                              : selectedCity),
                          items: citiesList.map((item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            selectedCity = value!;
                            setState(() {});
                          },
                          isExpanded: true,
                          underline: SizedBox(),
                        ),
                        borderColor:
                            selectedCity.isEmpty ? lightBlackColor : bgColor,
                      ),
                    ),
                    Expanded(
                      child: CustomDropDown(
                        child: DropdownButton(
                          hint: Text(selectedArea.isEmpty
                              ? "Select Area"
                              : selectedArea),
                          items: areaList.map((item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            selectedArea = value!;
                            setState(() {});
                          },
                          isExpanded: true,
                          underline: SizedBox(),
                        ),
                        borderColor:
                            selectedArea.isEmpty ? lightBlackColor : bgColor,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  headerText: "Details Address",
                  maxLine: 3,
                  inputAction: TextInputAction.next,
                ),
                CustomTextField(
                  headerText: "Email Address",
                  inputType: TextInputType.emailAddress,
                ),
                //To choose multiple Images
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
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //       return Container(
          //         color: index.isOdd ? Colors.white : Colors.black12,
          //         height: 100.0,
          //         child: Center(
          //           child: Text('$index', textScaleFactor: 5),
          //         ),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),
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
              onTap: () {},
            ),
          ],
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
}
