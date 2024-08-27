/// FractionallySizedBox

import 'package:flutter/material.dart';

void main() {
  runApp(Module11Class2());
}

class Module11Class2 extends StatelessWidget {
  const Module11Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      /// FractionallySizedBox
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.6,
          child: Container(
            color: Colors.yellow,
            child: Center(
              child: Text(
                'FractionallySizedBox',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
