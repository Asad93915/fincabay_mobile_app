
import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../auth/models/user_response_model.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_widgets/custom_profile_widget.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
    UserModel user=UserModel.fromJson(box.read('user'));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Profile",style: profileStyle,),
          Text(user.userName!),

         Center(
           child: Wrap(
             alignment: WrapAlignment.center,
             crossAxisAlignment: WrapCrossAlignment.center,
             children: [
               CustomProfileWidget(
                 profileText: "Profile\nSettings",
                 icon: Icons.settings,
                 onTap: (){},
                 selectedColor: false,
               ),
               CustomProfileWidget(
                 profileText: "My\nProperties",
                 icon: CupertinoIcons.home,
                 onTap: (){},
                 selectedColor: false,
               ),
               CustomProfileWidget(
                 profileText: "Drafts",
                 icon: Icons.drafts,
                 onTap: (){},
                 selectedColor: false,
               ),
             ],
           ),
         ),

          Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            margin: EdgeInsets.only(top: 30.0,bottom: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: black12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/add_property.jpg",height:MediaQuery.of(context).size.height / 10,width: 80.0,fit: BoxFit.fill,),

                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 10.0),
                          child: Text("Looking to sell or rent\nout your property?",style: addPropStyle,),
                        ))
                      ],
                    ),
                  ),

                  CustomButton(
                    onTap: (){},
                    height: 40.0,
                    bgColor: postColor,
                    verticalMargin: 12.0,
                    horizontalMargin: 20.0,
                    width: double.infinity,
                    text: "Post an Ad",
                  )
                ],
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          TextButton.icon(onPressed: (){}, icon: Icon(Icons.logout), label: Text("Log Out"))

        ],
      ),
    );
  }
}
