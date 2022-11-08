import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUSScreen extends StatefulWidget {
  @override
  _AboutUSScreenState createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPIQ3_kvrJDBEna5SvAxb1K0ieyngeZSuFFQ&usqp=CAU',
                height: 150.0,
                fit: BoxFit.fill,
              ),
              Text(
                "This project is proposed & designed by Absolute Solutions as a gift to PmLn.",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          20.0,
                        ),
                        bottomRight: Radius.circular(
                          20.0,
                        )),
                  ),
                  child: Text(
                    'Pak Office',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(flex: 1, child: Icon(CupertinoIcons.home)),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "Office No. 902-B,9th Floor, Haly Tower, Phase-II DHA, Lahore Cantt, Pakistan",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(flex: 1, child: Icon(Icons.phone)),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "+92-423-6626456",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.web),
                  ),
                  Expanded(
                      flex: 9,
                      child: Text(
                        "www.ab-sol.net",
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                ],
              ),

              //KSA
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          20.0,
                        ),
                        bottomRight: Radius.circular(
                          20.0,
                        )),
                  ),
                  child: Text(
                    'KSA Office',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(flex: 1, child: Icon(CupertinoIcons.home)),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "Dabbab Street, Riyadh, Saudi Arabia",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        CupertinoIcons.mail,
                      )),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "salesKsa@ab-sol.net",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.phone),
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "+966-1-4127523",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.web),
                  ),
                  Expanded(
                      flex: 9,
                      child: Text(
                        "www.ab-sol.net",
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                ],
              ),

              //USA OFFICE

              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          20.0,
                        ),
                        bottomRight: Radius.circular(
                          20.0,
                        )),
                  ),
                  child: Text(
                    'USA Office',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(flex: 1, child: Icon(CupertinoIcons.home)),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "9128 Strada PI.Suite # 10115, Naples. FL. 34108",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),

              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(flex: 1, child: Icon(Icons.phone)),
                  Expanded(
                    flex: 9,
                    child: Text(
                      "+1(516)789-0352",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.web),
                  ),
                  Expanded(
                      flex: 9,
                      child: Text(
                        "www.ab-sol.net",
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
