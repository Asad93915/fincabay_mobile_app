import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/providers/location_name_provider.dart';
import 'package:fincabay_application/services/location_name_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/text_styles.dart';
import '../../helper_services/navigation_services.dart';
import 'dashboard_widgets/location_phases_screen.dart';

class LocationNameScreen extends StatefulWidget {
  final int cityId;

  LocationNameScreen({required this.cityId});

  @override
  State<LocationNameScreen> createState() => _LocationNameScreenState();
}

class _LocationNameScreenState extends State<LocationNameScreen> {
  _getLocationName() async {
    CustomLoader.showLoader(context: context);
    await GetLocationNameService()
        .getLocName(context: context, cityId: widget.cityId);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getLocationName();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: barColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: barColor,
          flexibleSpace: Stack(
            children: [
              Image.asset("assets/images/home_header.png",
                  fit: BoxFit.cover, width: double.infinity),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          suffixIcon: Icon(Icons.search_outlined),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Center(
            child: Consumer<LocationNameProvider>(
              builder: (context, location, _) {
                return location.locName!.isNotEmpty
                    ? GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisExtent: 40.0,
                                maxCrossAxisExtent: 100,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 30.0,
                                mainAxisSpacing: 15.0),
                        itemCount: location.locName!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: (){
                              NavigationServices.goNextAndKeepHistory(context: context, widget: PhasesScreen(
                                cityText:"Lahore" ,
                                areaId: location.locName![index].areaId!,
                                cityId: widget.cityId,

                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  //   color: selectedIndex==index?Color(0xFFAED6EB):whiteColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: black12)),
                              child: Text(
                                location.locName![index].areaName!,
                                style: pKrStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        })
                    : Container(
                        child: Text("No Location Name added against this city"),
                      );
              },
            ),
          )),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: kToolbarHeight * 1.5,
        decoration: BoxDecoration(
            // border: Border.all(color: black12,width: 1.0)
            ),
        child: Text(
          "LAHORE",
          style: TextStyle(
              fontSize: 91.0,
              color: Color(0xFFD1E4F0),
              fontWeight: FontWeight.w500,
              height: 0.5),
        ),
      ),
    );
  }
}
