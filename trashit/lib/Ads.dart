import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdsLst extends StatelessWidget {
  const AdsLst({ Key? key }) : super(key: key);

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
                          Text('-----------------------------------------'),
                        ],
                      );
                      }
                      );
                  }
          }
              
              ) ,
         
     
    );
  
  }
}