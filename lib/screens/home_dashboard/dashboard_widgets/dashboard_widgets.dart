import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/providers/area_size_provider.dart';
import 'package:fincabay_application/screens/home_dashboard/dashboard_widgets/home_widget.dart';
import 'package:fincabay_application/screens/home_dashboard/dashboard_widgets/plot_widget.dart';
import 'package:fincabay_application/services/area_size_service.dart';
import 'package:fincabay_application/services/area_type_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/colors.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_widgets/custom_browse_properties_widgets.dart';
import '../../../providers/area_type_provider.dart';
import 'area_size_widget.dart';
import 'commercial_widgets.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  int _selectedIndex = 0;


  _areaSizeHandler()async{
    CustomLoader.showLoader(context: context);
    await AreaSizeService().getArea(context: context);
    await AreaTypeService().getAreaType(context: context);

    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _areaSizeHandler();
      print(_areaSizeHandler());
      setState((){});
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Browse Properties",
              style: propertyStyle,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBrowsPropertyWidget(
                  icon: Icons.house_outlined,
                  title: "Homes",
                  selectedColor: _selectedIndex == 0 ? true : false,
                  onTap: () {
                    _selectedIndex = 0;
                    setState(() {});
                  },
                ),
                CustomBrowsPropertyWidget(
                  icon: Icons.edit_location_outlined,
                  title: "Plots",
                  selectedColor: _selectedIndex == 1 ? true : false,
                  onTap: () {
                    _selectedIndex = 1;
                    setState(() {});
                  },
                ),
                CustomBrowsPropertyWidget(
                  icon: Icons.location_city_sharp,
                  title: "Commercial",
                  selectedColor: _selectedIndex == 2 ? true : false,
                  onTap: () {
                    _selectedIndex = 2;
                    setState(() {});
                  },
                ),
              ],
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.black26,
              margin: EdgeInsets.only(bottom: 15.0),
            ),
            if (_selectedIndex == 0)
              HomeWidget(),
            if(_selectedIndex==1)
              PlotWidget(),
              if(_selectedIndex==2)
                CommercialWidget(),
            
          ],
        ),
      ),
    );
  }
}
