import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/Customer_module/screens/home_dashboard/d_widgets/plot_screen.dart';
import 'package:fincabay_application/Customer_module/screens/home_dashboard/d_widgets/residential_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../helper_widgets/custom_browse_properties_widgets.dart';
import '../d_widgets/commercial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;



  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

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
                  title: "Residential",
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
                CommercialScreen(),
            
          ],
        ),
      ),
    );
  }
}
