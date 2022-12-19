import 'dart:convert';

import 'package:fincabay_application/Agents_module/screens/agents_home_screen.dart';
import 'package:fincabay_application/app_localization.dart';
import 'package:fincabay_application/auth/screens/forget_password_screen.dart';
import 'package:fincabay_application/auth/screens/registration_screen.dart';

import 'package:fincabay_application/auth/services/login_api_service.dart';
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/constants.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/utils/local_storage_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/text_styles.dart';
import '../../Customer_module/screens/home_dashboard/home_dashboard_menus/home_dashboard_screens.dart';
import '../../Customer_module/screens/home_dashboard/properties_widgets/add_property_screen.dart';
import '../../utils/Functions.dart';
import '../../utils/variable_storage.dart';
import '../models/user_response_model.dart';
import '../provider/user_data_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _loginHandler() async {
    CustomLoader.showLoader(context: context);
    var res = await LoginApiService().getLogin(
        context: context, email: _emailCont.text, password: _passwordCont.text);
    CustomLoader.hideLoader(context);
    if (res) {
      setVisitorView(true);
      LocaleStorageServices().saveRoleName(
          Provider.of<UserDataProvider>(context, listen: false)
              .user!
              .roleName!);

      Provider.of<UserDataProvider>(context, listen: false).user!.roleName ==
              "Customer"
          ? NavigationServices.goNextAndDoNotKeepHistory(
              context: context, widget: HomeDashboardScreen())
          : Provider.of<UserDataProvider>(context, listen: false)
                      .user!
                      .roleName ==
                  "Agent"
              ? NavigationServices.goNextAndDoNotKeepHistory(
                  context: context, widget: AgentHomeScreen())
              : null;
    }
  }

  TextEditingController _emailCont = TextEditingController(
    text: "customer@gmail.com"
  );
  TextEditingController _passwordCont = TextEditingController(
    text: "Asad123@"
  );
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/artboard _1.png'),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          backgroundColor: barColor,
          elevation: 0.0,
        ),
      ),
      backgroundColor: barColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset("assets/images/artboard _1.png", height: 120.0,
            //   width: double.infinity,
            //   fit: BoxFit.cover,),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/fincabay_logo.jpg",
                    height: 100.0,
                  ),
                  Text("Welcome To Fincabay!"),
                  // Text(
                  //   "${AppLocalizations.of(context)!.translate(WELCOME).toString()}",
                  //   style: titleStyle,
                  // ),
                  CustomTextField(
                    // hintText:"Email Address",
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    labelText: "Email Address",
                    controller: _emailCont,
                    focusNode: _emailFocus,
                  ),

                  CustomTextField(
                    // hintText:"Password",
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    labelText: "Password",
                    controller: _passwordCont,
                    focusNode: _passwordFocus,
                    obscureText: isObscure,
                    suffixIcon: isObscure == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixOnTap: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                  ),

                  TextButton(
                      onPressed: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context, widget: ForgotPasswordScreen());
                      },
                      child: Text(
                        "Forgot Your Password",
                        style: forgotStyle,
                      )),
                  CustomButton(
                    width: double.infinity,
                    text: "Login",
                    fontSize: 18.0,

                    horizontalMargin: 6.0,
                    fontWeight: FontWeight.w800,
                    onTap: () {
                      if (_validateLogin()) {
                        _loginHandler();
                        setState(() {});
                      }
                    },
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: accStyle,
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {});
                                  NavigationServices.goNextAndKeepHistory(
                                      context: context,
                                      widget: RegistrationScreen());
                                },
                              text: "Sign Up",
                              style: signUpStyle)
                        ]),
                  ),
                  Text(
                    "OR",
                    style: forgotStyle,
                  ),
                  InkWell(
                      onTap: () async {
                        // String email=await getUserEmail();
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: AddPropertyScreen(
                              userEmail: "",
                            ));
                      },
                      child: Text(
                        "Add Property",
                        style: addPropStyle,
                      ))
                ],
              ),
            ),
            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Image.asset("assets/images/artboard _ 2.png",height: 150.0,width: double.infinity,fit: BoxFit.fill,))
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: kToolbarHeight * 2.0,
          width: double.infinity,
          child: Image.asset(
            "assets/images/artboard _ 2.png",
            width: double.infinity,
            fit: BoxFit.fill,
          )),
    );
  }

  _validateLogin() {
    if (_emailCont.text.isEmpty || !validateEmail(_emailCont.text)) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Email is Invalid");
      _emailFocus.requestFocus();
      return false;
    } else if (_passwordCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Valid Password");
      _passwordFocus.requestFocus();
      return false;
    } else {
      return true;
    }
  }
}
