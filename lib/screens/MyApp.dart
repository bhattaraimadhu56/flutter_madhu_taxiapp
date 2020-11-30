import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  static const String idScreen = "myAppMainScreen";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Madhu Taxi App "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                height: 50,
                minWidth: 300,
                color: Colors.teal,
                child: Text("Material Button connect to db"),
                onPressed: () {
                  // DatabaseReference dbref =
                  //     FirebaseDatabase.instance.reference().child("users");

                  // dbref.set("Madhu  Database Connected Successfully");
                },
              ),
              RaisedButton(
                onPressed: () {
                  // DatabaseReference dbref =
                  //     FirebaseDatabase.instance.reference().child("path");

                  // dbref.set("Hi Madhu,  Database Connected Successfully");
                },
                child: Text("Raised Button"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
