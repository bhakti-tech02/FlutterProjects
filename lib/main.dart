import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText)
  {
    if(buttonText == "CLEAR")
      {
         _output = "0";
         num1 = 0.0;
         num2 = 0.0;
         operand = "";
      }
    else if(buttonText == "+" || buttonText == "-"|| buttonText == "X" || buttonText == "/")
      {
        num1 = double.parse(output);
        operand = buttonText;
        _output = "0";

      }
    else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already contains a decimal");
      return;
      }
      else{
      _output = _output + buttonText ;
      }
    }
    else if(buttonText == "=")
      {
        num2 = double.parse(output);

        if(operand == "+")
        {
            _output = (num1 + num2).toString();
        }
        if(operand == "-")
        {
          _output = (num1 - num2).toString();
        }
        if(operand == "X")
        {
          _output = (num1 * num2).toString();
        }
        if(operand == "/")
        {
          _output = (num1 / num2).toString();
        }
        num1 = 0.0;
        num2 = 0.0;
       operand = "";
      }
    else{
      _output = _output + buttonText ;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget buildButtons(String buttonText) {
    return Expanded(
      child: OutlineButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        onPressed: ()  {
          buttonPressed(buttonText);
        },
        padding: EdgeInsets.all(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 12,
          ),
              alignment: Alignment.centerRight,
              child: Text(output,
                  style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),),),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButtons('7'),
                  buildButtons('8'),
                  buildButtons('9'),
                  buildButtons('/'),
                ],
              ),
              Row(
                children: [
                  buildButtons('4'),
                  buildButtons('5'),
                  buildButtons('6'),
                  buildButtons('X'),
                ],
              ),
              Row(
                children: [
                  buildButtons('1'),
                  buildButtons('2'),
                  buildButtons('3'),
                  buildButtons('-'),
                ],
              ),
              Row(
                children: [
                  buildButtons('.'),
                  buildButtons('0'),
                  buildButtons('00'),
                  buildButtons('+'),
                ],
              ),
              Row(
                children: [
                  buildButtons('CLEAR'),
                  buildButtons('='),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
