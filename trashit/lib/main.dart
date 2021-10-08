import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trashit/CreateAccount.dart';
import 'package:trashit/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:trashit/login.dart';
import 'package:flutter/widgets.dart';
import 'Admin/AdminScreen2.dart';


Future main() async {
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
       home:SplashScreen(),

    );
  }
}
 class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = 'user';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkRole();
    // Timer(Duration(seconds:3 ), () {
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    // });
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();

    setState(() {
      role = snap['role'];
    });

    if(role == 'user'|| role=='User'){
      navigateNext(HomeScreen());
    } else if(role == 'admin'|| role =='Admin'){
      navigateNext(AdminScr());
    }
  }
  void navigateNext(Widget route) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:
     Colors.white
     //(0xd3f5ce)
     ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myContainerWidget(
              "assets/logo.png"
            ),
          ]
        ),
      ),
    );
  }
}
Widget myContainerWidget(String img){
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Center(
      child: Container(
       // margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          //border: Border.all(width: 2 , color: Colors.black),       
        ),
        height: 400,
        width: 300,
        child:
              Container(
                decoration: BoxDecoration(
                 // border: Border.all(width: 2 , color: Colors.black),
                   // borderRadius: BorderRadius.all(Radius.elliptical(2, 5)),
                  image: DecorationImage(
                    //fit:BoxFit.fitHeight,
                    image: AssetImage(img)
                  )
                ),
                height: 400,
                width: 250,
              ),
      ),
    ),
  );
}