import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_taxiapp/screens/loginpage.dart';

import '../main.dart';

class RegistrationPage extends StatefulWidget {
  static const String idScreen = "register";
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // define the variable here
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
                  height: 30.0,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('images/logo.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Register as Rider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Madhu-Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType
                            .name, // prefer email type from keyboard
                        decoration: InputDecoration(
                            labelText: 'Name',
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
                        controller: addressTextEditingController,
                        keyboardType: TextInputType
                            .text, // prefer email type from keyboard
                        decoration: InputDecoration(
                            labelText: 'Address',
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
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType
                            .phone, // prefer email type from keyboard
                        decoration: InputDecoration(
                            labelText: "Phone",
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
                        controller: emailTextEditingController,
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
                        obscureText:
                            true, //obscure helps to hide the character while typing password
                        keyboardType: TextInputType.text,
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
                          // lets create a function and define it
                          //calling the function
                          if (nameTextEditingController.text.length < 4) {
                            Fluttertoast.showToast(
                                msg: "Name must be atleast 3 characters");
                          } else if (addressTextEditingController.text.length <
                              9) {
                            Fluttertoast.showToast(
                                msg: "Address must be at least 8 characters");
                          } else if (phoneTextEditingController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Phone number is mandatory");
                          } else if (!emailTextEditingController.text
                              .contains("@")) {
                            Fluttertoast.showToast(
                                msg: "Email address is not valid");
                          } else if (passwordTextEditingController.text.length <
                              7) {
                            Fluttertoast.showToast(
                                msg: "Password be at least 6 characters");
                          } else {
                            registerNewUser(context);
                          }
                        },

                        color: Colors.yellowAccent,
                        child: Center(
                          child: Container(
                              child: Text(
                            "Register",
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginPage.idScreen, (route) => false);
                  },
                  child: Text('Already have an account, Login Now'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  registerNewUser(BuildContext context) async {
    // creating the instance of firebase auth
    // _(underscore)==>represent private variable
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    // create a firebaseUser using FirebaseUser function through the instance of FirebaseAuth
    // textEditingController.text helps to grap the value ented by the users
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((error) {
      Fluttertoast.showToast(msg: "${error} error occurs");
    }))
        .user;

    //if here is somethig on firebaseUser that means user created successfully
    //But if firebaseUser value is null then user is not created
    // so checking the condsition
    if (firebaseUser != null) {
      // user created successfully
      //so save user to firbase database
      //before saving data to database need to do validation of userput data
// we have created dbref at main.dart sowe can use it anywhere
      var d1 = dbref.child(
          firebaseUser.uid); // creatting the user information based on the uid
      //creating a variable userDataMap using Map
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "address": addressTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "password": passwordTextEditingController.text.trim(),
      };
      d1.set(userDataMap);
      Fluttertoast.showToast(
          msg: "Congratulation ! Your account has been created successfully");
    } else {
      //unable to create the user
      //display the error message
      Fluttertoast.showToast(msg: "Unable to register the user");
    }
  }
}
