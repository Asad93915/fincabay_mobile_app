import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/customer_module/screens/profile_module/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../dialogs/show_will_pop_dialog.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_widgets/custom_bottom_app_bar_widget.dart';
import '../../providers/get_user_properties_provider.dart';
import '../../services/get_user_properties_service.dart';
import '../../cusomer_drawer_screen.dart';
import 'dashboard_widgets/dashboard_widgets.dart';
import 'dashboard_widgets/new_project_screen.dart';
import '../profile_module/get_user_properties_screen.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {


  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return

      WillPopScope(
        onWillPop: () async {
          final shouldPop = await showCupertinoModalPopup(
              context: context, builder: (context){
                return showWillPopDialog(context);
          });
          return shouldPop!;
        },
        child: Scaffold(
            drawer: CustomDrawer(),
            backgroundColor: selectedIndex == 3 ? whiteColor : barColor,
            appBar: selectedIndex == 0 ? PreferredSize(
              preferredSize: Size.fromHeight(200.0),
              child: AppBar(
                leading: Builder(builder: (context) =>
                    IconButton(onPressed: () {
                      Scaffold.of(context).openDrawer();
                      setState(() {});
                    },
                        icon: Icon(Icons.menu, color: whiteColor,))),
                backgroundColor: barColor,
                elevation: 0.0,
                flexibleSpace: Stack(
                  children: [
                    Image.asset("assets/images/home_header.png", height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.fill,),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          margin: EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          color: whiteColor,
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12.0),
                                hintText: "Search",
                                suffixIcon: Icon(Icons.search_outlined),
                                border: InputBorder.none
                            ),
                          )),
                    ),
                  ],
                ),
                iconTheme: IconThemeData(color: Colors.transparent),
              ),
            ) :
            selectedIndex == 1 ? AppBar(
              backgroundColor: bgColor,
              leading: Builder(builder: (context) =>
                  IconButton(onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }, icon: Icon(Icons.menu)),
              ),
              title: Text("New Projects", style: barStyle,),
            ) :
            selectedIndex == 2 ? AppBar(
              backgroundColor: bgColor,
              leading: Builder(builder: (context) =>
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ),
              title: Text("My Properties", style: barStyle,),
            ) :
            selectedIndex == 3 ? AppBar(
              backgroundColor: whiteColor,
              iconTheme: IconThemeData(color: blackColor),
              elevation: 0.0,
            ) :
            AppBar(),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .miniCenterDocked,
            floatingActionButton: SizedBox(
              height: 40.0,
              child: FloatingActionButton(
                splashColor: bgColor,
                backgroundColor: bgColor,
                onPressed: () {
                  //code to execute on button press
                },
                child: Icon(Icons.search), //icon inside button
              ),
            ),
            bottomNavigationBar: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 10.2,
              child: BottomAppBar(

                shape: CircularNotchedRectangle(), //shape of notch
                notchMargin: 2.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    CustomBottomAppBarWidget(
                      icon: Icons.home,
                      label: "Home",
                      selectedItemColor: selectedIndex == 0 ? true : false,
                      onTap: () {
                        selectedIndex = 0;
                        setState(() {});
                      },
                    ),
                    CustomBottomAppBarWidget(
                      icon: Icons.home_work_outlined,
                      label: "Projects",
                      selectedItemColor: selectedIndex == 1 ? true : false,
                      onTap: () {
                        selectedIndex = 1;
                        setState(() {});
                      },
                    ),
                    Spacer(),

                    CustomBottomAppBarWidget(
                      icon: CupertinoIcons.heart,
                      label: "Favourites",
                      selectedItemColor: selectedIndex == 2 ? true : false,
                      onTap: () {
                        selectedIndex = 2;
                        setState(() {});
                      },
                    ),
                    CustomBottomAppBarWidget(
                      icon: Icons.person_outline_outlined,
                      label: "Profile",
                      selectedItemColor: selectedIndex == 3 ? true : false,
                      onTap: () {
                        selectedIndex = 3;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if(selectedIndex==0-1)
                    //   GetAllPropertiesScreen(),
                    if(selectedIndex == 0)
                      DashboardWidget(),
                    if(selectedIndex == 1)
                      NewProjectsScreen(),
                    if(selectedIndex == 2)
                      Center(child: Text("Under Progress")),
                    // GetUserPropertiesScreen(),
                    if(selectedIndex == 3)
                      ProfileScreen(),
                  ],
                ),
              ),
            )
        ),
      );
  }
}
