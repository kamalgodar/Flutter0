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
            child: Home()));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String operand = "";
  int num1 = 0;
  int num2 = 0;

  String tempoutput = "0";
  String output = "0";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      num1 = 0;
      num2 = 0;
      tempoutput = "0";
      operand = "";
    } else if (buttonText == "DEL") {
      tempoutput = tempoutput.substring(0, tempoutput.length - 1);
      if (tempoutput == "") {
        tempoutput = "0";
      }
    }else if(buttonText == "."){
      if(tempoutput.contains(".")){
        print("already contains a decimal number.");
      }
      else{
        tempoutput = tempoutput + buttonText;
      }
    }else if(buttonText == "+/-"){
      tempoutput.toString().startsWith('-') ? tempoutput = tempoutput.toString().substring(1): tempoutput = '-'+tempoutput.toString();        
        output = tempoutput;
    }else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      num1 = int.parse(output);
      operand = buttonText;
      tempoutput = "0";
    } else if (buttonText == "=") {
      num2 = int.parse(output);

      if (operand == "+") {
        tempoutput = (num1 + num2).toString();
      }

      if (operand == "-") {
        tempoutput = (num1 - num2).toString();
      }

      if (operand == "x") {
        tempoutput = (num1 * num2).toString();
      }

      if (operand == "/") {
        tempoutput = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      if (tempoutput == "0") {
        tempoutput = buttonText;
      } else {
        tempoutput = tempoutput + buttonText;
      }
    }
    setState(() {
       if(tempoutput.toString().contains('.')) {
        List<String> splitDecimal = tempoutput.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
          tempoutput = splitDecimal[0].toString();}
         
        output = tempoutput;      
    });
  }

  Widget buildbutton(String text, Color color) {
    return Expanded(
      child: RaisedButton(
          child: Text(text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          color: color,
          splashColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: Colors.black)),
          //shape: CircleBorder(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          onPressed: () => buttonPressed(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: AppBar(
          title: Text('Calculator',style: TextStyle(color: Colors.black,fontSize: 23),),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Container(
                color: Color.fromRGBO(235, 190, 52, 100),
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(output,style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)))
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
                      buildbutton("AC", Color.fromRGBO(52, 235, 183, 100)),
                      buildbutton("DEL", Color.fromRGBO(235, 20, 52, 100)),
                      buildbutton("+/-", Color.fromRGBO(52, 235, 183, 100)),
                      buildbutton("/", Color.fromRGBO(171, 235, 52, 100)),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("7", Colors.orangeAccent),
                      buildbutton("8", Colors.orangeAccent),
                      buildbutton("9", Colors.orangeAccent),
                      buildbutton("x", Color.fromRGBO(171, 235, 52, 100)),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("4", Colors.orangeAccent),
                      buildbutton("5", Colors.orangeAccent),
                      buildbutton("6", Colors.orangeAccent),
                      buildbutton("-", Color.fromRGBO(171, 235, 52, 100)),
                    ]),
                    Row(children: <Widget>[
                      buildbutton("1", Colors.orangeAccent),
                      buildbutton("2", Colors.orangeAccent),
                      buildbutton("3", Colors.orangeAccent),
                      buildbutton("+", Color.fromRGBO(171, 235, 52, 100)),
                    ]),
                    Row(children: <Widget>[
                      buildbutton(".", Colors.orangeAccent),
                      buildbutton("0", Colors.orangeAccent),
                      buildbutton("00", Colors.orangeAccent),
                      buildbutton("=", Color.fromRGBO(171, 235, 52, 100)),
                    ]),
                  ],
                )),
          ),
        ]));
  }
}
