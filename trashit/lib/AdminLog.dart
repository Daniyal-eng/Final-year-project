import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trashit/AdminLog.dart';
import 'package:trashit/AdminScreen2.dart';
import 'package:trashit/Authenticate.dart';
import 'package:trashit/login.dart';
import 'Methods.dart';

class AadminScreen extends StatefulWidget {
  const AadminScreen({ Key? key }) : super(key: key);

  @override
  _AadminScreenState createState() => _AadminScreenState();
}

class _AadminScreenState extends State<AadminScreen> {
  late final TextEditingController _email2 = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  String AdNam='daniyaladmin@gmail.com';
  String AdPass='daniyaladmin';

  

FirebaseAuth auth = FirebaseAuth.instance;
createData(String email , String pass) async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('Admins').doc(aid);
    Map<String , dynamic> Admins = {
    
    "email": email,
    "password": pass,
    };
    print("Admin ka Data Saved Hogya Mera");
    documentReference.set(Admins).whenComplete(() {
       print("$Admins Created");
        }); 
        }
        String ?aid;
 void getAdminId() async { 
  final User user = await auth.currentUser!; 
  aid = user.uid;
  print("User Id Yeh Hai : "+aid.toString()); }

       
  @override
  void initState() {
        getAdminId();
    super.initState();
    
  }

  bool isLoading = false;
  bool _isObscure = true;
  
  @override
  Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height:100,  
                      ),            
                      ) , 
                  
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Welcome to Admin Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Sign In to Contiue!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height /10,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "admin@gmail.com", Icons.account_box, _email2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                        child: passfield(size, "password", Icons.lock, _password2),
                    ),
                  ),
                   SizedBox(
                    height: size.height / 25,
                  ),
                   
                  customButton(size),
                  SizedBox(
                    height: size.height / 30,
                  ),
             
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => LoginScreen())),
                    child: Text(
                      " back",
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ) 
                ],
              ),
            ),
    );
  }

   
   Widget customButton(Size size){
    return GestureDetector(
       onTap: (
       ){
          if (_email2.text.isNotEmpty && _password2.text.isNotEmpty) {
         setState(() {
            isLoading = true;
          }); 
            
           if( _email2.text == AdNam && _password2.text==AdPass ){
             Navigator.push(
                   context, MaterialPageRoute(builder: (_) => AdminScr()));  
                       print("Admin Login Sucessfull");
           } //2nd if 
                   else{
                     print("Login Failed");
                     setState(() {
                isLoading = false;
              });
                     showDialog(context: context, builder: (contxt){

                       return AlertDialog(
                           shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                       ),
                      title:Text('Error'),
                      content: Text('Wrong email or password'),
                      actions: [
                         FlatButton(onPressed: (){
                          Navigator.of(contxt).pop();
                        }, child: Text('Cancel')),
                         FlatButton(onPressed: (){
                        _email2.text='';
                        _password2.text='';
                          Navigator.of(contxt).pop();
                        }, child: Text('OK'))
                      ],
                       );
                     }); // ShowDialog
                   }
                  
           }    
            
            else {
          print("Please enter all Fields");
          showDialog(context: context, builder: (contxt)
              {
                     return AlertDialog(
                       shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(25)
                       ),
                      title:Text('Error'),
                      content: Text('Please fill all the fields'),
                      actions: [
                        FlatButton(onPressed: (){
                          Navigator.of(contxt).pop();
                        }, child: Text('Cancel')),
                         FlatButton(onPressed: (){
                        _email2.text='';
                        _password2.text='';
                          Navigator.of(contxt).pop();
                        }, child: Text('OK'))
                      ],
                     );
              });
          //Text('Please filled all the fields');
        }





       },child:Container(
          height: size.height / 14,
          width: size.width / 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightGreen,
          )  ,
          alignment: Alignment.center,
          child: Text(
            "Admin Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
              
    );
     
             
   }
   













/* 
  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email2.text.isNotEmpty && _password2.text.isNotEmpty) {
         setState(() {
            isLoading = true;
          }); 
              
           if( _email2.text == AdNam && _password2.text==AdPass ) {
            if (user != null) {
              print("Login Sucessfull");
              Text('You are signed in');
               setState(() {
                isLoading = false;
               
              }); 
              createData( _email2.text , _password2.text,);
               Navigator.push(
                   context, MaterialPageRoute(builder: (_) => AdminScr()));
            } else {
              print("Login Failed");
              showDialog(context: context, builder: (contxt)
              {
                     return AlertDialog(
                       shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                       ),
                      title:Text('Error'),
                      content: Text('Please provide valid email & password'),
                      actions: [
                        FlatButton(onPressed: (){
                          Navigator.of(contxt).pop();
                        }, child: Text('Cancel')),
                         FlatButton(onPressed: (){
                        _email2.text='';
                        _password2.text='';
                          Navigator.of(contxt).pop();
                        }, child: Text('OK'))
                      ],
                     );
              }
              );
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please fill form correctly");
          showDialog(context: context, builder: (contxt)
              {
                     return AlertDialog(
                       shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                       ),
                      title:Text('Error'),
                      content: Text('Please provide email & password'),
                      actions: [
                        FlatButton(onPressed: (){
                          Navigator.of(contxt).pop();
                        }, child: Text('Cancel')),
                         FlatButton(onPressed: (){
                        _email2.text='';
                        _password2.text='';
                          Navigator.of(contxt).pop();
                        }, child: Text('OK'))
                      ],
                     );
              }
              );
        } 
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightGreen,
          ),
          alignment: Alignment.center,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
 */




 Widget passfield(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,       
        obscureText: _isObscure,
        obscuringCharacter: '.',
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
            icon: Icon(_isObscure ?Icons.visibility : Icons.visibility_off),
            onPressed: (){
              setState(() {
                _isObscure =!_isObscure;
              });
            },
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }




   Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
}

}
