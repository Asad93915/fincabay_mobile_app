
import 'dart:convert';

import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/Customer_module/models/get_favourite_property_model.dart';
import 'package:fincabay_application/Customer_module/providers/get_favourite_prop_provider.dart';
import 'package:fincabay_application/Customer_module/screens/home_dashboard/properties_widgets/property_details_screen.dart';
import 'package:fincabay_application/Customer_module/services/get_favourite_property_service.dart';
import 'package:fincabay_application/helper_services/delete_favourite_property_service.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/utils/handlers.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:provider/provider.dart';

import '../../../../auth/provider/user_data_provider.dart';
import '../../../../configs/api_configs.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/text_styles.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_widgets/custom_button.dart';
import '../../../../helper_widgets/custom_property_count_widget.dart';
import '../../../../helper_widgets/house_details.dart';
import '../../../../utils/Functions.dart';
import '../../../../utils/launchers.dart';

class FavouritesScreen extends StatefulWidget {
  final   bool showScaffold;
  FavouritesScreen({this.showScaffold=false});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}
// final box=GetStorage();
// UserModel user=UserModel.fromJson(box.read('user'));

class _FavouritesScreenState extends State<FavouritesScreen> {




  // _getFavouriteProperties()async{
  //   CustomLoader.showLoader(context: context);
  //   await GetFavouritePropService().getFavProp(context: context, userId: user.id??"");
  //   CustomLoader.hideLoader(context);
  // }

  @override
  Widget build(BuildContext context) {
    return widget.showScaffold?Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: Text("Favourites"),
      ),
      body:ShowFavouritesScreen() ,
    ): ShowFavouritesScreen();
  }
  // getUserId()async{
  //   String getUserId=await LocaleStorageServices().getUser();
  //   user=UserModel.fromJson(jsonDecode(getUserId));
  //   print("User ID ${user.id}");
  //
  // }


}

class ShowFavouritesScreen extends StatefulWidget {
  const ShowFavouritesScreen({Key? key}) : super(key: key);

  @override
  State<ShowFavouritesScreen> createState() => _ShowFavouritesScreenState();
}

class _ShowFavouritesScreenState extends State<ShowFavouritesScreen> {

  UserModel user=UserModel();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initMethod();


    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Profile",style: profileStyle,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
            child: Text("Favourites",style:profileStyle ,),
          ),
          Consumer<GetFavPropProvider>(builder:(context,fav,_){
            return fav.favProp!.isNotEmpty?ListView.builder(
                shrinkWrap: true,
                itemCount: fav.favProp!.length,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                primary: false,
                itemBuilder: (BuildContext,index){
                  return FavouriteWidget(
                    favProp: fav.favProp![index],

                    userId: user.id??"",
                  );
                }):Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/favourites_prop_icon.png",width: 200.0,height: 250.0,),
                  Text("No Favourites Yet",style: TextStyle(color: Colors.red[500],fontSize: 24.0,fontWeight: FontWeight.w400),),

                ],
              ),
            );
          }),
        ],
      ),
    );
  }
  initMethod()async {
    user= await   getUser();
   await getFavouritePropHandler(context, user.id!);
  }
}

class FavouriteWidget extends StatefulWidget {
  FavouriteProperty favProp;
  final String userId;

  FavouriteWidget({required this.favProp, required this.userId});

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: (){

        NavigationServices.goNextAndKeepHistory(context: context, widget: FavouritePropertiesDetailsScreen(prop: widget.favProp,));
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
                widget.favProp.propertyImages!.isNotEmpty?

                CustomPropertyCountWidget(
                  imageUrl: '${widget.favProp.propertyImages![0].imageURL!}',
                  totalCount: '${widget.favProp.propertyImages!.length.toString()}',

                )
                    :
                Image.asset(
                  "assets/images/property_image.jpg",
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
                      Text("Expire After ${widget.favProp.expireAfter}"),
                      Text(
                        "PKR ${widget.favProp.amount}",
                        style: pkrStyle,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.78,
                        child: Text(
                          "${widget.favProp.detailAddress}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: addressStyle,
                        ),
                      ),
                      Text(
                        "${widget.favProp.category}"+" For "+"${widget.favProp.purpose}",
                        style: houseStyle,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HouseDetails(
                              icon: Icons.bed_outlined,
                              title: widget.favProp.noOfBeds.toString(),
                            ),
                            HouseDetails(
                              icon: Icons.bathtub_outlined,
                              title: "${widget.favProp.noOfBaths}",
                            ),
                            HouseDetails(
                              icon: Icons.house,
                              title: "${widget.favProp.landArea}",
                            ),
                            Spacer(),
                            InkWell(
                                onTap: ()async{
                                 await delFavPropHandler(context: context, userId: widget.userId, propId: widget.favProp.id!);
                                 await getFavouritePropHandler(context, widget.userId);

                                },
                                child: Icon(Icons.favorite,size: 20.0,color: redColor,))


                          ],
                        ),
                      ),
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
                                sendSMS(message: message, recipients: [
                                 "${widget.favProp.userMobile}"
                                ]);
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
                                    onPressed: () {
                                      makePhoneCall( "${widget.favProp.userMobile}");
                                    },
                                    icon: Icon(Icons.call),
                                    label: Text("Call",style: TextStyle(fontSize: 14.0),))),
                            SizedBox(width: 3.0,),
                            Expanded(
                                child: InkWell(
                                  onTap: (){
                                    launchWhatsapp(
                                        context: context, phoneNo: '${widget.favProp.userMobile}');
                                  },
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