import 'package:flutter/material.dart';

Widget normaltext({
  String? text,
  Color? color,
  double? size,
  }){
  return  Center(
    child: Text(
      text!,
       textAlign: TextAlign.center,
       style: TextStyle(
        color:color,
        fontSize: size),
    ),
  );
}

Widget headingtext({
  String? text,
  Color? color,
  double? size,
  }){
  return  Center(
    child: Text(
      text!,
       textAlign: TextAlign.center,
       style: TextStyle(
        color:color,
        fontWeight: FontWeight.bold,
        fontSize: size),
    ),
  );
}

Widget subtitletext({
  String? text,
  Color? color,
  double? size,
  }){
  return  Text(
    text!,
     textAlign: TextAlign.center,
     style: TextStyle(
      color:color,
      fontSize: size),
  );
}