
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/property_type_provider.dart';
import 'package:fincabay_application/screens/home_dashboard/dashboard_widgets/cities_widget.dart';

import 'package:fincabay_application/utils/handlers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../helper_services/navigation_services.dart';
import '../../../helper_widgets/custom_browse_properties_widgets.dart';

import '../../../providers/area_size_provider.dart';

import 'area_size_view_screen.dart';
import 'area_size_widget.dart';

class PlotWidget extends StatefulWidget {
  const PlotWidget({Key? key}) : super(key: key);

  @override
  State<PlotWidget> createState() => _PlotWidgetState();
}

class _PlotWidgetState extends State<PlotWidget> {

  int _selectedType=0;


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      propertyTypeHandler(context,'Plots');
      getAllAreaUnitHandler(context,'Plots');
      citiesHandler(context);

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTypeWidget(
              title: "Cities",
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
              title: "Area Size",
              selectedColor: _selectedType == 2 ? true : false,
              onTap: () {
                _selectedType = 2;
                setState(() {});
              },
            ),
          ],
        ),
        if(_selectedType==0)
          Consumer<CitiesProvider>(builder: (context,city,_){
            return    city.city!.isNotEmpty?SizedBox(
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
                    itemCount: city.city!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CitiesWidget(
                        cities: city.city![index],
                      );
                    }),
              ),
            ):Container(
              alignment: Alignment.center,
              child: Text("No Cities Available",style: labelStyle2,),
            );;
          }),
        if(_selectedType==1)
          Consumer<PropertyTypeProvider>(builder: (context,type,_){
            List<Widget> widgets=[];
            type.propertyType!.isNotEmpty?  type.propertyType!.forEach((element) {
              widgets.add(
                  PropertyTypeWidget(
                    onTap: (){
                      NavigationServices.goNextAndKeepHistory(context: context, widget: AreaSizeViewScreen(
                          areaSizeId: 0,
                          catName: "Plots",
                          typeId: element.pTypeId!));


                    },
                    type: element,

                  )
              );
            }):Container(
              child: Text("No Property Type Available",style: labelStyle2,),
            );
            return Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widgets,
              ),
            );
          }),
        if(_selectedType==2)

          Consumer<AreaSizeProvider>(builder: (context,areas,_){
            List<Widget>widgets=[];

            areas.areaUnit!.isNotEmpty?areas.areaUnit!.forEach((element) {
              widgets.add( InkWell(
                onTap: (){
                  NavigationServices.goNextAndKeepHistory(context: context, widget:  AreaSizeViewScreen(
                    areaSizeId: element.id!,
                    catName: "Plots",
                    typeId: 0,
                  ));

                },

                child: AreaUnitWidget(
                  areaUnitModel: element,

                ),
              ));
            }):Container(
              child: Text("No Area Unit Available",style: labelStyle2,),
            );
            return Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widgets,
              ),
            );

          }),
      ],
    );
  }
}



