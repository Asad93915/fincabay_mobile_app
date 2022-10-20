import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/customer_module/providers/area_size_view_provider.dart';
import 'package:fincabay_application/customer_module/screens/home_dashboard/dashboard_widgets/property_details_screen.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/house_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/handlers.dart';
import '../../../models/area_size_view_model.dart';




class AreaSizeViewScreen extends StatefulWidget {
  final int areaSizeId;
  final String catName;
  final int typeId;
  AreaSizeViewScreen({required this.areaSizeId, required this.catName, required this.typeId});

  @override
  State<AreaSizeViewScreen> createState() => _AreaSizeViewScreenState();
}

class _AreaSizeViewScreenState extends State<AreaSizeViewScreen> {
  String selectedCity="";
  List<String> citiesList=["Lahore","Karachi","Islamabad"];
  String selectedAgency="";
  List<String> agencyList=["Artists agents","Sales agents","Distributors","Licensing agents"];
  TextEditingController locationCont=TextEditingController();
  TextEditingController _companyCont=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      areaSizeViewHandler(
        context,widget.catName,widget.areaSizeId,widget.typeId
      );
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
            "Houses For Sale",
            style: titleStyle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 9.0),
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
          flexibleSpace: ListView(
            // This next line does the trick.
            padding: EdgeInsets.only(top: 80.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[

              Container(
                width: MediaQuery.of(context).size.width/2.1,
                child: Card(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city_sharp,color: selectedCity.isEmpty?lightBlackColor:bgColor,),

                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                      border: InputBorder.none
                    ),
                    hint: Text(selectedCity.isEmpty?"Select City":selectedCity),
                      items: citiesList.map((item){
                        return DropdownMenuItem(
                            child: Text(item),
                          value: item,
                        );
                      }).toList(),
                    onChanged: (String? value){
                      selectedCity=value!;
                      setState((){});
                    },
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width/2.3,
                  child: Card(child: TextField(
                    controller: locationCont,
                    decoration: InputDecoration(
                      hintText: "Select Location",
                      contentPadding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 0.0),
                      prefixIcon: Icon(Icons.add_location_alt_outlined,color: locationCont.text.isEmpty?lightBlackColor:bgColor,size: 20.0,),
                      border: InputBorder.none,
                    ),
                  ))),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: Card(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.real_estate_agent_outlined,color: selectedAgency.isEmpty?lightBlackColor:bgColor,size: 20.0,),

                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                      border: InputBorder.none
                    ),
                    hint: Text(selectedAgency.isEmpty?"Select Agency":selectedAgency),
                      items: agencyList.map((item){
                        return DropdownMenuItem(
                            child: Text(item),
                          value: item,
                        );
                      }).toList(),
                    onChanged: (String? value){
                      selectedAgency=value!;
                      setState((){});
                    },
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width/2.3,
                  child: Card(child: TextField(
                    style: TextStyle(height: 1.4),
                    controller: _companyCont,
                    decoration: InputDecoration(
                      hintText: "Company",
                      contentPadding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 0.0),
                      prefixIcon: Icon(Icons.business_sharp,color: _companyCont.text.isEmpty?lightBlackColor:bgColor,size: 20.0,),
                      border: InputBorder.none,
                    ),
                  ))),
              CustomButton(
                width:MediaQuery.of(context).size.width/2.0,
                verticalMargin: 3.0,
                text: "Find Property",
                onTap: (){},
              )

            ],
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

           Consumer<AreaSizeViewProvider>(builder: (context,view,_){
             return  view.areaView!.isNotEmpty ?InkWell(
               child: ListView.builder(
                   itemCount: view.areaView!.length,
                   shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   scrollDirection: Axis.vertical,
                   primary: false,
                   itemBuilder: (BuildContext,index){
                     return AreaViewWidget(
                         areaView: view.areaView![index],
                       catName: widget.catName,
                     );
                   }),
             ):Container(
               alignment: Alignment.center,
               child: Text("No data available against this",style: addPropStyle,textAlign: TextAlign.center,),
             );
           })
          ],
        ),
      ),
    );
  }
}
class AreaViewWidget extends StatelessWidget {
  AreaSizeView areaView;
  final String catName;
   AreaViewWidget({required this.areaView, required this.catName});


  @override
  Widget build(BuildContext context) {
    String imageUrl="assets/images/property_image.jpg";

    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder: (_, __, ___) => PropertyDetailsScreen(
                  imageUrl: imageUrl,
                  price: areaView.amount.toString(),
                  sellingAsset:"${areaView.propertyType}"+" For " + "${areaView.purpose}",
                  address: areaView.detailAddress!,
                  noOfBaths: areaView.noOfBaths!,
                  noOfBeds: areaView.noOfBeds!,
                  landArea: areaView.landArea!,
                  unit: areaView.unit!,
                  description: areaView.description!,

                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0,top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Hero(tag: 'propertyUrl',
                 child:  Image.asset(
                 "$imageUrl",
                 height: MediaQuery.of(context).size.height / 4.5,
                 width: 125.0,
                 fit: BoxFit.fill,
               ),),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expire After ${areaView.expireAfter}"),
                      Text(
                        "PKR ${areaView.amount}",
                        style: pkrStyle,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.78,
                        child: Text(
                          "${areaView.detailAddress}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: addressStyle,
                        ),
                      ),
                      Text(
                        "${areaView.propertyType}"+" For "+"${areaView.purpose}",
                        style: houseStyle,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      catName=="Home"?
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HouseDetails(
                              icon: Icons.bed_outlined,
                              title: areaView.noOfBeds.toString(),
                            ),
                            HouseDetails(
                              icon: Icons.bathtub_outlined,
                              title: "${areaView.noOfBaths}",
                            ),
                            HouseDetails(
                              icon: Icons.house,
                              title: "${areaView.landArea}",
                            ),
                          ],
                        ),
                      ):
                      catName=="Plots"?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/marla_icon.png",height: 15.0,width: 15.0,fit: BoxFit.fill,),
                          Container(
                              margin: EdgeInsets.only(left: 10.0,top: 0.0),
                              child: Text(areaView.landArea!+ " "+areaView.unit!))
                        ],
                      ):
                      catName=="Commercial"?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/icons/marla_icon.png",height: 25.0,width: 25.0,fit: BoxFit.fill,),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                                  child: Text("${areaView.landArea! }"+" "+"${areaView.unit}"))
                            ],
                          )
                          :Text("UpComing"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomButton(
                              verticalMargin: 5.0,
                              height: 30.0,
                              width: MediaQuery.of(context).size.width/5.8,
                              bgColor: whiteColor,
                              borderColor: bgColor,
                              text: "SMS",
                              textColor: bgColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              onTap: () {
                                print("Category Name $catName");
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
                                            borderRadius: BorderRadius.circular(10.0)
                                        )
                                    ),
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                    label: Text("Call",style: TextStyle(fontSize: 14.0),))),
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
                                    Icons.whatsapp,color: whiteColor,
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
      ),
    );
  }
}

