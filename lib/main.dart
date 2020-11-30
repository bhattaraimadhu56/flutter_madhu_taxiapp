import 'package:flutter/material.dart';
import './screens/loginpage.dart';

// Paste the firebase database code here
// import './screens/MyApp.dart';
// import 'dart:async';
// import 'dart:io' show Platform;
//import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
// WidgetsFlutterBinding.ensureInitialized();
// final FirebaseApp app = await Firebase.initializeApp(
//   name: 'db2',
//   options: Platform.isIOS || Platform.isMacOS
//       ? FirebaseOptions(
//           appId: '1:297855924061:ios:c6de2b69b03a5be8',
//           apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
//           projectId: 'flutter-firebase-plugins',
//           messagingSenderId: '297855924061',
//           databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
//         )
//       : FirebaseOptions(
//           //All setup as per our project as per google-services.json which was download from firebase and stored at android/app folder
//           appId: '1:175787402228:android:13c82cfde2e319d9a98fa1',
//           apiKey: 'AIzaSyBd5-THNfZ_KPCv7kmd-tuukiCgfaeFSHE',
//           // messagingSenderId: '297855924061',
//           projectId: 'taxiapp-ce5fe',
//           databaseURL: 'https://taxiapp-ce5fe.firebaseio.com',
//         ),
// );
// //End of copy paste code from the firebase database
// runApp(MyApp());
// our run Method is here
void main() {
  runApp(MaterialApp(
    title: "Madhu Taxi App",
    home: LoginPage(),
    theme: ThemeData(
        // backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        fontFamily: 'Madhu-Bold'),
    debugShowCheckedModeBanner: false,
  ));
}
