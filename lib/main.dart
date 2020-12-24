import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reverse String',
      theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.black),
      home: Reverse(),
    );
  }
}

class Reverse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReverseState();
  }
}

class _ReverseState extends State<Reverse> {
  final rev_Value = TextEditingController();
  String reverse = "";
  void reverse_A_String() {
    int value_length = rev_Value.text.length;
    setState(() {
      for (int i = value_length - 1; i >= 0; i--) {
        reverse += rev_Value.text[i];
      }
    });
    rev_Value.text = "";
  }

  void clearText() {
    setState(() {
      reverse = "";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reverse String'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Reverse Any String',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: rev_Value,
                            keyboardType: TextInputType.text,
                            decoration:
                                InputDecoration(labelText: 'Enter a string'),
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: reverse_A_String,
                              child: Text('Reverse'),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            'Reverse String: $reverse',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: clearText,
                              child: Text('Clear',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  )),
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
