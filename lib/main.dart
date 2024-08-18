/// TextField | Theme

import 'package:flutter/material.dart';

void main() {
  runApp(Module9Class1());
}

class Module9Class1 extends StatelessWidget {
  const Module9Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Intro App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey,
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.green.shade200),
          labelStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.yellow,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),

      /// For Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.green,
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.green.shade200),
          labelStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.yellow,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Name
            TextField(
              enabled: true,
              decoration: InputDecoration(
                label: Text('Name'),
                // labelStyle: TextStyle(fontSize: 16),
                icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.person),
                suffixIcon: TextButton(onPressed: () {}, child: Text('Search')),
                hintText: 'Enter Your Name',
                // hintStyle: TextStyle(color: Colors.green.shade200),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                //   borderSide: BorderSide(
                //     color: Colors.yellow,
                //   ),
                // ),
                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                //   borderSide: BorderSide(
                //     color: Colors.red,
                //   ),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                //   borderSide: BorderSide(color: Colors.blue, width: 2),
                // ),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            /// Password
            TextField(
              enabled: true,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('Password'),
                labelStyle: TextStyle(fontSize: 16),
                icon: Icon(Icons.password),
                hintText: 'Enter Your Password',
                hintStyle: TextStyle(color: Colors.green.shade200),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(),
            SizedBox(
              height: 16,
            ),

            /// Description
            TextField(
              textInputAction: TextInputAction.done,
              enabled: true,
              maxLines: 5,
              maxLength: 100,
              controller: _descriptionTextEditingController,
              onTap: () {
                print('Tapped on Description Field');
              },
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                label: Text('Description'),
                alignLabelWithHint: true,
                labelStyle: TextStyle(fontSize: 16),
                icon: Icon(Icons.description),
                hintText: 'Enter Your Description',
                hintStyle: TextStyle(color: Colors.green.shade200),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _descriptionTextEditingController.clear();
                // _descriptionTextEditingController.text = 'Clear';
              },
              child: Text('Clear Description'),
            )
          ],
        ),
      ),
    );
  }
}
