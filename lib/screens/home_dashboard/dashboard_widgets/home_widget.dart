

import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper_widgets/custom_browse_properties_widgets.dart';
import '../../../providers/area_size_provider.dart';
import '../../../providers/area_type_provider.dart';
import 'area_size_details_screen.dart';
import 'area_size_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedType = 0;
  List<String> _locationList=[
    "DHA Phase 6","DHA Phase 5","DHA Phase 7","Bahria Town Sector C","Bahria Town Sector B","Johar Town"
  ];
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
              title: "Area Size",
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
              title: "Location",
              selectedColor: _selectedType == 2 ? true : false,
              onTap: () {
                _selectedType = 2;
                setState(() {});
              },
            ),
          ],
        ),
        if(_selectedType==0)
          Consumer<AreaSizeProvider>(builder: (context,areas,_){
            List<Widget>widgets=[];

            areas.area!.forEach((element) {
              widgets.add( AreaSizeWidget(
                onTap: (){
                  NavigationServices.goNextAndKeepHistory(context: context, widget: AreaSizeDetailsScreen());
                },
                area: element.totalArea==null?"amdm":element.totalArea!,
                areaType: element.areaType==null?"andjabd":element.areaType!,

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
          Consumer<AreaTypeProvider>(builder: (context,type,_){
            List<Widget> widgets=[];
            type.areaType!.forEach((element) {
              widgets.add(AreaTypeWidget(
                areaType: element,
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
          SizedBox(
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
                  itemCount: _locationList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(

                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(_locationList[index],textAlign: TextAlign.center,),
                    );
                  }),
            ),
          ),

      ],
    );
  }
}
