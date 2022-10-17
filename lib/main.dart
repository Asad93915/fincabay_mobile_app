
import 'package:fincabay_application/providers/area_size_view_provider.dart';
import 'package:fincabay_application/providers/cities_provider.dart';
import 'package:fincabay_application/providers/area_size_provider.dart';
import 'package:fincabay_application/providers/get_all_properties_provider.dart';
import 'package:fincabay_application/providers/location_name_provider.dart';
import 'package:fincabay_application/providers/location_phases_provider.dart';
import 'package:fincabay_application/providers/property_search_provider.dart';
import 'package:fincabay_application/providers/property_type_provider.dart';
import 'package:fincabay_application/providers/registration_provider.dart';
import 'package:fincabay_application/providers/user_data_provider.dart';
import 'package:fincabay_application/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  GetStorage.init();
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
        ChangeNotifierProvider(create: (context)=>PropertyTypeProvider()),
        ChangeNotifierProvider(create: (context)=>UserDataProvider()),
        ChangeNotifierProvider(create: (context)=>CitiesProvider()),
        ChangeNotifierProvider(create: (context)=>RegistrationProvider()),
        ChangeNotifierProvider(create: (context)=>LocationNameProvider()),
        ChangeNotifierProvider(create: (context)=>LocationPhasesProvider()),
        ChangeNotifierProvider(create: (context)=>PropertySearchProvider()),
        ChangeNotifierProvider(create: (context)=>GetAllPropertiesProvider()),
        ChangeNotifierProvider(create: (context)=>AreaSizeViewProvider())
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


