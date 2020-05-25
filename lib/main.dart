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
        //color: Colors.orangeAccent,
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

   Widget buildbutton(String text){
        return Expanded(
                 child: MaterialButton(
                   child: Text(text),
                   color: Colors.orangeAccent,
                   splashColor: Colors.white,
                   padding: EdgeInsets.symmetric(
                     horizontal: 10,
                     vertical: 30),
                   onPressed: (){},
                 ),
               );
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(title: Text('Calculator'),
         backgroundColor: Colors.orangeAccent,
         ),
         body: Container(
           //padding: EdgeInsets.symmetric(vertical: 10),
           //alignment: Alignment.bottomCenter,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
             Row(children: <Widget>[
               buildbutton("2"),
               buildbutton("6"),
               buildbutton("2"),
               buildbutton("2"),
               buildbutton("2"),
             ]),
             Row(children: <Widget>[
              buildbutton("2"),
              buildbutton("2"),
              buildbutton("2"),
              buildbutton("2"),
              buildbutton("2"),
             ]),
               Row(children: <Widget>[
               buildbutton("2"),
               buildbutton("6"),
               buildbutton("2"),
               buildbutton("2"),
               buildbutton("2"),
             ]),
               Row(children: <Widget>[
               buildbutton("2"),
               buildbutton("6"),
               buildbutton("2"),
               buildbutton("2"),
               buildbutton("2"),
             ]),
           ],)
         )
       );
   }
 }