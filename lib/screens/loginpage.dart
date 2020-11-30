import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    print("Flat Button is clicked, Go to Registration Page");
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
