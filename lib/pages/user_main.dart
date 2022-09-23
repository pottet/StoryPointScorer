import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class userPage extends StatefulWidget {
  const userPage({Key? key}) : super(key: key);

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  String username = "User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: GestureDetector(onTap: () {
          fromApi();
        },
            child: Text(username)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10,),
              _buildTask(),
              SizedBox(height: 10,),
              _buildTask(),
              SizedBox(height: 10,),
              _buildTask()
            ],
          ),
        ),
      ) ,
    );
  }

  Widget _buildTask()
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print("object");
        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.16,
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
              color: Colors.orange[100],
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text("Task Name", style: TextStyle(
                  fontSize: 16,
                ),
                  textAlign: TextAlign.center,
                ),
                width: MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.005,
                width: MediaQuery.of(context).size.width*0.8,
                color: Colors.black54,
              ),
              SizedBox(width: 5,),
              Container(
                child: DropdownSearch<int>.multiSelection(
                  items: [1, 2, 5, 13],
                ),
                width: MediaQuery.of(context).size.width*0.7,
                //color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void fromApi() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =
  Uri.https('http://localhost:8082', '/api/user', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['name'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}