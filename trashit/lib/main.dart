import 'package:Trashit/OrderScreen.dart';
import 'package:Trashit/PriceList.dart';
import 'package:Trashit/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Trashit/OrderScreen.dart';
//import 'package:Trashit/PriceList.dart';/import 'package:Trashit/login.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: LoginScreen(),
    );
  }
}