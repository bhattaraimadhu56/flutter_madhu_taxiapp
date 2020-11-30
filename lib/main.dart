import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:madhu_taxiapp/screens/MyApp.dart';
import './screens/registrationPage.dart';
import './screens/loginpage.dart';

//creating database reference in the main.dart filemeans you can use it from anywhere in the application
DatabaseReference dbref = FirebaseDatabase.instance.reference().child("users");

// All setup as per our project as per google-services.json which was download from firebase and stored at android/app folder
//           appId: '1:175787402228:android:13c82cfde2e319d9a98fa1',
//           apiKey: 'AIzaSyBd5-THNfZ_KPCv7kmd-tuukiCgfaeFSHE',
//           projectId: 'taxiapp-ce5fe',
//           databaseURL: 'https://taxiapp-ce5fe.firebaseio.com',

// runApp(MyApp());
// our run Method is here
void main() async {
  // Initialize the Firebase app here
  // without initializing firebase will not work
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Madhu Taxi App",
    // home: LoginPage(),
    // home: RegistrationPage(),

    // set initialRoute to login Page
    initialRoute: LoginPage.idScreen,
    routes: {
      // Ways to define ()=> is equivalent to (){}
      RegistrationPage.idScreen: (context) => RegistrationPage(),
      LoginPage.idScreen: (context) => LoginPage(),
      MyApp.idScreen: (context) => MyApp(),
    },
    theme: ThemeData(
        // backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        fontFamily: 'Madhu-Bold'),
    debugShowCheckedModeBanner: false,
  ));
}
