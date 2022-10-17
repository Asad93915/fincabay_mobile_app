



import 'package:fincabay_application/providers/property_type_provider.dart';
import 'package:fincabay_application/utils/handlers.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


import '../../../configs/text_styles.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../helper_widgets/custom_browse_properties_widgets.dart';

import '../../../providers/cities_provider.dart';
import '../../../providers/area_size_provider.dart';
import 'area_size_view_screen.dart';
import 'area_size_widget.dart';
import 'cities_widget.dart';

class CommercialWidget extends StatefulWidget {
  const CommercialWidget({Key? key}) : super(key: key);

  @override
  State<CommercialWidget> createState() => _CommercialWidgetState();
}

class _CommercialWidgetState extends State<CommercialWidget> {



  int _selectedType=0;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      propertyTypeHandler(context,"Commercial");
      citiesHandler(context);
      getAllAreaUnitHandler(context,'Commercial');
    });
    setState((){});
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
            return   city.city!.isNotEmpty? SizedBox(
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
            );
          }),
        if(_selectedType==1)
          Consumer<PropertyTypeProvider>(builder: (context,type,_){
            List<Widget> widgets=[];
            type.propertyType!.isNotEmpty?  type.propertyType!.forEach((element) {
              widgets.add(PropertyTypeWidget(
                onTap: (){
                  NavigationServices.goNextAndKeepHistory(context: context, widget: AreaSizeViewScreen(
                      areaSizeId: 0, catName: "Commercial", typeId: element.pTypeId!));
                  setState((){});

                },
                type: element,
              ));
            }):Container(
              alignment: Alignment.center,
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
            areas.areaUnit!.isNotEmpty?  areas.areaUnit!.forEach((element) {
              widgets.add( AreaUnitWidget(
                onTap: (){
                  NavigationServices.goNextAndKeepHistory(context: context, widget:  AreaSizeViewScreen(
                    areaSizeId: element.id!,
                    catName: "Commercial",
                    typeId: 0,
                  ));

                },
                areaUnitModel: element,


              ));
            }):Container(
              child: Text("No Area Unit Available",style: labelStyle2,),
            );
            return Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: widgets,
              ),
            );

          }),
      ],
    );
  }
}
