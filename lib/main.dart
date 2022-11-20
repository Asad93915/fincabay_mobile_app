
import 'dart:async';


import 'package:fincabay_application/Agents_module/providers/agent_properties_provider.dart';
import 'package:fincabay_application/Agents_module/providers/staff_member_provider.dart';
import 'package:fincabay_application/Agents_module/screens/agents_home_screen.dart';
import 'package:fincabay_application/app_localization.dart';
import 'package:fincabay_application/customer_module/providers/get_favourite_prop_provider.dart';
import 'package:fincabay_application/customer_module/screens/home_dashboard/home_dashboard_screens.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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


// void main() {
//   GetStorage.init();
//   runApp(MyApp());
// }

void main() {
  GetStorage.init();
  runApp( MultiProvider(

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
        ChangeNotifierProvider(create: (context)=>GetFavPropProvider()),
        //Agents
        ChangeNotifierProvider(create: (context)=>AgentPropertiesProvider()),
        ChangeNotifierProvider(create: (context)=>GetStaffProvider())
      ],
      child: MaterialApp(home: MyApp())));
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
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUserRole(context);
      setState((){});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

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

        // home: LoginScreen(),
        home:  CircularProgressIndicator()
        // FutureBuilder<String>(
        //   future: checkUserRole(), // async work
        //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.waiting: return Text('Loading....');
        //       default:
        //         if (snapshot.hasError)
        //           return Text('Error: ${snapshot.error}');
        //         else
        //           return Text('Result: ${snapshot.data}');
        //     }
        //   },
        // )
        // home: AgentHomeScreen(),


      ),
    );
  }

  checkUserRole(context)async {
    String? userRole=await
    LocaleStorageServices().getRoleName(
    );
    if(userRole==null){

      NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeDashboardScreen());
      // isLoading=false;
      // setState((){});
      // return HomeDashboardScreen();

    }
   else
     if(userRole=="Customer"){

      NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeDashboardScreen());
      // isLoading=false;
      // setState((){});
      // return HomeDashboardScreen();

    }
    else if (userRole=="Agent"){
      // isLoading=false;
      // setState((){});
       NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: AgentHomeScreen());
    }
  }

}


