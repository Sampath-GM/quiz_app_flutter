import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Custom_widgets/text_style.dart';
import 'package:quizapp/Pages/quiz_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var imageurl='https://storyset.com/illustration/online-test/amico';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height:double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[ Colors.lightBlue,Colors.blueAccent]
              ),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){
                  // Navigator.pop(context,MaterialPageRoute(builder: (context)=>HomePage()));
                },
               icon:const Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.white60,
                size: 50,)),
                Image.asset('assets/images/quiz.png'),
                const SizedBox(height: 12),
                   normaltext(text: 'Welcome to test',size: 25,color: Colors.white),
                   headingtext(text: 'QuizApp',size: 30,color: Colors.white),
                   const SizedBox(height: 12),
                   subtitletext(text: 'You will be faced with one of the most demanding tests at any point in your career, so prepare yourself as much as possible',color: Colors.white,size: 15),
                   const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const Quiz_screen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                      boxShadow:const [BoxShadow(
                        color: Colors.white,
                        blurRadius:52,
                        blurStyle: BlurStyle.solid,
                        spreadRadius: 5 )]
                      ),
                      child: normaltext(text: 'Continue',color: Colors.black,size:25),
                    ),
                  ),
                ),
            ],
          ),
          ),
        ),
      );
  }
}