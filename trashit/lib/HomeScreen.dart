import 'package:Trashit/Methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Trashit/PriceList.dart';
//import 'package:trashit/PriceList.dart';
class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
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
    )
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
  final User user = await auth.currentUser!; 
  uid = user.uid;
  print("User Id : "+uid.toString()); }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
