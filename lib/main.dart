import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(


      ),
      home: const mathpage(title: ''),
    );
  }
}

class mathpage extends StatefulWidget {
  const mathpage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<mathpage> createState() => _mathpageState();
}

class _mathpageState extends State<mathpage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
  backgroundColor: Colors.indigo,
      body: SafeArea(child:
      Column(children: [

        SizedBox(height: 50,),
        Center(

          child:

          Text("Hello Welcome to AdhamMath Applection"),

        ),
        SizedBox(height: 100,),
        Center(
          child:
              Row(children: [
                Text("Made in Adham Marwan"),
                SizedBox(width: 30,),
                ClipOval(child:  Image.asset('assets/aaa.jpg',height: 120,width: 120,),),

              ],)



        ),
        SizedBox(height: 100,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [


            ),],
        ),
      ],)
      ),
    );
  }
}
