/// StateFul Widget

import 'package:flutter/material.dart';

void main() {
  runApp(Module12Class1());
}

class Module12Class1 extends StatelessWidget {
  const Module12Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text('Center $counter'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              counter--;
              setState(() {});
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              counter++;
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
