
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/Customer_module/screens/home_dashboard/properties_widgets/property_search_screen.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../configs/text_styles.dart';
import '../../../../../helper_services/custom_loader.dart';
import '../../../../providers/location_phases_provider.dart';
import '../../../../services/location_phase_service.dart';

class PhasesScreen extends StatefulWidget {
  final String cityText;
  final int areaId;
  final int cityId;

  PhasesScreen({this.cityText="", required this.areaId, required this.cityId,});
  @override
  State<PhasesScreen> createState() => _PhasesScreenState();
}

class _PhasesScreenState extends State<PhasesScreen> {
  locationPhaseHandler()async{
    CustomLoader.showLoader(context: context);
    await LocationPhaseService().getPhase(context: context,areaId: widget.areaId);
    CustomLoader.hideLoader(context);
  }
  _getSearch(int phaseId)async{
      // NavigationServices.goNextAndKeepHistory(context: context, widget: PropertySearchScreen(
      //     cityId: widget.cityId, areaId: widget.areaId, phaseId: phaseId
      // ));
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      locationPhaseHandler();
    });
    setState((){});
    super.initState();
  }
  // Location location;
  int? selectedIndex;

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
              Container(
                  width: double.infinity,
                  child: Image.asset("assets/images/home_header.png",fit: BoxFit.cover,)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search_outlined),
                        border: InputBorder.none
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
          child: Consumer<LocationPhasesProvider>(builder: (context,location,_){
            return    Center(
              child: location.phase!.isNotEmpty?GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 40.0,
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 15.0

                  ),
                  itemCount: location.phase!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return  InkWell(
                      onTap: (){
                        _getSearch(
                          location.phase![index].phaseId!
                        );
                        selectedIndex=index;
                        setState((){});
                      },
                      child: Container(

                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                            color: selectedIndex==index?Color(0xFFAED6EB):whiteColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: black12)
                        ),
                        child: Text(location.phase![index].name!,style: pKrStyle,textAlign: TextAlign.center,),
                      ),
                    );
                  }):Container(
                alignment: Alignment.center,
                child: Text("No Phases against this loaction name exisits"),
              ),
            );
          })

      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: kToolbarHeight * 1.5,
        decoration: BoxDecoration(
          // border: Border.all(color: black12,width: 1.0)
        ),
        child: Text(
          "${widget.cityText}",
          maxLines: 1,
          style: TextStyle(
              fontSize: 50.0,
              color: Color(0xFFD1E4F0),
              fontWeight: FontWeight.w500,
              height: 0.5),
        ),
      ),
    );
  }
}
