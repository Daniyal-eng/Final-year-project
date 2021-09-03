import 'package:flutter/material.dart';
import 'package:trashit/Ads.dart';
import 'package:trashit/Methods.dart';
import 'package:trashit/Orders.dart';
import 'package:trashit/Users.dart';

class AdminScr extends StatefulWidget {
  const AdminScr({ Key? key }) : super(key: key);

  @override
  _AdminScrState createState() => _AdminScrState();
}

class _AdminScrState extends State<AdminScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                     appBar: AppBar(
       centerTitle:true,
       backgroundColor: Colors.lightGreen,
        title: Text("Admin Screen",style: TextStyle(color: Colors.black),),
        actions: [
          GestureDetector(
              onTap:(){
         AddminlogOut(context);
          },
           child: Padding(padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.logout_outlined,size: 30,color: Colors.black,
           ),
            ),
            )
        ]//actions
    ), 

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
                            title: Text('Users List', style: TextStyle(color: Colors.white)),
                            subtitle: Text('Here you can see users list', style: TextStyle(color: Colors.white)),
                          ),
                        
              
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('View', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (_) =>userdata()));                     
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
                            title: Text('Orders list', style: TextStyle(color: Colors.white)),
                            subtitle: Text('Here you see orders placed', style: TextStyle(color: Colors.white)),
                          ),
                        
              
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('View', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (_) => OrdsLst()));                     
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
                            title: Text('Ads list ', style: TextStyle(color: Colors.white)),
                            subtitle: Text('Here you can see Ads posted', style: TextStyle(color: Colors.white)),
                          ),
                        
              
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('View', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (_) => AdsLst()));                     
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