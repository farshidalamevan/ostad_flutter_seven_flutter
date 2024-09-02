/// Responsive Design || Responsive Builder || Screen Utils


import 'package:flutter/material.dart';
import 'package:ostad_flutter_seven_flutter/home_screen.dart';

void main() {
  runApp(RSAapp());
}

class RSAapp extends StatelessWidget {
  const RSAapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
