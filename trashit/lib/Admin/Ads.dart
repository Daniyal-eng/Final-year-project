import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AdsLst extends StatefulWidget {
   
  const AdsLst({ Key? key }) : super(key: key);
  @override
  _AdsLstState createState() => _AdsLstState();
}

class _AdsLstState extends State<AdsLst> {
   TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
   TextEditingController _address = TextEditingController();   
  TextEditingController _wasteAmnt = TextEditingController();
  TextEditingController _wastetype = TextEditingController();
 TextEditingController _descrip = TextEditingController();
  
  
  



  
createData(String id,String userName , String userPhone , String userAddress,String wasteAmount,String wasteType,String descrip,) async {
  var Id = generateRandomString(20);
    DocumentReference documentReference = FirebaseFirestore.instance.collection('Complete').doc(Id);
    Map<String , dynamic> compl = {
    
    "name": userName,
    "phone number": userPhone,
    "address":userAddress,
    "Amount of waste": wasteAmount,
    "Waste category":wasteType,
    "Additional text":descrip,
      "id":Id,
     };
    print("Ad pora hogaya gya");

    documentReference.set(compl).whenComplete(() async {

        DocumentReference documentReference2 = await FirebaseFirestore.instance.collection('Ads').doc(id);
         documentReference2.delete();
       print("$compl placed");
        }); 
        }
  
  String? uid;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void getUserId() async { 
  final User user = await auth.currentUser!; 
  uid = user.uid;
  print("Admin/vendor Id Yeh Hai : "+uid.toString()); }

   String generateRandomString(int len) {
     var r = Random();
     const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
     return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
   }

  @override
  void initState() { 
    getUserId();
    super.initState();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text('Ads',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
            body: StreamBuilder(
               stream: FirebaseFirestore.instance.collection('Ads').snapshots(),
              
              builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder:(context,int index){
                      return Column(
                        
                        children: [
                          Row(
                            children: [
                              
                            Text('Description:'),
                              Text(snapshot.data!.docs[index]['Additional text']),
                             
                            ],
                            
                          ),
                          Row(
                            children: [
                               Text('Waste Amount:'),
                              Text(snapshot.data!.docs[index]['Amount of waste']),
                            ],
                          ),
                          Row(
                            children: [
                               Text('Waste Category:'),
                              Text(snapshot.data!.docs[index]['Waste category']),
                            ],
                          ),
                          Row(
                            children: [
                               Text('user address:'),
                              Text(snapshot.data!.docs[index]['address']),
                            ],
                          ),
                          Row(
                            children: [
                               Text('user name:'),
                              Text(snapshot.data!.docs[index]['name']),
                              
                            ],
                          ),
                          Row(
                            children: [
                               Text('user phone:'),
                              Text(snapshot.data!.docs[index]['phone number']),
                            ],
                          ),
                          Text('-------------------------------------------'),
                           Container(
                            child:new RaisedButton(onPressed: (){
                               showDialog(context: context, builder: (contxt)
                {
                       return AlertDialog(
                         shape:RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                         ),
                        title:Text('Ad Successfull'),
                        content: Text('Ad has been completed'),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.of(contxt).pop();
                          }, child: Text('Cancel')),
                           FlatButton(onPressed: (){
                                     
                            Navigator.of(contxt).pop();
                            createData((snapshot.data!.docs[index]['id']),(snapshot.data!.docs[index]['name']),snapshot.data!.docs[index]['phone number'],snapshot.data!.docs[index]['address'],snapshot.data!.docs[index]['Amount of waste'],snapshot.data!.docs[index]['Waste category'],snapshot.data!.docs[index]['Additional text'],);
                                      
                            //  DeleteData();                         
                          }, child: Text('OK'))              
                        ],                       
                       );
                }          
                                 );  
                            },child: const Text('Mark as complete')),
                          ), 
                        ]
                          ); 

                      }
                      );
                  }
          }           ) ,
          
    );
  
  }
}