import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/house_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaSizeDetailsScreen extends StatefulWidget {
  const AreaSizeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AreaSizeDetailsScreen> createState() => _AreaSizeDetailsScreenState();
}

class _AreaSizeDetailsScreenState extends State<AreaSizeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: barColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
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
                        Icons.bookmark_border,
                        color: blackColor,
                      ),
                      label: Text(
                        "Save",
                        style: headerStyle,
                      ))
                ],
              ),
            )
          ],
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
            ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                primary: false,
                itemBuilder: (BuildContext,index){
              return AreaDetailsWidget();
            })
          ],
        ),
      ),
    );
  }
}
class AreaDetailsWidget extends StatelessWidget {
  const AreaDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5.0,top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Text("31 minutes ago"),
                    Text(
                      "PKR ${"1.78 Crore"}",
                      style: pkrStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.78,
                      child: Text(
                        "HALY TOWER, Sector R DHA Phase 2, Lahore, Punjab",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: addressStyle,
                      ),
                    ),
                    Text(
                      "House For Sale",
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
                            title: "3",
                          ),
                          HouseDetails(
                            icon: Icons.bathtub_outlined,
                            title: "6",
                          ),
                          HouseDetails(
                            icon: Icons.house,
                            title: "6",
                          ),
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
    );
  }
}

