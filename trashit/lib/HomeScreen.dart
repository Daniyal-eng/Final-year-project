
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trashit/Methods.dart';
import 'package:trashit/AdsScreen.dart';
import 'package:trashit/OrderScreen.dart';
import 'package:trashit/PriceList.dart';
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
    //_tabController = TabController(vsync: this, length: myTabs.length);
  }
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
         
         //Appbar code
         
           body:
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(  
                    width: 800,
                    height: 200,
                          child: Card( 
                            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.lightGreen,
                            child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[             
                           const ListTile(
                            leading: Icon(Icons.list_alt_rounded, size: 50),
                            title: Text('Price List', style: TextStyle(color: Colors.white)),
                            subtitle: Text('Here you can see rates', style: TextStyle(color: Colors.white)),
                          ),
                        
              
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('View', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (_) => ProductList()));                     
                                },
                              ),
              /*                 FlatButton(
                                child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                onPressed: () {}, */
                            //  ),
                            ],
                          ),
                        ),
                        
                    ]
                            ),
                          ),
                      ),
                      SizedBox(height: 10,),
Container(  
                    width: 800,
                      height: 200,
                          child: Card( 
                            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.lightGreen,
                            child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[             
                           const ListTile(
                            leading: Icon(Icons.shop,size: 50),
                            title: Text('Order', style: TextStyle(color: Colors.white)),
                            subtitle: Text('Here you can place your order', style: TextStyle(color: Colors.white)),
                          ),
                        
              
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Open', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (_) => OrderScr()));                     
                                },
                              ),
              /*                 FlatButton(
                                child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                onPressed: () {}, */
                            //  ),
                            ],
                          ),
                        ),
                        
                    ]
                            ),
                          ),
                      ),
                      SizedBox(height: 10,),
                  Container(  
                    width: 800,
                      height: 200,
                          child: Card( 
                            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.lightGreen,
                            child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[             
                           const ListTile(
                            leading: Icon(Icons.tv, size: 50),
                            title: Text('Post Ads ', style: TextStyle(color: Colors.white)),
                            subtitle: Text('Here you can post your Ad', style: TextStyle(color: Colors.white)),
                          ),
                        
              
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Open', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (_) => AdsScreen()));                     
                                },
                              ),
              /*                 FlatButton(
                                child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                onPressed: () {}, */
                            //  ),
                            ],
                          ),
                        ),
                        
                    ]
                            ),
                          ),
                      ),
                      SizedBox(height: 10,),
                  ],
                ),
              ),    
      );
  }
}
