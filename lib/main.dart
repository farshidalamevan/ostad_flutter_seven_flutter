/// Navigator Push | Pop | PushReplacement | PushAndRemoveUntil

import 'package:flutter/material.dart';

void main() {
  runApp(const Module13Class4());
}

class Module13Class4 extends StatelessWidget {
  const Module13Class4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Navigator PUSH
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Profile(
                      Username: 'Niki',
                    );
                  }));
                },
                child: const Text('Go to Profile')),

            ElevatedButton(
                onPressed: () {
                  /// Navigator PUSH short-cut
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting()));
                },
                child: const Text('Go to Settings')),
            ElevatedButton(
                onPressed: () {
                  /// Navigator PUSH short-cut
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const About(
                                isValidUser: false,
                              )));
                },
                child: const Text('Go to About'))
          ],
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Profile(
                      Username: 'Evan',
                    );
                  }));
                },
                child: const Text('Go to Profile 2')),

            /// Navigator POP
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key, required this.Username});

  final String Username;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  /// Navigator POP
                  Navigator.pop(context);
                },
                child: const Text('Back')),
            ElevatedButton(
                onPressed: () {
                  /// Navigator PushReplacement
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const Setting();
                  }));
                },
                child: const Text('Back 2')),
            ElevatedButton(
                onPressed: () {
                  /// Navigator pushAndRemoveUntil
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (value) => false,
                  );
                },
                child: const Text('Back to Home')),

            /// Data pass way for StatefulWidget
            Text(widget.Username),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key, required this.isValidUser});

  final bool isValidUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Profile(
                      Username: 'Yashia',
                    );
                  }));
                },
                child: const Text('Go to Profile')),

            /// Data pass way to StatelessWidget
            Text('User: $isValidUser'),
          ],
        ),
      ),
    );
  }
}
