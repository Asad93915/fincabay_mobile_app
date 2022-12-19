import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/Customer_module/providers/property_search_provider.dart';
import 'package:fincabay_application/Customer_module/screens/home_dashboard/properties_widgets/property_details_screen.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helper_services/navigation_services.dart';
import '../../../../helper_widgets/custom_button.dart';
import '../../../../helper_widgets/house_details.dart';
import '../../../models/property_search_model.dart';
import '../../../services/property_search_service.dart';

class PropertySearchScreen extends StatefulWidget {
  final int cityId;
  final int areaId;
  final int phaseId;

  const PropertySearchScreen(
      {Key? key, required this.cityId, required this.areaId, required this.phaseId})
      : super(key: key);

  @override
  State<PropertySearchScreen> createState() => _PropertySearchScreenState();
}

class _PropertySearchScreenState extends State<PropertySearchScreen> {
  _getSearch() async {
    CustomLoader.showLoader(context: context);
    await PropertySearchService().getSearch(context: context,
        cityId: widget.cityId,
        areaId: widget.areaId,
        phaseId: widget.phaseId);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getSearch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: postColor,
        title: Text("Houses For Sale", style: barStyle,),
      ),
      body: Consumer<PropertySearchProvider>(builder: (context, search, _) {
        return search.propSearch!.isNotEmpty ? ListView.builder(
            itemCount: search.propSearch!.length,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext, index) {
              return InkWell(
                onTap: (){
                  NavigationServices.goNextAndKeepHistory(context: context, widget: PropertyDetailsScreen(
                    imageUrl: search.propSearch![index].uploadImage==null?"assets/images/property_image.jpg":search.propSearch![index].uploadImage!,
                      address: search.propSearch![index].detailAddress!,
                      noOfBeds: search.propSearch![index].noOfBeds!,
                      noOfBaths: search.propSearch![index].noOfBaths!,
                      landArea: search.propSearch![index].landArea!,
                      unit: search.propSearch![index].unit==null?"null":search.propSearch![index].unit!,
                      description: search.propSearch![index].description==null?"null":search.propSearch![index].description!,
                    mobileNo: "",
                  ));
                },
                child: SearchWidget(
                  propSearch: search.propSearch![index],
                ),
              );
            }) : Container(
          alignment: Alignment.center,
          child: Text("No Property Available Against this Search"),
        );
      },),
    );
  }
}


class SearchWidget extends StatelessWidget {
  PropertySearch propSearch;

  SearchWidget({required this.propSearch});


  @override
  Widget build(BuildContext context) {
    String imageUrl = "assets/images/property_image.jpg";


    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                propSearch.uploadImage == null ? imageUrl : propSearch
                    .uploadImage!,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4.8,
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

                    Text(
                      "PKR ${propSearch.amount}",
                      style: pkrStyle,
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.78,
                      child: Text(
                        propSearch.detailAddress!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: addressStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${propSearch.propertyType!} For",
                          style: houseStyle,
                        ),
                        Text(
                          " ${propSearch.purpose!}",
                          style: houseStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HouseDetails(
                            icon: Icons.bed_outlined,
                            title: propSearch.noOfBeds.toString(),
                          ),
                          HouseDetails(
                            icon: Icons.bathtub_outlined,
                            title: "${propSearch.noOfBaths}",
                          ),
                          HouseDetails(
                            icon: Icons.house,
                            title: "${propSearch.landArea}",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            verticalMargin: 5.0,
                            height: 30.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 5.8,
                            bgColor: whiteColor,
                            borderColor: bgColor,
                            text: "SMS",
                            textColor: bgColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            onTap: () {},
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
                                          borderRadius: BorderRadius.circular(
                                              10.0)
                                      )
                                  ),
                                  onPressed: () {},
                                  icon: Icon(Icons.call),
                                  label: Text("Call",
                                    style: TextStyle(fontSize: 14.0),))),
                          SizedBox(width: 3.0,),
                          Expanded(
                              child: Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(10.0
                                    )
                                ),
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                child: Icon(
                                  Icons.whatsapp, color: whiteColor,
                                ),
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(thickness: 1.5,)
        ],
      ),
    );
  }
}


