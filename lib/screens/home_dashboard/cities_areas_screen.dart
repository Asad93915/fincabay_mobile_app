import 'package:fincabay_application/configs/colors.dart';
import 'package:flutter/material.dart';

import '../../configs/text_styles.dart';

class CitiesAreasScreen extends StatefulWidget {
  const CitiesAreasScreen({Key? key}) : super(key: key);

  @override
  State<CitiesAreasScreen> createState() => _CitiesAreasScreenState();
}

class _CitiesAreasScreenState extends State<CitiesAreasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: barColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: barColor,
          flexibleSpace: Stack(
            children: [
              Image.asset("assets/images/home_header.png", fit: BoxFit.cover,
                  width: double.infinity),

              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 45.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          suffixIcon: Icon(Icons.search_outlined),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
          child:  Center(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 40.0,
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 15.0

                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctx, index) {
                    return  Container(

                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                       //   color: selectedIndex==index?Color(0xFFAED6EB):whiteColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: black12)
                      ),
                      child: Text("DHA",style: pKrStyle,),
                    );
                  }),





    )
  ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: kToolbarHeight *1.5,
        decoration: BoxDecoration(
          // border: Border.all(color: black12,width: 1.0)
        ),
        child: Text("LAHORE",style: TextStyle(fontSize: 91.0,color: Color(0xFFD1E4F0),fontWeight: FontWeight.w500,height: 0.5),),

      ),

    );
  }
}