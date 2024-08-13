/// Buttons (Dialog,Bottom) | Textfield | Container

import 'package:flutter/material.dart';

void main() {
  runApp(Module8Class3());
}

class Module8Class3 extends StatelessWidget {
  const Module8Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              // color: Colors.deepPurple,
              // padding: EdgeInsets.all(16),
              // margin: EdgeInsets.all(16),
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                border: Border.all(color: Colors.yellow, width: 5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Bangladesh2.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.green.withOpacity(1), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(3, 3), // Offset in X and Y directions
                  ),
                ],
              ),
            ),
            Text(
              'Bangladesh 2.0',
              style: TextStyle(color: Colors.black),
            ),
            Container(
              width: 100,
              height: 100,
              // color: Colors.deepPurple,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/Bangladesh2.jpg'),
              )),
            ),

            /// Dialog Button

            ElevatedButton(
              onPressed: () {
                // showAboutDialog(
                //   context: context,
                //   applicationName: 'Sample',
                //   applicationVersion: '1.10.1.1',
                //   children: [
                //     Text('Sample Text'),
                //   ],
                // );
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.black54,
                  builder: (ctx) {
                    return AlertDialog(
                        title: Text('Freedom of Bangladesh'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("A look at Bangladesh's new  chapter."),
                            Text('\n'),
                            Text(
                                'Again invent new independent day of Bangladesh 5th August. The biggest history of Bangladesh 2024'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          )
                        ],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white);
                  },
                );
              },
              child: Text('Dialog'),
            ),
            SizedBox(height: 20),

            /// Bottom Sheet Button

            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  // backgroundColor: Colors.white54,
                  // barrierColor: Colors.black54,
                  // isDismissible: false,
                  // enableDrag: false,
                  context: context,
                  builder: (ctx) {
                    return SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Title'),
                          ),
                          Divider(),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                    'Bangladesh, to the east of India on the Bay of Bengal,  is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with Eastern India, is home to the royal Bengal tiger. ― Google \n \n 13-Aug-24'),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
