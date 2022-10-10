
import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/get_all_area_unit_provider.dart';
import 'package:fincabay_application/providers/location_name_provider.dart';
import 'package:fincabay_application/providers/location_phases_provider.dart';
import 'package:fincabay_application/providers/property_type_provider.dart';
import 'package:fincabay_application/providers/registration_provider.dart';
import 'package:fincabay_application/providers/user_data_provider.dart';
import 'package:fincabay_application/screens/auth/login_screen.dart';
import 'package:fincabay_application/screens/home_dashboard/location_names_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider(create: (context)=>GetAllAreaUnitProvider()),
        ChangeNotifierProvider(create: (context)=>PropertyTypeProvider()),
        ChangeNotifierProvider(create: (context)=>UserDataProvider()),
        ChangeNotifierProvider(create: (context)=>CitiesProvider()),
        ChangeNotifierProvider(create: (context)=>RegistrationProvider()),
        ChangeNotifierProvider(create: (context)=>LocationNameProvider()),
        ChangeNotifierProvider(create: (context)=>LocationPhasesProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3:  false,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme
          ),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        // home: CitiesAreasScreen(),
      ),
    );
  }
}


