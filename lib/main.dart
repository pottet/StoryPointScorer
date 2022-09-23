import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:turksat/pages/admin_main.dart';
import 'package:turksat/pages/login.dart';

void main() async{
  final dbConnetion =PostgreSQLConnection(
      "10.0.2.2", /// avd de localhostun yerini 10.0.2.2
      5432,
      "new",
      username: "postgres",
      password: "268595");
  await dbConnetion.open();

  print("Postgre db connected");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turksat Proje',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginPage(),
      //adminPage(),

        debugShowCheckedModeBanner: false,
    );
  }
}


