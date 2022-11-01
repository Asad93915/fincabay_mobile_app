import 'package:fincabay_application/Agents_module/screens/agents_add_property_screen.dart';
import 'package:fincabay_application/Agents_module/screens/agents_drawer_screen.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/dialogs/show_will_pop_dialog.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentHomeScreen extends StatefulWidget {
  const AgentHomeScreen({Key? key}) : super(key: key);

  @override
  State<AgentHomeScreen> createState() => _AgentHomeScreenState();
}

class _AgentHomeScreenState extends State<AgentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return await showWillPopDialog(context);
      },
      child: Scaffold(
        drawer: AgentsDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: whiteColor,
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: blackColor,
                  ));
            },
          ),
          title: Text(
            "Dahboard",
            style: addressStyle,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset(
                      "assets/images/agent_dashboard_header.jpg",
                      height: MediaQuery.of(context).size.height/3,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                        right: 18.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Looking to Sell or Rent Your Property?",
                                style: sellStyle,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    "Post Now on Fincabay.com to reach millions of users!",
                                    style: TextStyle(
                                      color: Colors.grey[1000],
                                      fontSize: 14.0,
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: bgColor,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "Get Better Prices",
                                        style: sellStyle,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: bgColor,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "Connect with Buyer",
                                        style: sellStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: bgColor,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Realtime Stats",
                                    style: sellStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                          CustomButton(
                            verticalMargin: 10.0,
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            text: "Post Your Ad",
                            bgColor: bgColor,
                            onTap: () {
                              NavigationServices.goNextAndKeepHistory(context: context, widget: AgentsAddPropertyScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomIconButton(
                      onTap: () {},
                      icon: Icons.add_shopping_cart,
                      text: "Cart",
                      horizontalMargin: 5.0,
                      iconColor: blackColor,
                      circularBorder: 10.0,
                      borderColor: black12,
                      bgColor: whiteColor,
                      textColor: blackColor,
                      fontSize: 18.0,
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                  ),
                  Expanded(
                    child: CustomIconButton(
                      onTap: () {},
                      icon: Icons.payment,
                      text: "Billing",
                      horizontalMargin: 5.0,
                      iconColor: blackColor,
                      circularBorder: 10.0,
                      borderColor: black12,
                      bgColor: whiteColor,
                      textColor: blackColor,
                      fontSize: 18.0,
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
