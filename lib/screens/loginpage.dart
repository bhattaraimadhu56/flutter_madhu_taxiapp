import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_taxiapp/screens/MainScreen.dart';
import 'package:madhu_taxiapp/screens/registrationPage.dart';
import 'package:madhu_taxiapp/widgets/ProgressDialog.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  static const String idScreen = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // define the variable here
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  // define the function here
  loginAndAuthenticateUser(BuildContext context) async {
    // show Dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ProgressDialog(dataMessage: " Authenticating, Please Wait!");
        });

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    // create a firebaseUser using FirebaseUser function through the instance of FirebaseAuth
    // textEditingController.text helps to grap the value ented by the users
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((error) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "${error} error occurs");
    }))
        .user;
    //if here is somethig on firebaseUser that means user login successfully
    //But if firebaseUser value is null then user is not login
    // so checking the condition
    if (firebaseUser != null) {
      // user login successfully

// we have created dbref at main.dart sowe can use it anywhere
      var d1 = dbref.child(
          firebaseUser.uid); // creating the user information based on the uid

      d1.once().then((DataSnapshot snapShot) {
        if (snapShot.value != null) {}
      });
      Fluttertoast.showToast(msg: "Login Successfully");
      // After successfully registered redirect to main page
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MyApp();
      }));
    } else {
      //unable to login the user
      //display the error message
      Navigator.pop(context);
      _firebaseAuth.signOut();

      Fluttertoast.showToast(msg: "No record Found, Please create New Account");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // safeView helps to keep contain within safe area i mean no overflow of text in screen
        child: SingleChildScrollView(
          // provides scroll view so that in small screen we can view screen by scrolling
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('images/logo.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sign In as Rider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Madhu-Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailTextEditingController,
                        textInputAction: TextInputAction
                            .next, // Move  focus and cursor to next input or tab
                        keyboardType: TextInputType
                            .emailAddress, // prefer email type from keyboard
                        decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(fontSize: 20.0),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0)),
                        style: TextStyle(
                            fontSize:
                                20), // gives the sizeof whileinputing in device
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordTextEditingController,
                        textInputAction: TextInputAction
                            .next, // Move  focus and cursor to next input or tab

                        obscureText:
                            true, //obscure helps to hide the character while typing password
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 20.0),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0)),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        onPressed: () {
                          // print("clicked");
                          if (!emailTextEditingController.text.contains("@")) {
                            Fluttertoast.showToast(
                                msg: "Email address is not valid");
                          } else if (passwordTextEditingController
                              .text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Password is Mandatory");
                          } else {
                            loginAndAuthenticateUser(context);
                          }
                        },
                        color: Colors.yellowAccent,
                        child: Center(
                          child: Container(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Madhu-Regular'),
                          )),
                        ),
                        // To give rectangular with rounded shape for raised button
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    // print("Flat Button is clicked, Go to Registration Page");
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, RegistrationPage.idScreen, (route) => false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegistrationPage();
                    }));
                  },
                  child: Text('Don\'t have an account, First Register  here'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
