import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Trashit/HomeScreen.dart';
import 'Methods.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _type =TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;

  createData(String name , String email , String pass,String type) async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc();
    Map<String , dynamic> users = {
    "name": name,
    "email": email,
    "password": pass,
    "type":type };
    print("Data Saved Hogya Mera");
    documentReference.set(users).whenComplete(() {
       print("$users Created");
        }); 
        }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        /*   appBar: AppBar(
         centerTitle: true,
       title:Text('Signup')
     ,
       backgroundColor: Color(0XFF1fc709),
       //#1fc709
     ), */
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
                    alignment: Alignment.centerLeft,
                    width: size.width / 0.5,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios), onPressed: (){

                        }),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Create Account to Contiue!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "Name", Icons.account_box, _name),
                    ),
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "password", Icons.lock, _password,
                      
                      ),
                    ),
                  ),
                 /*  SizedBox(
                    height: size.height / 10,
                  ), */
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "Vendor/User", Icons.person_add_sharp,_type),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  customButton(size),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
    Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_name.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty
            && _type.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
        
          createAccount(_name.text, _email.text, _password.text,_type.text,).then((user) {
            if (user != null) {
              setState(() {
                isLoading = false;
              });
              createData(_name.text , _email.text , _password.text,_type.text);
               Navigator.push(
                   context, MaterialPageRoute(builder: (_) => HomeScreen()));
              print("Account Created Sucessfull");

            } else {
              print("SignUp Failed");              
              setState(() {
                isLoading = false;
              });
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
                        _email.text='';
                        _password.text='';
                          Navigator.of(contxt).pop();
                        }, child: Text('OK'))
                      ],
                     );
              });
            }
          });
        } else {
          print("Please enter Fields");showDialog(context: context, builder: (contxt)
              {
                     return AlertDialog(
                       shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                       ),
                      title:Text('Error'),
                      content: Text('Please fill all the fields'),
                      actions: [
                        FlatButton(onPressed: (){
                          Navigator.of(contxt).pop();
                        }, child: Text('Cancel')),
                         FlatButton(onPressed: (){
                        _email.text='';
                        _password.text='';
                          Navigator.of(contxt).pop();
                        }, child: Text('OK'))
                      ],
                     );
              });
          //Text('Please filled all the fields');
        }
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightGreen,
          ),
          alignment: Alignment.center,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}