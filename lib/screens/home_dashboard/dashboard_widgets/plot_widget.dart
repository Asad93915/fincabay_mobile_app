
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/models/plot_type_model.dart';
import 'package:fincabay_application/services/area_type_service.dart';
import 'package:fincabay_application/services/plot_type_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/colors.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_widgets/custom_browse_properties_widgets.dart';
import '../../../providers/area_type_provider.dart';
import '../../../providers/plot_type_provider.dart';
import 'area_size_widget.dart';

class PlotWidget extends StatefulWidget {
  const PlotWidget({Key? key}) : super(key: key);

  @override
  State<PlotWidget> createState() => _PlotWidgetState();
}

class _PlotWidgetState extends State<PlotWidget> {
  _plotHandler()async{
    CustomLoader.showLoader(context: context);
    await PlotTypeService().getPlot(context: context);
    CustomLoader.hideLoader(context);
  }
  int _selectedType=0;
  List<String> _locationList=[
    "DHA Phase 6","DHA Phase 5","DHA Phase 7","Bahria Town Sector C","Bahria Town Sector B","Johar Town"
  ];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _plotHandler();
      setState((){});
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
              title: "Type",
              selectedColor: _selectedType == 0 ? true : false,
              onTap: () {
                _selectedType = 0;
                setState(() {});
              },
            ),
            CustomTypeWidget(
              title: "Location",
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
          Consumer<PlotTypeProvider>(builder: (context,type,_){
            List<Widget> widgets=[];
            type.plotType!.forEach((element) {
              widgets.add(
                PlotTypesWidget(plotType: element)
              );
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


class PlotTypesWidget extends StatelessWidget {
  PlotType plotType;
  PlotTypesWidget({required this.plotType});

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
      child: Text(plotType.plotType!,style: labelStyle2,textAlign: TextAlign.center,),
    );
  }
}
