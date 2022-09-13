import 'package:fincabay_application/providers/area_size_provider.dart';
import 'package:fincabay_application/providers/area_type_provider.dart';
import 'package:fincabay_application/providers/commercial_area_type_service.dart';
import 'package:fincabay_application/providers/plot_type_provider.dart';
import 'package:fincabay_application/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AreaSizeProvider()),
        ChangeNotifierProvider(create: (context)=>AreaTypeProvider()),
        ChangeNotifierProvider(create: (context)=>PlotTypeProvider()),
        ChangeNotifierProvider(create: (context)=>CommercialAreaTypeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}


