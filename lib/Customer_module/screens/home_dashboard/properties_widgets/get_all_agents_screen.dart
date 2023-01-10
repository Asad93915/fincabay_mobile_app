import 'package:fincabay_application/configs/colors.dart';
import 'package:fincabay_application/Customer_module/cusomer_drawer_screen.dart';
import 'package:fincabay_application/Customer_module/providers/agents_list_provider.dart';
import 'package:fincabay_application/Customer_module/services/agents_service.dart';
import 'package:fincabay_application/helper_services/custom_loader.dart';
import 'package:fincabay_application/helper_services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Agents_module/screens/get_agent_properties_screen.dart';
import '../../../../configs/text_styles.dart';
import '../../../../utils/Functions.dart';
import '../../../models/get_all_agents_model.dart';

class GetAllAgentsScreen extends StatefulWidget {
  const GetAllAgentsScreen({Key? key}) : super(key: key);

  @override
  State<GetAllAgentsScreen> createState() => _GetAllAgentsScreenState();
}

class _GetAllAgentsScreenState extends State<GetAllAgentsScreen> {

 late GetAllAgentsService agentsService;

  _getAllAgentsHandler()async{
    CustomLoader.showLoader(context: context);
    await agentsService.getInitAgents(context: context);
    agentCont.addListener(()async {
      if(agentCont.position.maxScrollExtent==agentCont.offset){
       agentsService.pageNumber=agentsService.pageNumber+1;
       CustomLoader.showLoader(context: context);
       await agentsService.getMoreAgents(context: context);
       CustomLoader.hideLoader(context);
       setState(() {

       });
      }
    });
    setState(() {

    });
    CustomLoader.hideLoader(context);

  }
  final ScrollController agentCont=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    agentsService=GetAllAgentsService();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      agentsService=Provider.of<GetAllAgentsService>(context,listen: false);
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
        title: Text("Real Estate Agents",style: titleStyle,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
          child:
          // Consumer<AgentsListProvider>(builder: (context,agent,_){
          //   return
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  ListView.builder(
                    shrinkWrap: true,
                    controller: agentCont,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount:agentsService.agentsList!.length,

                    itemBuilder: (BuildContext,index){
                  return AgentsListWidget(
                      agentsList:agentsService.agentsList![index]

                  );
            }),
                ],
              ),
      ),
    ));

  }
}

class AgentsListWidget extends StatefulWidget {
  AgentsList agentsList;
   AgentsListWidget({required this.agentsList});

  @override
  State<AgentsListWidget> createState() => _AgentsListWidgetState();
}

class _AgentsListWidgetState extends State<AgentsListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        String email=await getUserEmail();

        NavigationServices.goNextAndKeepHistory(context: context, widget: ManageAgentPropertiesScreen(
          showDrarwer: false,
          agentEmail:widget.agentsList.userEmail??"" ,));
        setState((){});
      },
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),

        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Agency Name:",style: contactStyle,),
              Text("${widget.agentsList.agencyName}"),
              Text("Email:",style: contactStyle,),
              Text("${widget.agentsList.userEmail}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Agent City:",style: contactStyle,),flex: 2,),
                  Expanded(child: Text("Agent Phone:",style: contactStyle,),flex: 1,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("${widget.agentsList.dealCity}"),flex: 2,),
                  Expanded(child: Text("${widget.agentsList.dealMobileNumber}"),flex: 1,)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

