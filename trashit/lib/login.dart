import 'package:flutter/material.dart';
import 'package:Trashit/CreateAccount.dart';
import 'package:Trashit/HomeScreen.dart';
import 'Methods.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(
        // centerTitle: true,
       //title:Text('TrashIt'),
       //backgroundColor: Color(0XFF1fc709),
       //#1fc709
             
     //),
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
                    height: size.height / 5,
                  ),
                  /*   Container(
                      width: MediaQuery.of(context).size.width,
                      child:Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height:100,  
                      ),            
                      )  */
                   /* Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 0.5,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
                  ), */
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
                      "Sign In to Contiue!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "Email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "password", Icons.lock, _password),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  customButton(size),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CreateAccount())),
                    child: Text(
                      "don't have an account?",
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

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
        /*   setState(() {
            isLoading = true;
          }); */
              
          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login Sucessfull");
              //Text('You are signed in');
             /*  setState(() {
                isLoading = false;
              }); */
               Navigator.push(
                   context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else {
              print("Login Failed");
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
                        _email.text='';
                        _password.text='';
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
              }
              );
        } 
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}