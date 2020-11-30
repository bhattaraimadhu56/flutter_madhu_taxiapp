import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
                          print("clicked");
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
                    print("Flat Button is clicked, Go to Registration Page");
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
}
