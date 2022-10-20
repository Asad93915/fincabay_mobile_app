
import 'package:fincabay_application/helper_widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../../../configs/colors.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_widgets/house_details.dart';
import '../../models/get_all_properties_model.dart';
class GetAllPropertiesScreen extends StatefulWidget {
  AllProperties prop;

  GetAllPropertiesScreen({required this.prop});

  @override
  State<GetAllPropertiesScreen> createState() => _GetAllPropertiesScreenState();
}

class _GetAllPropertiesScreenState extends State<GetAllPropertiesScreen> {
  String message =
      "Hey Asad, I am using Fincabay.com app please call me on this number";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/property_image.jpg",
                height: MediaQuery.of(context).size.height / 4.5,
                width: 125.0,
                fit: BoxFit.fill,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expire After ${widget.prop.expireAfter}"),
                    Text(
                      "PKR ${widget.prop.amount}",
                      style: pkrStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.78,
                      child: Text(
                        widget.prop.detailAddress!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: addressStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.prop.propertyType!} For ",
                          style: houseStyle,
                        ),
                        Text(
                          widget.prop.purpose!,
                          style: houseStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HouseDetails(
                            icon: Icons.bed_outlined,
                            title: widget.prop.noOfBeds.toString(),
                          ),
                          HouseDetails(
                            icon: Icons.bathtub_outlined,
                            title: widget.prop.noOfBaths.toString(),
                          ),
                          HouseDetails(
                            icon: Icons.grid_view,
                            title: "6",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            verticalMargin: 5.0,
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 5.8,
                            bgColor: whiteColor,
                            borderColor: bgColor,
                            text: "SMS",
                            textColor: bgColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              height: 30.0,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: bgColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  onPressed: () {
                                    {
                                      _sendSMS(message, [
                                        '+923414044446',
                                        // apis like that
                                        // '${widget.missionReminderModel.phone}',
                                      ]);
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(Icons.call),
                                  label: Text(
                                    "Call",
                                    style: TextStyle(fontSize: 14.0),
                                  ))),
                          SizedBox(
                            width: 3.0,
                          ),
                          Expanded(
                              child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: Icon(
                              Icons.whatsapp,
                              color: whiteColor,
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      ),
    );
  }

  void _sendSMS(String message, List<String> recipents) async {
    print('i am message $message');
    print('i am recipents $recipents');
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
