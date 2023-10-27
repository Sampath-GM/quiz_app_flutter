
import 'package:flutter/material.dart';
import 'package:quizapp/Pages/HomePage.dart';

void main(){
  runApp (const Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomePage(),
     theme: ThemeData(
      primaryColor:Colors.deepPurpleAccent,

     ),
     title: 'Welcome',
    );
  }
}


