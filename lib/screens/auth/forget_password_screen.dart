
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_services/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper_widgets/custom_button.dart';
import '../../helper_widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
   TextEditingController _newPasswordCont=TextEditingController();
   TextEditingController _confirmPasswodCont=TextEditingController();
   FocusNode _newPasswordNode=FocusNode();
   FocusNode _confirmPasswordNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: barColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/Artboard – 3.png'),
            width: double.infinity,fit: BoxFit.fill,
          ),
          backgroundColor: barColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.transparent),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 6.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/fincabay_logo.jpg", height: 100.0,),
                Text("Create Password",style: passwordStyle,),
                CustomTextField(
                  // hintText:"Email Address",
                  controller: _newPasswordCont,
                  focusNode: _newPasswordNode,
                  obscureText: true,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  labelText: "New Password",

                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                  // hintText:"Password",
                  controller: _confirmPasswodCont,
                  focusNode: _confirmPasswordNode,
                  obscureText: true,
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                  labelText: "Confirm Password",
                ),
                CustomButton(
                  verticalMargin: 12.0,
                  horizontalMargin: 6.0,
                  width: double.infinity,
                  text: "Create Password",
                  fontSize: 18.0,
                  height: 50.0,
                  fontWeight: FontWeight.w800,
                  onTap: (){
                    _validateForgot();
                  },

                ),
              ],
            ),
          ),
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
  _validateForgot(){
    if(_newPasswordCont.text.isEmpty || _newPasswordCont.text.length<4){
      CustomSnackBar.failedSnackBar(context: context, message: "Password Length must be greater then 4");
      _newPasswordNode.requestFocus();
      return false;
    }
    else if(_confirmPasswodCont.text.isEmpty || _confirmPasswodCont.text.length<4){
      CustomSnackBar.failedSnackBar(context: context, message: "Confirm Password Length must be greater then 4");
      _confirmPasswordNode.requestFocus();
      return false;
    }
    else if(_newPasswordCont.text != _confirmPasswodCont.text){
      CustomSnackBar.failedSnackBar(context: context, message: "Password Should be Matched");
      _newPasswordNode.requestFocus();
      return false;
    }
  }
}
