import 'package:donna/screens/signupPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donna/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    // return Scaffold(
    //   body: ListView(
    //       padding: EdgeInsets.symmetric(horizontal: 32),
    //       physics: BouncingScrollPhysics(),
    //       children: [
    //         const SizedBox(height: 24),
    //         TextField(
    //           controller: emailController,
    //           decoration: InputDecoration(
    //               labelText: 'EMAIL',
    //               labelStyle: TextStyle(
    //                   fontFamily: 'Montserrat',
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.grey),
    //               // hintText: 'EMAIL',
    //               // hintStyle: ,
    //               focusedBorder: UnderlineInputBorder(
    //                   borderSide: BorderSide(color: Colors.green))),
    //         ),
    //         const SizedBox(height: 24),
    //         TextField(
    //           controller: passwordController,
    //           decoration: InputDecoration(
    //               labelText: 'PASSWORD ',
    //               labelStyle: TextStyle(
    //                   fontFamily: 'Montserrat',
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.grey),
    //               focusedBorder: UnderlineInputBorder(
    //                   borderSide: BorderSide(color: Colors.green))),
    //           obscureText: true,
    //         ),
    //         const SizedBox(height: 48),
    //         ElevatedButton(
    //             onPressed: () async {
    //               dynamic res = await _auth.login(
    //                   emailController.text, passwordController.text);
    //               Navigator.pop(context);
    //             },
    //             child: Text("login")),
    //         const SizedBox(height: 12),
    //         TextButton(
    //             onPressed: () {
    //               Navigator.push(
    //                   context, MaterialPageRoute(builder: (_) => SignupPage()));
    //             },
    //             child: Text("create an account"))
    //       ]),
    // );

    return new Scaffold(
        body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 120.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'CONFIRM PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 50.0),
                    ElevatedButton(
                        onPressed: () async {
                          dynamic result = await _auth.register(
                              emailController.text, passwordController.text);
                          print(emailController.text);
                          print(passwordController.text);
                        },
                        child: Text("Login")),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignupPage()));
                        },
                        child: Text("create an account")),
                    // Container(
                    //     height: 40.0,
                    //     child: Material(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       shadowColor: Colors.greenAccent,
                    //       color: Colors.green,
                    //       elevation: 7.0,
                    //       child: GestureDetector(
                    //         onTap: () {},
                    //         child: Center(
                    //           child: Text(
                    //             'SIGNUP',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontFamily: 'Montserrat'),
                    //           ),
                    //         ),
                    //       ),
                    //     )),
                    SizedBox(height: 20.0),
                  ],
                )),
            // SizedBox(height: 15.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       'New to Spotify?',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //       ),
            //     ),
            //     SizedBox(width: 5.0),
            //     InkWell(
            //       child: Text('Register',
            //           style: TextStyle(
            //               color: Colors.green,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.bold,
            //               decoration: TextDecoration.underline)),
            //     )
            //   ],
            // )
          ]),
    ));
  }
}
