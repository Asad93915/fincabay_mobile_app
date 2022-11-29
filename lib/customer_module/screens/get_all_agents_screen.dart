import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/customer_module/cusomer_drawer_screen.dart';
import 'package:fincabay_application/customer_module/services/agents_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:flutter/material.dart';

import '../../configs/text_styles.dart';

class GetAllAgentsScreen extends StatefulWidget {
  const GetAllAgentsScreen({Key? key}) : super(key: key);

  @override
  State<GetAllAgentsScreen> createState() => _GetAllAgentsScreenState();
}

class _GetAllAgentsScreenState extends State<GetAllAgentsScreen> {
  _getAllAgentsHandler()async{
    CustomLoader.showLoader(context: context);
    await GetAllAgentsService().getAgents(context: context);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getAllAgentsHandler();

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: barColor,
        elevation: 0.0,
        leading: Builder(
          builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
            setState((){});
          }, icon: Icon(Icons.menu,color: blackColor,)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Agents",style: profileStyle,),
            ],
          ),
        ),
      ),
    );
  }
}
