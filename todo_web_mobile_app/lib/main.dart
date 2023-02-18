import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_web_mobile_app/Service/Auth_Service.dart';
import 'package:todo_web_mobile_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_web_mobile_app/pages/HomePage.dart';
import 'package:todo_web_mobile_app/pages/SingInPage.dart';
import 'package:todo_web_mobile_app/pages/SingUpPage.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: Platform.isLinux
    //     ? DefaultFirebaseOptions.web
    //     : DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget currentPage = SingUpPage();
  AuthClass authClass=AuthClass();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chekLogin();
  }
  
  void chekLogin()async{
    String? token = await authClass.getToken();
    if(token!=null){
      setState(() {
        currentPage=HomePage();
      });
    }
  }
  //,jhf,jhsrtjsrtcgkckxfhmdtukjyd



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
