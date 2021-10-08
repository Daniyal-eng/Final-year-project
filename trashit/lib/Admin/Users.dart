import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class userdata extends StatelessWidget {
  const userdata({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text('Users',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
            body: StreamBuilder(
               stream: FirebaseFirestore.instance.collection('users').snapshots(),
              
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
                            Text('user email:'),
                              Text(snapshot.data!.docs[index]['email']),
                             
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
                               Text('user paasword:'),
                              Text(snapshot.data!.docs[index]['password']),
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