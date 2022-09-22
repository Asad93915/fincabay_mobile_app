import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/cities_model.dart';

class CitiesWidget extends StatelessWidget {
  Cities cities;
  CitiesWidget({required this.cities});

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: black26,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(cities.name==null?"null":cities.name!,textAlign: TextAlign.center,),
    );;
  }
}