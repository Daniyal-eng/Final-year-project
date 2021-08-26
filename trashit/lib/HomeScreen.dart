import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:Trashit/PriceList.dart';
//import 'package:trashit/PriceList.dart';
class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
     home:HomePage(),
     /*  Scaffold(
     appBar: AppBar(  
     ),
     body: Center(
       child: TextButton(onPressed: ()=>logOut(context), child: Text('logOut'))
     ),
    ), */
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String uid;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void getUserId() async { 
  //final FirebaseUser user = await auth.currentUser(); 
  //uid = user.uid;
  print("User Id : "+uid.toString()); }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
