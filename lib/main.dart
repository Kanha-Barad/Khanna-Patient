import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './PatientHome.dart';
import './ClientCodeLogin.dart';
import 'Cartprovider.dart';
import 'globals.dart' as globals;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  // // Handle the notification permission response
  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   // User granted permission to display notifications
  //   print('Notification permission granted');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   // User granted provisional permission to display notifications (iOS 15+)
  //   print('Provisional notification permission granted');
  // } else {
  //   // User denied permission to display notifications
  //   print('Notification permission denied');
  // }
  // await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  runApp(PatientApp());
}

class PatientApp extends StatefulWidget {
  const PatientApp({Key? key}) : super(key: key);
  @override
  State<PatientApp> createState() => _PatientAppState();
}

class _PatientAppState extends State<PatientApp> {
  @override
  Widget build(BuildContext context) {
    // FirebaseMessaging.instance.getToken().then((value) {
    // //  Device_token_ID = value.toString();
    //   print(value);
    // });
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => CartProvider()), // Your CartProvider
          // Add more providers here if needed
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Color(0xff123456),
          //  primaryColor: Color(0xff123456)
        ),
        home: PatientHome()));
  }
}
