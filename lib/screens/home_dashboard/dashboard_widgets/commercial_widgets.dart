

import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/models/commercial_area_type_model.dart';
import 'package:fincabay_application/providers/area_type_provider.dart';
import 'package:fincabay_application/providers/commercial_area_type_service.dart';
import 'package:fincabay_application/utils/cities_handler.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../configs/text_styles.dart';
import '../../../helper_widgets/custom_browse_properties_widgets.dart';

import '../../../providers/cities_provider.dart';
import '../../../services/commercial_area_type_service.dart';
import 'area_size_widget.dart';
import 'location_widget.dart';

class CommercialWidget extends StatefulWidget {
  const CommercialWidget({Key? key}) : super(key: key);

  @override
  State<CommercialWidget> createState() => _CommercialWidgetState();
}

class _CommercialWidgetState extends State<CommercialWidget> {

  _getCommercialHandler()async{
    CustomLoader.showLoader(context: context);
    await CommercialAreaTypeService().getAreaType(context: context);
    // print(_getCommercialHandler());
    CustomLoader.hideLoader(context);
  }

  int _selectedType=0;
  List<String> _locationList=[
    "Lahore","Karachi","Islamabad", "Lahore","Karachi","Islamabad",
  ];
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      citiesHandler(context);
      _getCommercialHandler();
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
              title: "Type",
              selectedColor: _selectedType == 0 ? true : false,
              onTap: () {
                _selectedType = 0;
                setState(() {});
              },
            ),
            CustomTypeWidget(
              title: "Cities",
              selectedColor: _selectedType == 1 ? true : false,
              onTap: () {
                _selectedType = 1;
                setState(() {});
              },
            ),
            CustomTypeWidget(
              title: "Area Type",
              selectedColor: _selectedType == 2 ? true : false,
              onTap: () {
                _selectedType = 2;
                setState(() {});
              },
            ),
          ],
        ),
        if(_selectedType==0)
          Consumer<CommercialAreaTypeProvider>(builder: (context,type,_){
            List<Widget> widgets=[];
            type.commercialType!.forEach((element) {
              print("cmcn ${type.commercialType![0].commercialAreaType}");
              widgets.add(CommercialAreaTypeWidget(

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
        if(_selectedType==1)
          Consumer<CitiesProvider>(builder: (context,city,_){
            return    SizedBox(
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
            );
          }),
        if(_selectedType==2)
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
      ],
    );
  }
}
class CommercialAreaTypeWidget extends StatelessWidget {
  CommercialAreaType areaType;
  CommercialAreaTypeWidget({required this.areaType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width/4.0,
      height: MediaQuery.of(context).size.height/11.0,
      decoration: BoxDecoration(
        border: Border.all(
            color: black26
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(areaType.commercialAreaType!,style: labelStyle2,textAlign: TextAlign.center,),
    );
  }
}