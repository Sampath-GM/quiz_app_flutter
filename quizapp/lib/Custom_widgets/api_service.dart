import 'dart:convert';
import 'package:http/http.dart' as http;

var link="https://sampath-gm.github.io/Quiz_QA/Question.json";

getquiz() async{
var res=await http.get(Uri.parse(link));
  if(res.statusCode==200){
    var data=jsonDecode(res.body.toString());
    // ignore: avoid_print
    print('data is loaded');
    return data;
  }
}