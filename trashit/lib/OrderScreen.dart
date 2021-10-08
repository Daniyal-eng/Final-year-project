import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';





class OrderScr extends StatefulWidget {
  const OrderScr({ Key? key }) : super(key: key);

  @override
  _OrderScrState createState() => _OrderScrState();
}

class _OrderScrState extends State<OrderScr> {
   TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
   TextEditingController _address = TextEditingController();
      TextEditingController _wasteAmount = TextEditingController();
  TextEditingController _wasteType = TextEditingController();
 TextEditingController _descrip = TextEditingController();
 
       late bool _serviceEnabled;
       late PermissionStatus _permissionGranted;
      


createData(String user_name , String user_phone , String user_address,String waste_amount,String waste_type,String descrip) async {
     var Id = generateRandomString(20);
    DocumentReference documentReference = FirebaseFirestore.instance.collection('orders').doc(Id);
    Map<String , dynamic> orders = {
    "name": user_name,
    "phone number": user_phone,
    "address":user_address,
    "Amount of waste": waste_amount,
    "Waste category":waste_type,
    "Additional text":descrip,
     "id":Id,
     };
    print("Order place hogaya");
    documentReference.set(orders).whenComplete(() {

       print("$orders placed");
        }); 
        }



  String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();

}
  String? uid;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void getUserId() async { 
  final User user = await auth.currentUser!; 
  uid = user.uid;
  print("User Id Yeh Hai : "+uid.toString()); }

  @override
  void initState() { 
    getUserId();
    super.initState();
    
  }
  final _formKey = GlobalKey<FormState>();  
  Widget build(BuildContext context) {
    return  MaterialApp(
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
      
      
      
       body: SingleChildScrollView(
         child: Container(child: 
         Form(  
             key: _formKey,  
             child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[  
            TextFormField(  
              keyboardType: TextInputType.text,
              autocorrect: true,
              controller: _name,
              decoration: const InputDecoration(  
                icon: const Icon(Icons.person),  
                hintText: ' Full Name',
                labelText: 'Name',
                  
              ),  
               validator: (value) {  
                if (value!.isEmpty) {  
                  return 'Please enter your name';  
                }  
                return null;  
              },  
            ),  
            TextFormField(  
              keyboardType: TextInputType.number,
              maxLength: 12,
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: _phone,
              decoration: const InputDecoration(  
                icon: const Icon(Icons.phone),  
                hintText: ' Phone number',
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
                 keyboardType: TextInputType.number,

                controller: _wasteAmount,
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
           keyboardType: TextInputType.text,
          controller: _wasteType,
              decoration: const InputDecoration(  
              icon: const Icon(Icons.delete), 
              hintText: 'Waste category',  
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
         keyboardType: TextInputType.text,
                controller:_descrip,
              decoration: const InputDecoration(  
              icon: const Icon(Icons.code),  
              hintText: ' Description(Optional)',  
              labelText: 'Description',  
              
              ),  
            
               validator: (value) {  
                if (value!.isEmpty) {  
                  return 'Please your description';  
                }  
                return null;  
              },  
             ),  
               
            TextFormField(  
              keyboardType: TextInputType.text,
              controller: _address,
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

          
   Container(
     height: 60,
     child: Padding(
       padding: const EdgeInsets.only(left: 97.0, top: 20.0), 
       
         child: RaisedButton(onPressed: () async {
            late LocationData _locationData;
                  Location location = new Location();
                  location.enableBackgroundMode(enable: true);


             _serviceEnabled = await location.serviceEnabled();
               if (!_serviceEnabled) {
                       _serviceEnabled = await location.requestService();
               if (!_serviceEnabled) {
                      return;
                          }
                    }

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
          return;
  }
}
                  _locationData = await location.getLocation();
                _address.text = " ${_locationData.latitude} , ${_locationData.longitude}";
                // _address="$_locationData.latitude" ,_"$locationData.longitude";
                   },child:Text('Send your location')),
       
     ),
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
                padding: const EdgeInsets.only(left: 120.0, top: 20.0),  
                child: new RaisedButton(  
                  child: const Text('Place order'),  
                    onPressed: (){
                       if (_formKey.currentState!.validate()) {  
                      // If the form is valid, display a Snackbar.
                       showDialog(context: context, builder: (contxt)
                {
                       return AlertDialog(
                         shape:RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                         ),
                        title:Text('Order Successful'),
                        content: Text('Your order has been placed successfully'),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.of(contxt).pop();
                          }, child: Text('Cancel')),
                           FlatButton(onPressed: (){
                          _name.text='';
                          _phone.text='';
                          _address.text='';
                          _wasteAmount.text='';
                          _wasteType.text='';
                          _descrip.text='';
                            Navigator.of(contxt).pop();
                          }, child: Text('OK'))
                        ],
                       );
                });
                       createData(_name.text,_phone.text,_address.text,_wasteAmount.text,_wasteType.text,_descrip.text);
                      Scaffold.of(context)  
                          .showSnackBar(SnackBar(content: Text('Data is in processing.'))); 
                          
                       }

                       FlatButton(onPressed:(){}, child:Text(''));
                    
                    },  
                )),  
              /*  Center(
                 child: RaisedButton(onPressed: (){
                    LocationTracking();
                  },child: Text('location here'),),
               ) */
          ],  
             ),  
         ),
              
                 
             ),
       ),
          
      )
    );
  }
}