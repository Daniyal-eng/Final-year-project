import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:trashit/login.dart';

import 'Admin/AdminLog.dart';


Future<User?> createAccount(String name, String email ,String password,String role) async{

    FirebaseAuth _auth = FirebaseAuth.instance;


  try{
          User? user = (await _auth.createUserWithEmailAndPassword(email: email, password:password)).user;

           if (user != null) {
      print("Account created Successfully");

      return user;
           }
           else {
      print("Account creation failed");
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}
Future<String?>Signup(String name,String email,String password,String role)async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value)async{
      User? user =FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
        'uid': user.uid,
        'email': email,
        'password': password,
        'role': role
      });
    });
    return "Signup";
    }
    catch(e){
    return 'Sighup Failed...';
  }
}

  Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

try{
   User? user = (await _auth.signInWithEmailAndPassword(
     email: email, password: password))
     .user;

if(user!=null)
{
print("Login Successful");
return user;

}
else{
   print("Login failed");
   return user;

}
}catch(e){

 print(e);
  return null;
}
  }

  Future<User?> logOut(BuildContext context) async {

  FirebaseAuth _auth = FirebaseAuth.instance;
      try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}

  Future<String?> AdminlogIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

try{
   User? admin = (await _auth.signInWithEmailAndPassword(
     email: email, password: password))
     .user;

if(admin!=null)
{
print("Login Successfully");


}
else{
   print("Login failed");

}
}catch(e){

 print(e);
  return null;
}
  }

 Future<String?> AddminlogOut(BuildContext context) async {

  FirebaseAuth _auth = FirebaseAuth.instance;
      try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => AadminScreen()));
    });
  } catch (e) {
    print("error");
  }
}
