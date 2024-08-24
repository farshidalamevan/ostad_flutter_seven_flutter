/// MediaQuery | OrientationBuilder | Wrap | LayoutBuilder

import 'package:flutter/material.dart';

void main() {
  runApp(Module11Class1());
}

class Module11Class1 extends StatelessWidget {
  const Module11Class1({super.key});

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
    /// MediaQuery
    MediaQueryData mediaQuery = MediaQuery.of(context);
    print(mediaQuery.size);
    print(mediaQuery.size.aspectRatio);
    print(mediaQuery.size.flipped);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.grey,
      ),

      /// OrientationBuilder
      // body: OrientationBuilder(
      //   builder: (context, Orientation orientation) {
      //     if (orientation == Orientation.portrait) {
      //       return Column(
      //         children: [
      //           /// Wrap
      //           Wrap(
      //             alignment: WrapAlignment.center,
      //             crossAxisAlignment: WrapCrossAlignment.center,
      //             spacing: 16,
      //             children: [
      //               Text('1st line testing'),
      //               Text('2nd line testing'),
      //               Text('3rd line testing'),
      //               Text('4rd line testing'),
      //               Text('5th line testing'),
      //             ],
      //           ),
      //           Text(orientation.name)
      //         ],
      //       );
      //     } else {
      //       return Text('Too big Screen and Landsscap');
      //     }
      //   },
      // ),

      /// LayoutBuilder
      body: Center(
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            if (constraints.maxWidth < 640) {
              return Text('This is Mobile Apps',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold));
            } else if (constraints.maxWidth > 640 &&
                constraints.maxWidth < 1008) {
              return Text('This is Tablet Apps',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold));
            } else {
              return Text('This is Laptop/Desktop Software',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.green,
                      fontWeight: FontWeight.bold));
            }
          },
        ),
      ),
    );
  }
}
