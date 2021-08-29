
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

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Prices'),
    Tab(text: 'CARDS'),
  ];
       late TabController _tabController;
  @override
  void initState() {
        getUserId();
    super.initState();
    //_tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
   void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
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
        body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}