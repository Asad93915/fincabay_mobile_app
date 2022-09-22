import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProjectsScreen extends StatefulWidget {
  const NewProjectsScreen({Key? key}) : super(key: key);

  @override
  State<NewProjectsScreen> createState() => _NewProjectsScreenState();
}

class _NewProjectsScreenState extends State<NewProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (BuildContext,index){
        return NewProjectsWidget();
      }),
    ) ;
  }
}
class NewProjectsWidget extends StatelessWidget {
  const NewProjectsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/new_project.jpg",
                  height: MediaQuery.of(context).size.height / 5.4,
                  width: MediaQuery.of(context).size.width / 3.0,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kings Town",
                        style: lessStyle,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.9,
                          child: Text(
                            "Raiwaind Road,Lahore",
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                          )),
                      RichText(text: TextSpan(

                          text:"PKR ", style: pKrStyle,
                          children: [
                            TextSpan(text: "27 Lakh",style: headerStyle),
                            TextSpan(text: " to ",style: headerStyle),
                            TextSpan(text: "1.25 Crore\n",style: headerStyle)
                          ]
                      )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            height: 33.0,
                            width: MediaQuery.of(context).size.width/5,
                            text: "Email",
                            textColor: bgColor,
                            onTap: (){},
                            borderColor: bgColor,
                            bgColor: whiteColor,
                          ),CustomButton(
                            horizontalMargin: 6.0,
                            height: 33.0,
                            width: MediaQuery.of(context).size.width/5,
                            text: "Call",
                            onTap: (){},
                          ),

                        ],
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
