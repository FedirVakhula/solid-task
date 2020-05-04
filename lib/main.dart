import 'package:flutter/material.dart';
import 'package:fluttersolidsoftware/services/generate_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Solid Software'),
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
  bool selected = false;
  double _opacity = 0;

  Color buttonColorWhite = Colors.white;
  Color buttonColorGrey = Colors.grey[600];
  Color buttonActiveColor = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          animationText();
        },
        child: Container(
          color: UniqueColorGenerator.getColor(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width / 3,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: buttonColorGrey,
                            offset: Offset(6.0, 6.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: buttonColorWhite,
                            offset: Offset(-6.0, -6.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey[200],
                          Colors.grey[300],
                          Colors.grey[400],
                          Colors.grey[500],
                        ],
                        stops: [0.1, 0.3, 0.8, 1],
                      ),
                    ),
                    child:
                        Icon(Icons.android, size: 60, color: buttonActiveColor),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.up,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3,
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: _opacity,
                      child: Center(
                        child: Text(
                          'Hey there',
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: buttonColorGrey,
                            offset: Offset(6.0, 6.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: buttonColorWhite,
                            offset: Offset(-6.0, -6.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey[200],
                          Colors.grey[300],
                          Colors.grey[400],
                          Colors.grey[500],
                        ],
                        stops: [0.1, 0.3, 0.8, 1],
                      ),
                    ),
                    child:
                        Icon(Icons.message, size: 60, color: buttonActiveColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List buttonColors = [
    Colors.grey[600],
    Colors.white,
    Colors.green,
    Colors.grey[800],
    Colors.black54
  ];

  void changeColors(selected) {
    if (selected) {
      buttonColorWhite = buttonColors[0];
      buttonColorGrey = buttonColors[1];
      buttonActiveColor = buttonColors[2];
    } else {
      buttonColorWhite = buttonColors[1];
      buttonColorGrey = buttonColors[0];
      buttonActiveColor = buttonColors[3];
    }
  }

  void animationText() {
    if (selected) {
      setState(() {
        _opacity = 0;
        selected = false;
        changeColors(selected);
      });
    } else {
      setState(() {
        _opacity = 1;
        selected = true;
        changeColors(selected);
      });
    }
  }
}
