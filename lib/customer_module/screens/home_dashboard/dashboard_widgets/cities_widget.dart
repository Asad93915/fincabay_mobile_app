

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/customer_module/screens/home_dashboard/location_names_screen.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/cities_model.dart';


class CitiesWidget extends StatefulWidget {
  Cities cities;
  CitiesWidget({required this.cities});

  @override
  State<CitiesWidget> createState() => _CitiesWidgetState();
}

class _CitiesWidgetState extends State<CitiesWidget> {




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // buildShowPhasesDialog(context);
        // NavigationServices.goNextAndKeepHistory(context: context, widget: PhasesScreen(
        //   cityText:widget.cities.cityName! ,
        // ));
        NavigationServices.goNextAndKeepHistory(context: context, widget: AreaNameScreen(
          cityId: widget.cities.cityId!,
          cityName: widget.cities.cityName!,
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
        child: Text(widget.cities.cityName==null?"null":widget.cities.cityName!,textAlign: TextAlign.center,),
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