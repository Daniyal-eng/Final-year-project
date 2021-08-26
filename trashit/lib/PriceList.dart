import 'package:flutter/material.dart';

import 'Methods.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text("Price List",style: TextStyle(color: Colors.black),),
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
        child: Column(
          children: [
          /*   Padding(padding: EdgeInsets.only(top: 3)),
            Container(
              margin: EdgeInsets.only(top:3),
            child:       
            Text('Price list', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xff08400b),
                        
            ), */
               //) ,
            //), 
            myContainerWidget("Solid/liquid household",
                "30/kg",
                "",            
                'http://www.waterandair.com/wp-content/uploads/2014/04/311.jpg',
                ),
            myContainerWidget("Electrical Waste",          
              "50/kg",
              "",    
              'https://ensia.com/wp-content/uploads/2018/02/Noteable_ewaste_main-760x378.jpg',
            ),
            myContainerWidget("Medical/Clinical Waste",
              "40/kg",
              "",
              'https://i1.wp.com/www.cleantechloops.com/wp-content/uploads/2012/05/Medical_Waste.jpg',
            ),
           /* x */

             myContainerWidget("Hazardous Waste",
              "20/kg",
              "",         
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQsx892mgGHUUrYBOnHF86dvZeFYAcUKJE8Q&usqp=CAU',
            ),
            
             myContainerWidget("Industrial Waste",
              "50/kg",
              "",         
              'https://lh3.googleusercontent.com/proxy/sMZfzceSswEVxElbzXRoUqEFPfLqe3Iu0ANkBKpa-FpRjTN-LkcSaewQvt6k7T5vpuvMPvEP04M4HDKcfp5QC1kvA3w3R_rQSoiyodNApPygYV3j_9j82Q',
            ),
            
             myContainerWidget("Agricultural Waste",
              "15/kg",
              "",         
              'https://thumbs.dreamstime.com/b/agricultural-food-waste-dump-compost-pit-detail-130409869.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

Widget myContainerWidget(String title , String price , String pieces , String img){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    
    child: Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 2 , color: Colors.black),       
      ),
      height: 150,
      width: 500,
      
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
               // border: Border.all(width: 2 , color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.elliptical(2, 5)),
                image: DecorationImage(
                  fit:BoxFit.fitHeight,
                  image: NetworkImage(img)

                )
              ),
              height: 150,
              width: 120,
            ),
          ),
          Container(
            height: 130,
            width: 200,
            child: Column(
              children: [
                SizedBox(height: 18,),
                Align(
                  alignment: Alignment.topLeft,
                    child: Text(title,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900),)),
                //SizedBox(height: 0.2,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(children: [
                   // Icon(Icons.star,color: Colors.yellow,),
                    //Text(Category,style: TextStyle(color: Colors.grey),),
                  ],),
                ),
              //s  SizedBox(height: 5 ,),
              Align(
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Text("$pieces Rate:",style: TextStyle(color: Colors.grey),),
                  //SizedBox(width: 5,),
                  Text(price,style: TextStyle(color: Colors.lightGreen),),
                ],),
              ),
               // SizedBox(height: 5 ,),
               // Align(
               //     alignment: Alignment.topLeft,
                //    child: Text("Quantity $quantity",style: TextStyle(color: Colors.grey,)),
               // )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}