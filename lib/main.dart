import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        color: Colors.orangeAccent,
        child: Home()
      )
    );
  }
}
 class Home extends StatefulWidget {
   @override
   _HomeState createState() => _HomeState();
 }
 
 class _HomeState extends State<Home> {
   @override
   Widget build(BuildContext context) {
     return Container(
       child: Scaffold(
         appBar: AppBar(title: Text('Calculator'),
         backgroundColor: Colors.orangeAccent,
         ),
       )  
     );
   }
 }