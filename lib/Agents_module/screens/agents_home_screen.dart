import 'package:fincabay_application/Agents_module/screens/agents_drawer_screen.dart';
import 'package:fincabay_application/configs/text_styles.dart';
import 'package:flutter/material.dart';

class AgentHomeScreen extends StatefulWidget {
  const AgentHomeScreen({Key? key}) : super(key: key);

  @override
  State<AgentHomeScreen> createState() => _AgentHomeScreenState();
}

class _AgentHomeScreenState extends State<AgentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AgentsDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu));
        },),
        title: Text("Agent Home Screen"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("In Progress",style: titleStyle,textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
