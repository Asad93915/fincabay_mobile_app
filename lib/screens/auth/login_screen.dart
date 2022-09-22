import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:fincabay_application/helper_widgets/custom_text_field.dart';
import 'package:fincabay_application/screens/auth/forget_password_screen.dart';
import 'package:fincabay_application/screens/auth/registration_screen.dart';
import 'package:fincabay_application/services/login_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../configs/text_styles.dart';
import '../home_dashboard/home_dashboard_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  _loginHandler()async{
    CustomLoader.showLoader(context: context);
   var res= await LoginApiService().getLogin(context: context, userName: _emailCont.text, password: _passwordCont.text);
   CustomLoader.hideLoader(context);
   if(res){
     NavigationServices.goNextAndKeepHistory(context: context, widget: HomeDashboardScreen());

   }
  }

  TextEditingController _emailCont = TextEditingController(
    text: "l.lotfy@almajed4oud.com"
  );
  TextEditingController _passwordCont = TextEditingController(
    text: "Almajed4oud@123"
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
           width: double.infinity,fit: BoxFit.fill,
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 13.0, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/fincabay_logo.jpg", height: 100.0,),
                  Text(
                    "Welcome To Fincabay",
                    style: titleStyle,
                  ),
                  CustomTextField(
                    // hintText:"Email Address",
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    labelText: "Email Address",
                    controller: _emailCont,
                    focusNode: _emailFocus,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    // hintText:"Password",
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    labelText: "Password",
                    controller: _passwordCont,
                    focusNode: _passwordFocus,
                    obscureText: isObscure,
                    suffixIcon:
                    isObscure == true ? Icons.visibility : Icons.visibility_off,
                    suffixOnTap: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 10.0,),
                  TextButton(
                      onPressed: () {
                        NavigationServices.goNextAndKeepHistory(context: context, widget: ForgotPasswordScreen());
                      },
                      child: Text("Forgot Your Password", style: forgotStyle,)),
                  CustomButton(
                    width: double.infinity,
                    text: "Login",
                    fontSize: 18.0,
                    height: 50.0,
                    horizontalMargin: 6.0,
                    fontWeight: FontWeight.w800,
                    onTap: () {
                      if(_validateLogin()){
                        _loginHandler();
                        setState((){});
                      }
                      setState(() {});
                    },
                  ),
                  RichText(text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          color: Colors.black45, fontSize: 14.0, height: 2.3),
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
                            style: TextStyle(color: lightBlackColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800)
                        )
                      ]
                  ),)


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
            "assets/images/artboard _ 2.png", width: double.infinity,
            fit: BoxFit.fill,)
      ),
    );
  }

  _validateLogin() {
    if (_emailCont.text.isEmpty || !_validateEmail(_emailCont.text)) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Email is Invalid");
      _emailFocus.requestFocus();
      return false;
    }
    else if (_passwordCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Password is Invalid");
      _passwordFocus.requestFocus();
      return false;
    }
    else {
      return true;
    }
  }
  bool _validateEmail(String text) {
    if (text.isEmpty) {
      return false;
    }

    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }
}

