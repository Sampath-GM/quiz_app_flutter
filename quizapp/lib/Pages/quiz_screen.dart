import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Custom_widgets/api_service.dart';
import 'package:quizapp/Custom_widgets/text_style.dart';
import 'package:quizapp/Pages/HomePage.dart';

class Quiz_screen extends StatefulWidget {
  const Quiz_screen({super.key});

  @override
  State<Quiz_screen> createState() => _Quiz_screenState();
}

class _Quiz_screenState extends State<Quiz_screen> {

  int seconds=60;
  late Future quiz;

  void initstate(){
    super.initState();
    quiz=getquiz();
  }

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
            child:FutureBuilder(
              future: quiz,
              builder: (BuildContext context,AsyncSnapshot snapshot) {
                if (snapshot.hasData){
                  return SingleChildScrollView(
              child: Column(
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
                  const SizedBox(height: 12,),
                  Image.asset('assets/images/idea.png',
                  height: 200,width: 200,),
                   const SizedBox(height: 12,),
                   Align(
                      alignment: Alignment.centerLeft,
                      child: normaltext(
              color: Colors.white,
              size: 22,
              text: 'Questions 1 of 30'),
              ),
                 const SizedBox(height: 12,),
                       const Text('Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?',
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ) ,),
                    const SizedBox(height: 18),
                    const Spacer(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context,int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                        boxShadow:const [BoxShadow(
                          color: Colors.white,
                          blurRadius:10,
                          blurStyle: BlurStyle.solid,
                          spreadRadius: 1,
                          )] ),
                        child: normaltext(text: 'Continue',color: Colors.black,size:25),
                      );
                      }
                      ),
                  ],
              ),
            );
                }
                else{
                  return const Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),);
                }
                
                
              }
              ),
                ),
              ],
        ),  
      ),
      
      );   
  }
}