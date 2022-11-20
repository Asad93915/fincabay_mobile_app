
import 'dart:convert';

import 'package:fincabay_application/auth/models/user_response_model.dart';
import 'package:fincabay_application/customer_module/models/get_favourite_property_model.dart';
import 'package:fincabay_application/customer_module/providers/get_favourite_prop_provider.dart';
import 'package:fincabay_application/customer_module/services/get_favourite_property_service.dart';
import 'package:fincabay_application/helper_services/delete_favourite_property_service.dart';
import 'package:fincabay_application/utils/handlers.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../../../auth/provider/user_data_provider.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/text_styles.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_widgets/custom_button.dart';
import '../../../../helper_widgets/house_details.dart';
import '../../../../utils/Functions.dart';

class FavouritesScreen extends StatefulWidget {




  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}
// final box=GetStorage();
// UserModel user=UserModel.fromJson(box.read('user'));

class _FavouritesScreenState extends State<FavouritesScreen> {
  UserModel user=UserModel();


  // _getFavouriteProperties()async{
  //   CustomLoader.showLoader(context: context);
  //   await GetFavouritePropService().getFavProp(context: context, userId: user.id??"");
  //   CustomLoader.hideLoader(context);
  // }
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
    return Column(
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

                  userId: user.id!,
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
    );
  }
  // getUserId()async{
  //   String getUserId=await LocaleStorageServices().getUser();
  //   user=UserModel.fromJson(jsonDecode(getUserId));
  //   print("User ID ${user.id}");
  //
  // }

   initMethod()async {
   user= await   getUserId();
   getFavouritePropHandler(context, user.id==null?"":user.id!);
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

  // _delFavProp()async{
  //   CustomLoader.showLoader(context: context);
  //   await DeleteFavouritePropertyService().delFavProp(context: context, userId: widget.userId, propId: widget.favProp.id!);
  //   getFavouritePropHandler(context, widget.userId);
  //   CustomLoader.hideLoader(context);
  // }

  // getFavouritePropHandler(context, widget.userId);
  @override
  Widget build(BuildContext context) {
    String imageUrl="assets/images/property_image.jpg";


    return InkWell(
      onTap: (){
        // Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //         transitionDuration: Duration(seconds: 2),
        //         pageBuilder: (_, __, ___) => PropertyDetailsScreen(
        //           imageUrl: imageUrl,
        //           price: widget.areaView.amount.toString(),
        //           sellingAsset:"${widget.areaView.propertyType}"+" For " + "${widget.areaView.purpose}",
        //           address: widget.areaView.detailAddress!,
        //           noOfBaths: widget.areaView.noOfBaths!,
        //           noOfBeds: widget.areaView.noOfBeds!,
        //           landArea: widget.areaView.landArea!,
        //           unit: widget.areaView.unit!,
        //           description: widget.areaView.description!,
        //
        //         )));
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
                        "${widget.favProp.propertyType}"+" For "+"${widget.favProp.purpose}",
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