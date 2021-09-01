import 'package:Trashit/AdsScreen.dart';
import 'package:Trashit/Authenticate.dart';
import 'package:Trashit/HomeScreen.dart';
import 'package:Trashit/OrderScreen.dart';
import 'package:Trashit/PriceList.dart';
import 'package:Trashit/choice.dart';
import 'package:Trashit/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';


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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3 ), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
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
            // logo here
             /* Image.asset(
              'assets/dust.png',
               height: 120,
            ), */
            myContainerWidget(
              "assets/logo.png"
            ),
                Container(
              
            // child:
             //Text("TrashIt", style:TextStyle(fontSize: 30
            // ,fontWeight: FontWeight.bold,color: Colors.black
             //),)
             
             ), 

            
          //  child:CircularProgressIndicator(
            //  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
           // )
                ]
        ),
      ),
    );
  }
} 

 /* 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.timed(
        seconds: 3,
        route: MaterialPageRoute(builder: (_) => Home()),
        body: Scaffold(
          body: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://bit.ly/3hD5Tj8'),
                ),
              ),
            ),
          ),
        ),
      ),
         


);
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen!"),
      ),
      body: Center(
        child: Text(
          "Welcome!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
      ),
    );
  }
} */
 
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
            
            /* Container(
              height: 130,
              width: 200,
              child: Column(
                children: [
                  SizedBox(height: 18,),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Text(title,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900),)),
                  //SizedBox(height: 0.2,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: [
                     // Icon(Icons.star,color: Colors.yellow,),
                      //Text(Category,style: TextStyle(color: Colors.grey),),
                    ],),
                  ),
                //s  SizedBox(height: 5 ,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(children: [
                    Text("$pieces Rate:",style: TextStyle(color: Colors.grey),),
                    //SizedBox(width: 5,),
                    Text(price,style: TextStyle(color: Colors.lightGreen),),
                  ],),
                ),
                 // SizedBox(height: 5 ,),
                 // Align(
                 //     alignment: Alignment.topLeft,
                  //    child: Text("Quantity $quantity",style: TextStyle(color: Colors.grey,)),
                 // )
                ],
              ),
            ), */
          
        
      ),
    ),
  );
}