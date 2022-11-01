
import 'package:fincabay_application/Agents_module/providers/agent_properties_provider.dart';
import 'package:fincabay_application/Agents_module/providers/staff_member_provider.dart';
import 'package:fincabay_application/app_localization.dart';
import 'package:fincabay_application/customer_module/screens/home_dashboard/home_dashboard_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth/screens/login_screen.dart';
import 'auth/provider/registration_provider.dart';
import 'auth/provider/user_data_provider.dart';
import 'customer_module/providers/area_size_provider.dart';
import 'customer_module/providers/area_size_view_provider.dart';
import 'customer_module/providers/cities_provider.dart';
import 'customer_module/providers/get_user_properties_provider.dart';
import 'customer_module/providers/location_name_provider.dart';
import 'customer_module/providers/location_phases_provider.dart';
import 'customer_module/providers/property_search_provider.dart';
import 'customer_module/providers/property_type_provider.dart';

void main() {
  GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', '');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }


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
        ChangeNotifierProvider(create: (context)=>GetUserPropertiesProvider()),
        ChangeNotifierProvider(create: (context)=>AreaSizeViewProvider()),
        //Agents
        ChangeNotifierProvider(create: (context)=>AgentPropertiesProvider()),
        ChangeNotifierProvider(create: (context)=>GetStaffProvider())
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

        supportedLocales: [
          Locale('en',''),
          Locale('ur','')
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: _locale,

        home: LoginScreen(),
        // home: HomeDashboardScreen(),
        // home: AgentHomeScreen(),


      ),
    );
  }
}


