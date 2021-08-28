import 'dart:ffi';

import 'package:Trashit/Methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Trashit/PriceList.dart';
//import 'package:trashit/PriceList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? uid;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void getUserId() async { 
  final User user = await auth.currentUser!; 
  uid = user.uid;
  print("User Id Yeh Hai : "+uid.toString()); }


  @override
  void initState() { 
    getUserId();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(  
       centerTitle:true,
       backgroundColor: Colors.lightGreen,
        title: Text("Home Screen",style: TextStyle(color: Colors.black),),
        actions: [
          GestureDetector(
              onTap:(){
         logOut(context);
          },
           child: Padding(padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.logout_outlined,size: 30,color: Colors.black,
           ),
            ),
            )
        ]//actions
    ), 
    );
  }
}

// ignore: must_be_immutable
/* class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
} */

/*  */