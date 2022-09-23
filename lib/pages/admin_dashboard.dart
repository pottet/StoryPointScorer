import 'package:flutter/material.dart';
import 'package:turksat/pages/user_main.dart';

class dashBoard extends StatefulWidget {
  const dashBoard({Key? key}) : super(key: key);

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  String username = "Dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: GestureDetector(onTap: () {

          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>  userPage()
          ));
        },
            child: Text(username)),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            _buildDashboard(),
            SizedBox(height: 10,),
            _buildDashboard(),
            SizedBox(height: 10,),
            _buildDashboard()
          ],
        ),
      ) ,
    );
  }
  Widget _buildDashboard()
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                blurStyle: BlurStyle.inner,
                offset: Offset(3, 5), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Row(
          children: [
            Container(
              child: Text("Task Name", style: TextStyle(
                fontSize: 16,
              ),
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              decoration: BoxDecoration(),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.025,
              color: Colors.black54,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.63,
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
