/// ListView | SizedBox | Gridview | Divider | ListTile

import 'package:flutter/material.dart';

void main() {
  runApp(Module8Class2());
}

class Module8Class2 extends StatelessWidget {
  const Module8Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Module 8 Class 2',
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> friendList = [
    'Priam',
    'Rahat',
    'Sanji',
    'Walid',
    'Anan',
    'Onim',
    'Rakib',
    'Eashad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      /// ListView | SizedBox
      // body: ListView(
      //   children: [
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 1'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 2'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 3'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 4'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 5'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 6'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 7'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 8'),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Center(
      //         child: Text('Box 9'),
      //       ),
      //     ),
      //   ],
      // ),

      /// ListView another example
      // body: ListView.builder(
      //   itemCount: 100,
      //   itemBuilder: (context, index) {
      //     return SizedBox(
      //       width: 100,
      //       height: 100,
      //       child: Center(
      //         child: Text('BOX $index '),
      //       ),
      //     );
      //   },
      // )

      /// ListView another example from get data any API or third party database
      // body: ListView.builder(
      //   itemCount: friendList.length,
      //   itemBuilder: (context, index) {
      //     return Text(friendList[index]);
      //   },
      // ),

      /// GridView
      // body: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       mainAxisSpacing: 10,
      //       crossAxisSpacing: 10,
      //       childAspectRatio: 1.1,
      //     ),
      //     itemCount: friendList.length,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: [
      //           Text(index.toString()),
      //           Text(friendList[index], ),
      //         ],
      //       );
      //     }),

      /// Divider | ListTile
      body: ListView.separated(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(friendList[index]),
            tileColor: Colors.white54,
            subtitle: Text('School Friend'),
            trailing: Icon(Icons.school_outlined),
            leading: Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
            titleTextStyle: TextStyle(
              color: Colors.red,
              fontSize: 25,
            ),
            iconColor: Colors.black,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 15,
            color: Colors.black12,
            thickness: 2,
            endIndent: 5,
          );
        },
      ),
    );
  }
}
