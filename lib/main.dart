// image, materialApp, scaffold, Icons,
// buttons(ElevatedButton, IconButton, TextButton, GestureDetector, InkWell)

import 'package:flutter/material.dart';

void main() {
  runApp(Module7Class3());
}

class Module7Class3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Module 7 Class 3',
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Home'),
      ),
      body: Center(
        /// Text Widget
        // child: Text(
        //   'Hello',
        //   style: TextStyle(
        //     color: Colors.red,
        //     fontSize: 40,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),

        /// Icon Widget
        // child: Icon(
        //   Icons.mood,
        //   size: 200,
        //   color: Colors.yellow,
        // ),

        /// Image Widget from Image.network
        // child: Image.network(
        //   'https://cdn.ostad.app/course/cover/2023-12-04T11-05-21.903Z-Flutter.jpg',
        //   width: 400,
        //   height: 500,
        // ),

        ///  Image Widget from Image.asset
        // child: Image.asset(
        //   'assets/images/BZS.jpg',
        //   width: 500,
        //   height: 300,
        //   fit: BoxFit.cover,
        // ),

        /// Elevated Button
        // child: ElevatedButton(
        //   onPressed: () {
        //     print('Button Pressed');
        //   },
        //   child: Text('Notification'),
        // ),

        /// Icon Button
        // child: IconButton(
        //   onPressed: () {
        //     print('Icon Button');
        //   },
        //   icon: Icon(
        //     Icons.smart_button,
        //     size: 50,
        //   ),
        // ),

        /// Text Button
        // child: TextButton(
        //   onPressed: () {
        //     print('show button pressed');
        //   },
        //   child: Text('Text Button'),
        // ),

        /// Gesture Detector for response callback
        // child: GestureDetector(
        //   onTap: () {
        //     print('single tap');
        //   },
        //   onDoubleTap: () {
        //     print('Double Tap');
        //   },
        //   child: Icon(Icons.abc),
        // ),

        /// InkWell for response reactions with callback
        child: InkWell(
          onTap: () {
            print('Single Tap');
          },
          onDoubleTap: () {
            print('Double Tap');
          },
          child: Text('Test Text'),
        ),
      ),
    );
  }
}
