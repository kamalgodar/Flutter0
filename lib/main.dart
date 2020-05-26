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
            child: Home()));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String expression = "0";
  String output = "0";
  
  buttonPressed(String buttonText){
    //print(buttonText);
    setState(() {
      if(buttonText == "AC"){
        expression = "0";
        output = "0";
      }

      else if(buttonText == 'DEL'){
        output = output.substring(0, output.length - 1);
        if(output == "")
        output = "0";
      }

      else if(buttonText == "="){

      }

      else{
        if(output == "0"){
          output = buttonText;
        }
        else
        output = output + buttonText;
      }
    });
  }

  Widget buildbutton(String text) {
    return Expanded(
      child: MaterialButton(
        child: Text(text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        color: Colors.orangeAccent,
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        onPressed: () =>
        buttonPressed(text)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(20),
                        child: Text(expression, style: TextStyle(fontSize: 20))),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(output, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
                  ],
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //alignment: Alignment.bottomCenter,
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(children: <Widget>[
                      buildbutton("AC"),
                      buildbutton("DEL"),
                      buildbutton("%"),
                      buildbutton("/"),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("7"),
                      buildbutton("8"),
                      buildbutton("9"),
                      buildbutton("x"),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("4"),
                      buildbutton("5"),
                      buildbutton("6"),
                      buildbutton("-"),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("1"),
                      buildbutton("2"),
                      buildbutton("3"),
                      buildbutton("+"),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("."),
                      buildbutton("0"),
                      buildbutton("00"),
                      buildbutton("="),
                    ]),
                  ],
                )),
          ),
        ]));
  }
}
