import 'package:flutter/material.dart';
import 'Methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      home: Scaffold(
       // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text("Place Order",style: TextStyle(color: Colors.black),),
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
         body:MyCustomForm(),

      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({ Key? key }) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  
createData(String user_name , int user_phone , String user_address,int waste_amount,String waste_type,String descrip) async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('Ads').doc();
    Map<String , dynamic> orders = {
    "name": user_name,
    "phone number": user_phone,
    "address":user_address,
    "Amount of waste": waste_amount,
    "Waste category":waste_type,
    "Additional text":descrip,
     };
    print("Order place hogaya");
    documentReference.set(orders).whenComplete(() {
       print("$orders placed");
        }); 
        }


  final _formKey = GlobalKey<FormState>();  
    String? user_name;
    int? user_phone;
    String? user_address;
    int? waste_amount;
    String? waste_type;
    String? descrip;
    dynamic result;
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
  }

  late String category_id;
  List<String> category = [
    "Solid/household waste",
    "Medical/clinical waste",
    "Hazardous waste",
    "Electrical waste",
    "industrial waste",
    "Agricultural waste",
  ];

  Widget build(BuildContext context) {
    return Form(  
      key: _formKey,  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[  
          TextFormField(  
            
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: ' Enter your name',  
              labelText: 'name',
                
            ),  
             validator: (value) {  
              if (value!.isEmpty) {  
                return 'Please enter your name';  
              }  
              return null;  
            },  
          ),  
          TextFormField(  
          
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: ' enter your phone number',  
              labelText: 'Phone',  
            ),  
             validator: (value) {  
              if (value!.isEmpty) {  
                return 'Please valid phone number';  
              }  
              return null;  
            },  
           ),  
            
          TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.home),  
            hintText: ' Enter your address',  
            labelText: 'Address',  
            
            ),  
             validator: (value) {  
              if (value!.isEmpty) {  
                return 'Please enter your address';  
              }  
              return null;  
            },  
           ),  
            TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.monitor_weight_rounded),
            hintText: 'Amount of Waste',  
            labelText: ' Weight in kilograms',  
            ),  
             validator: (value) {  
              if (value!.isEmpty) {  
                return 'Please enter waste amount';  
              }  
              return null;  
            },  
           ),  


 TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.delete), 
            hintText: 'waste_type Waste category',  
            labelText: 'Waste type',  
            
            ),  
          
             validator: (value) {  
              if (value!.isEmpty) {  
                return 'Please enter waste type';  
              }  
              return null;  
            },  
           ),  
TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.code),  
            hintText: ' Description(Optional)',  
            labelText: 'description',  
            
            ),  
          
             validator: (value) {  
              if (value!.isEmpty) {  
                return 'Please enter waste type';  
              }  
              return null;  
            },  
           ),  
           
    /* DropDownFormField(
                onValueChanged: (dynamic value) {
                  category_id= value;
                },
                value: category_id,
                required: false,
                hintText: 'Choose waste type',
                labelText: 'Waste type',
                items: category,
              ), */

          new Container(  
              padding: const EdgeInsets.only(left: 120.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('Place order'),  
                  onPressed: (){
                     if (_formKey.currentState!.validate()) {  
                    // If the form is valid, display a Snackbar.
                     createData(user_name!.text , user_phone.text , user_address.text,waste_amount.text,waste_type.text,descrip.text);
                    Scaffold.of(context)  
                        .showSnackBar(SnackBar(content: Text('Data is in processing.')));  
                  }  
                  },  
              )),  
        ],  
      ),  
    );  
       
  }
}

