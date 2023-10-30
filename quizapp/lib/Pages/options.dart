import 'package:flutter/material.dart';

Widget options({
 String? type
}
 
){
  return Container(

            decoration: BoxDecoration(border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.white)]
            ),
            height: 50,
            width:600,
            child: Center(
              child: Text("$type",style: TextStyle(fontSize: 20,color: Colors.black),)),);
}
