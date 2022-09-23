import 'package:flutter/material.dart';
import 'package:turksat/pages/user_main.dart';

import 'admin_main.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

/*  Future<String?> _authUser(LoginData data) async {
    dynamic response = await Services().postService(
        {"username": data.name, "password": data.password},
        "http://" +
            ConfigState.serverIP +
            ":" +
            ConfigState.serverPort +
            "/api/v1/auth/token");
    if (response["success"]) {
      Map<String, dynamic> payload =
      Jwt.parseJwt(response["data"]["accessToken"]);
      List<String> roles =
      (payload['roles'] as List).map((item) => item as String).toList();
      if (roles.indexOf("ROLE_GARAGE") > -1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("accessToken", response["data"]["accessToken"]);
        return null;
      } else {
        return "Yetkisiz kullanıcı";
      }
    } else {
      return "Kullanıcı adı veya parola hatalı";
    }
  }*/

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  bool isLoading = false;
  bool isAdmin= true;
  bool isUser= false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    InputDecoration textInputDecoration(String input){
      return InputDecoration(
          hoverColor: Colors.green,
          hintText: input,
          hintStyle: TextStyle(color: Colors.blueGrey ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          )
      );
    }

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.fromLTRB(30, 210, 30, 0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: textInputDecoration("e-mail"),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: textInputDecoration("password"),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 0),
                  child: GestureDetector(onTap: (){},
                    child: Text("Forgot Password??",
                        style: TextStyle(color: Colors.deepOrange), textScaleFactor: 0.9
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding:  EdgeInsets.only(top: 100),
                  child: GestureDetector(onTap: (){
                    if(isAdmin){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>  adminPage() ));
                    }
                    if(isUser){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) =>  userPage() ));
                    };
                  },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(gradient: LinearGradient(
                          colors: [
                            Colors.green,
                            Colors.lightGreenAccent
                          ]
                      ),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign In",style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?",style: TextStyle(color: Colors.deepOrange ),textScaleFactor: 0.9, ),
                    GestureDetector(onTap: (){},
                        child: Text(" Register now",style: TextStyle(color: Colors.deepOrange ,decoration: TextDecoration.underline ),textScaleFactor: 0.9, )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
