import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Custom_widgets/text_style.dart';
import 'package:quizapp/Pages/HomePage.dart';
import 'package:quizapp/Pages/options.dart';

class Quiz_screen extends StatefulWidget {
  const Quiz_screen({super.key});

  @override
  State<Quiz_screen> createState() => _Quiz_screenState();
}

class _Quiz_screenState extends State<Quiz_screen> {

  int seconds=60;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
                Container(
          padding: const EdgeInsets.all(12),
            width: double.infinity,
            height:double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:[ Colors.blue,Colors.blueAccent]
                  ),
            ),
            child:Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                         IconButton(
                          onPressed: (){
                            Navigator.pop(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            // Navigator.pop(context,MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                         icon:const Icon(
                          CupertinoIcons.xmark_circle,
                          size: 50),
                                ),
                    ],              
                ),
                SizedBox(height: 12,),
                Image.asset('assets/images/idea.png',
                height: 300,width: 300,),
                 SizedBox(height: 12,),
                 Align(
          alignment: Alignment.centerLeft,
          child: normaltext(
            color: Colors.white,
            size: 22,
            text: 'Quations 1 of 50'),
            ),
               const SizedBox(height: 12,),
           const Text('Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?',
                  style:TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    
                  ) ,),
            Spacer(),
            Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
                height: 50,
                width:600,
                child: const Center(
                  child: Text("main()",
                  style: TextStyle(
                    fontSize: 25,color: 
                    Colors.white),)),),
                   const SizedBox(height: 12,),
                    options(type: "runApp()"),SizedBox(height: 12,),
                    options(type: "container()"),SizedBox(height: 12,),
                    options(type: "root()")
                ],
            ),
                ),
              ],
        ),  
      ),
      
      );   
  }
}