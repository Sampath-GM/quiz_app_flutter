import 'package:flutter/material.dart';
import 'package:quizapp/Pages/HomePage.dart';

void main(){
  runApp (const Myapp());
}

class Myapp extends StatelessWidget {
  // const Myapp({super.key});
const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: const HomePage(),
     theme: ThemeData(
      primaryColor:Colors.deepPurpleAccent,

     ),
     title: 'Welcome',
    );
  }
}


