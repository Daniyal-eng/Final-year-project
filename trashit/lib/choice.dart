import 'package:flutter/material.dart';


class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({ Key? key }) : super(key: key);

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome to TrashIt'),
        ),
        body: SingleChildScrollView(child: 
        Container(
          width: 300,
          height: 400,
          child: Column(
            children: [
                 Text('Welcme To TrashIt',
                 style:TextStyle( fontSize: 30,
                 fontWeight: FontWeight.bold
                 )
                 ),
                 SizedBox(
                   height: 30,
                 )
            ],
          )

        )
        ,),
      ),
    );
  }
}