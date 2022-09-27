

import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/get_all_area_unit_provider.dart';
import 'package:fincabay_application/providers/property_type_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper_widgets/custom_browse_properties_widgets.dart';

import '../../../utils/handlers.dart';
import 'area_size_details_screen.dart';
import 'area_size_widget.dart';
import 'location_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedType = 0;


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      getAllAreaUnitHandler(context);
      propertyTypeHandler(context);
   await  citiesHandler(context);
      setState((){});
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTypeWidget(
              title: "Area Unit",
              selectedColor: _selectedType == 0 ? true : false,
              onTap: () {
                _selectedType = 0;
                setState(() {});
              },
            ),
            CustomTypeWidget(
              title: "Type",
              selectedColor: _selectedType == 1 ? true : false,
              onTap: () {
                _selectedType = 1;
                setState(() {});
              },
            ),
            CustomTypeWidget(
              title: "Cities",
              selectedColor: _selectedType == 2 ? true : false,
              onTap: () {
                _selectedType = 2;
                setState(() {});
              },
            ),
          ],
        ),
        if(_selectedType==0)
          Consumer<GetAllAreaUnitProvider>(builder: (context,areas,_){
            List<Widget>widgets=[];

            areas.areaUnit!.forEach((element) {
              widgets.add( AreaSizeWidget(
                onTap: (){
                  NavigationServices.goNextAndKeepHistory(context: context, widget: AreaSizeDetailsScreen());
                }, areaUnitModel: element,


              ));
            });
            return Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widgets,
              ),
            );

          }),
        if(_selectedType==1)
          Consumer<PropertyTypeProvider>(builder: (context,type,_){
            List<Widget> widgets=[];
            type.propertyType!.forEach((element) {
              widgets.add(PropertyTypeWidget(
              type: element,
              ));
            });
            return Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widgets,
              ),
            );
          }),
        if(_selectedType==2)
         Consumer<CitiesProvider>(builder: (context,cities,_){
           return  SizedBox(
             width: double.infinity,
             height: MediaQuery.of(context).size.height/4.5,
             child: Center(
               child: GridView.builder(
                   padding: EdgeInsets.symmetric(vertical: 10.0),
                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                       mainAxisExtent: 60.0,
                       maxCrossAxisExtent: 100,
                       childAspectRatio: 1.5,
                       crossAxisSpacing: 20,
                       mainAxisSpacing: 10

                   ),
                   itemCount: cities.city!.length,
                   itemBuilder: (BuildContext ctx, index) {
                     return CitiesWidget(
                       cities: cities.city![index],
                     );
                   }),
             ),
           );
         })

      ],
    );
  }
}

