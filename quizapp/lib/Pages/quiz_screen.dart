// import 'dart:js_util';
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
  var currentquestionindex=0;
  var isLoaded=false;
  var options=[];

  var optionscolor=[
    Colors.white,
     Colors.white,
      Colors.white,
       Colors.white,
  ];

  @override
  void initState(){
    super.initState();
    quiz=getQuiz();
  }

  resetcolor(){
    var optionscolor=[
    Colors.white,
     Colors.white,
      Colors.white,
       Colors.white,
  ];
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
                  var data=snapshot.data["results"];

                  if (isLoaded==false){
                    options = data[currentquestionindex]["incorrect_answer"];
                    options.add(data[currentquestionindex]["correct_answer"]);              
                    options.shuffle();
                    isLoaded = true;
                  }

                  return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
              text: 'Questions ${currentquestionindex + 1} of ${data.length}'),
              ),
                  const SizedBox(height: 12,),
                        Text(data[currentquestionindex]["question"],
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ) ,),
                    const SizedBox(height: 18),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context,int index) {
                        var answer=data[currentquestionindex]["correct_answer"];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (answer.toString()==options[index].toString()){
                                optionscolor[index]=Colors.green;
                            }
                              else{
                                optionscolor[index]=Colors.red;
                            }
                            
                              if(currentquestionindex<data.length){
                                Future.delayed(Duration(seconds: 1),(){
                                  isLoaded=false;
                                currentquestionindex++;
                                  resetcolor();
                              });
                              }
                              
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                          color: optionscolor[index],
                          boxShadow:const [BoxShadow(
                            color: Colors.white,
                            blurRadius:10,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 1,
                            )] ),
                          child: normaltext(text: options[index].toString(),color: Colors.black,size:25),
                                              ),
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