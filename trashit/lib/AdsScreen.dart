import 'package:Trashit/Methods.dart';
import 'package:flutter/material.dart';

class AdsScr extends StatelessWidget {
  const AdsScr({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text("Post Ad",style: TextStyle(color: Colors.black),),
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
      body: AdForm(),
     ),
    );
  }
}
class AdForm extends StatefulWidget {
  const AdForm({ Key? key }) : super(key: key);

  @override
  _AdFormState createState() => _AdFormState();
}

class _AdFormState extends State<AdForm> {
  final _formKey = GlobalKey<FormState>(); 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
     return Form(  
      key: _formKey,  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
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
            hintText: 'Enter your address',  
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
            labelText: 'Weight in kilograms',  
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
            decoration: const InputDecoration(  
            icon: const Icon(Icons.code),  
            hintText: 'Description(Optional)',  
            labelText: 'Descrition',  
            
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
                child: const Text('Post Ad'),  
                  onPressed: (){
                     if (_formKey.currentState!.validate()) {  
                    // If the form is valid, display a Snackbar.  
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