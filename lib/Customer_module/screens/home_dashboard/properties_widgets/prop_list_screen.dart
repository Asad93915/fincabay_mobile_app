import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/Customer_module/providers/prop_list_provider.dart';
import 'package:fincabay_application/Customer_module/screens/home_dashboard/properties_widgets/property_details_screen.dart';
import 'package:fincabay_application/Customer_module/services/add_favourites_properties_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/house_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../../../configs/api_configs.dart';
import '../../../../helper_widgets/custom_property_count_widget.dart';
import '../../../../utils/Functions.dart';
import '../../../../utils/handlers.dart';
import '../../../../utils/launchers.dart';
import '../../../models/prop_list_model.dart';

class PropertyListScreen extends StatefulWidget {
  final String propertyTypeText;
  final int areaSizeId;
  final String catName;
  final int typeId;

  PropertyListScreen(
      {required this.areaSizeId, required this.catName, required this.typeId, this.propertyTypeText=""});

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  String selectedCity = "";
  List<String> citiesList = ["Lahore", "Karachi", "Islamabad"];
  String selectedAgency = "";
  List<String> agencyList = [
    "Artists agents",
    "Sales agents",
    "Distributors",
    "Licensing agents"
  ];
  TextEditingController locationCont = TextEditingController();
  TextEditingController _companyCont = TextEditingController();
bool showSwitch=false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      areaSizeViewHandler(
          context, widget.catName, widget.areaSizeId, widget.typeId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: barColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: barColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: blackColor,
            ),
          ),
          title: Text(
            "${widget.propertyTypeText} For Sale",
            style: titleStyle,
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.clear_all,
                        color: blackColor,
                      ),
                      label: Text(
                        "Reset Filter",
                        style: headerStyle,
                      ))
                ],
              ),
            )
          ],
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: FlutterSwitch(
              activeText: "Sell",
              inactiveText: "Rent",

              value: showSwitch,
              valueFontSize: 14.0,
              activeTextFontWeight: FontWeight.w700,
              width: 110,


              borderRadius: 30.0,
              showOnOff: true,
              inactiveColor: postColor,
              activeColor: postColor,
              onToggle: (val) {
                setState(() {
                  showSwitch = val;
                });
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 1.2,
            ),
            Consumer<PropertyListProvider>(builder: (context, view, _) {
              return view.areaView!.isNotEmpty
                  ? ListView.builder(
                      itemCount: view.areaView!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      primary: false,
                      itemBuilder: (BuildContext, index) {
                        return showSwitch?view.areaView![index].purpose=="Sell"?
                        AreaViewWidget(
                          propList: view.areaView![index],
                          catName: widget.catName,
                          typeId: view.areaView![index].id!,
                        ):SizedBox():view.areaView![index].purpose=="Rent Out"?
                        AreaViewWidget(
                          propList: view.areaView![index],
                          catName: widget.catName,
                          typeId: view.areaView![index].id!,
                        ):SizedBox();
                      })
                  : Container(
                      alignment: Alignment.center,
                      child: Text(
                        "No data available against this",
                        style: addPropStyle,
                        textAlign: TextAlign.center,
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}

class AreaViewWidget extends StatefulWidget {
  PropertyList propList;
  final String catName;
  final int typeId;

  AreaViewWidget(
      {required this.propList, required this.catName, required this.typeId});

  @override
  State<AreaViewWidget> createState() => _AreaViewWidgetState();
}

class _AreaViewWidgetState extends State<AreaViewWidget> {
  bool isFavourite = false;

  UserModel user = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    initMethod();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationServices.goNextAndKeepHistory(context: context, widget: PropListDetailsScreen(prop: widget.propList));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.propList.propertyImages!.isNotEmpty
                    ?CustomPropertyCountWidget(
                  imageUrl: "${widget.propList.propertyImages![0].imageURL}",
                  totalCount: '${widget.propList.propertyImages!.length}',

                )
                    : Image.asset(
                        "$imageUrl",
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: 125.0,
                        fit: BoxFit.fill,
                      ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expire ${widget.propList.expireAfter}"),
                      Text(
                        "PKR ${widget.propList.amount}",
                        style: pkrStyle,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.78,
                        child: Text(
                          "${widget.propList.detailAddress}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: addressStyle,
                        ),
                      ),
                      Text(
                        "${widget.propList.category}" +


                            " For " +
                            "${widget.propList.purpose}",
                        style: houseStyle,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      widget.catName == "Home"
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HouseDetails(
                                    icon: Icons.bed_outlined,
                                    title: widget.propList.noOfBeds.toString(),
                                  ),
                                  HouseDetails(
                                    icon: Icons.bathtub_outlined,
                                    title: "${widget.propList.noOfBaths}",
                                  ),
                                  HouseDetails(
                                    icon: Icons.house,
                                    title: "${widget.propList.landArea}",
                                  ),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        isFavourite = !isFavourite;
                                        isFavourite == true
                                            ? addFavouritePropHandler(
                                                context: context,
                                                typeId: widget.typeId,
                                                userId: user.id ?? "",
                                              )
                                            : isFavourite == false
                                                ? delFavPropHandler(
                                                    context: context,
                                                    userId: user.id ?? "",
                                                    propId: widget.typeId)
                                                : null;
                                        print("IS Favourite $isFavourite");

                                        setState(() {});
                                      },
                                      child: Icon(
                                        isFavourite == true
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 20.0,
                                        color: isFavourite == true
                                            ? Colors.red
                                            : Colors.black,
                                      )),
                                ],
                              ),
                            )
                          : widget.catName == "Plots"
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/icons/marla_icon.png",
                                        height: 15.0,
                                        width: 15.0,
                                        fit: BoxFit.fill,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 10.0, top: 0.0),
                                          child: Text(
                                              widget.propList.landArea! +
                                                  " " +
                                                  widget.propList.unit!)),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            isFavourite = !isFavourite;
                                            isFavourite == true
                                                ? addFavouritePropHandler(
                                                    context: context,
                                                    typeId: widget.typeId,
                                                    userId: user.id ?? "")
                                                : isFavourite == false
                                                    ? delFavPropHandler(
                                                        context: context,
                                                        userId: user.id ?? "",
                                                        propId: widget.typeId)
                                                    : null;
                                            print("IS Favourite $isFavourite");

                                            setState(() {});
                                          },
                                          child: Icon(
                                            isFavourite == true
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 20.0,
                                            color: isFavourite == true
                                                ? Colors.red
                                                : Colors.black,
                                          )),
                                    ],
                                  ),
                                )
                              : widget.catName == "Commercial"
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/icons/marla_icon.png",
                                            height: 25.0,
                                            width: 25.0,
                                            fit: BoxFit.fill,
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 2.0),
                                              child: Text(
                                                  "${widget.propList.landArea!}" +
                                                      " " +
                                                      "${widget.propList.unit}")),
                                          Spacer(),
                                          InkWell(
                                              onTap: () {
                                                isFavourite = !isFavourite;
                                                isFavourite == true
                                                    ? addFavouritePropHandler(
                                                        context: context,
                                                        typeId: widget.typeId,
                                                        userId: user.id ?? "")
                                                    : isFavourite == false
                                                        ? delFavPropHandler(
                                                            context: context,
                                                            userId:
                                                                user.id ?? "",
                                                            propId:
                                                                widget.typeId)
                                                        : null;
                                                print(
                                                    "IS Favourite $isFavourite");

                                                setState(() {});
                                              },
                                              child: Icon(
                                                isFavourite == true
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 20.0,
                                                color: isFavourite == true
                                                    ? Colors.red
                                                    : Colors.black,
                                              )),
                                        ],
                                      ),
                                    )
                                  : Text("UpComing"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomButton(
                              verticalMargin: 5.0,
                              height: 30.0,
                              width: MediaQuery.of(context).size.width / 5.8,
                              bgColor: whiteColor,
                              borderColor: bgColor,
                              text: "SMS",
                              textColor: bgColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              onTap: () {
                                sendMessage(
                                    message, ["${widget.propList.userMobile}"]);
                                print("Category Name ${widget.catName}");
                              },
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                height: 30.0,
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        primary: bgColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    onPressed: () {
                                      makePhoneCall(
                                          '${widget.propList.userMobile}');
                                    },
                                    icon: Icon(Icons.call),
                                    label: Text(
                                      "Call",
                                      style: TextStyle(fontSize: 14.0),
                                    ))),
                            SizedBox(
                              width: 3.0,
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                launchWhatsapp(
                                    context: context,
                                    phoneNo: '${widget.propList.userMobile}');
                              },
                              child: Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                child: Icon(
                                  Icons.whatsapp,
                                  color: whiteColor,
                                ),
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.5,
            )
          ],
        ),
      ),
    );
  }

  initMethod() async {
    user = await getUser();
  }

}
