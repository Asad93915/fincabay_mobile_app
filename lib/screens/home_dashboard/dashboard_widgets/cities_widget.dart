

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/providers/location_phases_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../location_screen.dart';
import '../../../models/cities_model.dart';
import '../../../services/location_phase_service.dart';

class CitiesWidget extends StatefulWidget {
  Cities cities;
  CitiesWidget({required this.cities});

  @override
  State<CitiesWidget> createState() => _CitiesWidgetState();
}

class _CitiesWidgetState extends State<CitiesWidget> {
  locationPhaseHandler()async{
    CustomLoader.showLoader(context: context);
    await LocationPhaseService().getPhase(context: context);
    CustomLoader.hideLoader(context);
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

  @override

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // buildShowPhasesDialog(context);
        NavigationServices.goNextAndKeepHistory(context: context, widget: LocationScreen(
          cityText:widget.cities.name! ,
        ));
      },
      child: Container(

        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: black26,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(widget.cities.name==null?"null":widget.cities.name!,textAlign: TextAlign.center,),
      ),
    );;
  }

  // buildShowPhasesDialog(BuildContext context){
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return LocationScreen();
  //       });
  // }
}