/// Flexible | Expanded | AspectRatio

import 'package:flutter/material.dart';

void main() {
  runApp(Module11Class3());
}

class Module11Class3 extends StatelessWidget {
  const Module11Class3({super.key});

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
    MediaQuery.sizeOf(context).width;
    MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            /// Flexible
            // Flexible(
            //   flex: 2,
            //   child: Container(
            //     color: Colors.red,
            //     width: 200,
            //   ),
            // ),
            // Flexible(
            //   fit: FlexFit.loose,
            //   flex: 1,
            //   child: Container(
            //     color: Colors.pink,
            //     height: 100,
            //     width: 200,
            //   ),
            // ),

            /// Expanded (Shorter version of Flexible)
            // Expanded(
            //   child: Container(
            //     color: Colors.pink,
            //     height: 100,
            //     width: 200,
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //     color: Colors.orange,
            //     width: 200,
            //   ),
            // ),

            /// AspectRatio
            // AspectRatio(
            //   aspectRatio: 5 / 5,
            //   child: Container(
            //     color: Colors.pink,
            //   ),
            // ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                  child: Text(
                constraints.maxWidth.toString(),
              ));
            })
          ],
        ),
      ),
    );
  }
}
