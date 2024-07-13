/// Column, Row, Scroll View (SingleChildScrollView)

import 'package:flutter/material.dart';

void main() {
  runApp(Module8Class1());
}

class Module8Class1 extends StatelessWidget {
  const Module8Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Module 8 Class 1',
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      /// Column
      // body: Column(
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Text('Data 1'),
      //     Text('Data 2'),
      //     Text('Data 3'),
      //     Text('Data 4'),
      //     Text('Data 5'),
      //     ElevatedButton(
      //       onPressed: () {},
      //       child: Text('Click Here'),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.access_alarm),
      //     ),
      //     Icon(Icons.access_time_filled_outlined),
      //   ],
      // ),

      /// SingleChildScrollView , ROW
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         Text('Data 1\nfrom Evan'),
      //         Text('Data 2'),
      //         Text('Data 3'),
      //         Text('Data 4'),
      //         Text('Data 5'),
      //         Text('Data 6'),
      //         Text('Data 7'),
      //         Text('Data 8'),
      //         Text('Data 9'),
      //         Text('Data 10'),
      //         Text('Data 11'),
      //         Text('Data 10'),
      //         Text('Data 11'),
      //         Text('Data 12'),
      //         Text('Data 13'),
      //         Text('Data 14'),
      //         Text('Data 15'),
      //
      //       ]),
      // ),

      /// Row, Column in same body with Scroll View
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [Text('Column 1')],
            ),
            Column(
              children: [
                Text('Column 2'),
                Row(
                  children: [
                    Text('Column 2 Row 1'),
                    Text('Column 2 Row 2'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text('Column 3'),
                Text('Column 3'),
                Text('Column 3'),
                Text('Column 3'),
                Text('Column 3'),
                Text('Column 3'),
              ],
            ),
            Column(
              children: [Text('Column 4')],
            ),
            Column(
              children: [
                Text('Column 5'),
                Text('Column 5'),
                Text('Column 5'),
                Text('Column 5'),
              ],
            ),
            Column(
              children: [
                Text('Column 6'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
