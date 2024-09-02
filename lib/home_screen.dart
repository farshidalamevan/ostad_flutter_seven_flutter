import 'package:flutter/material.dart';
import 'package:ostad_flutter_seven_flutter/responsive_builder.dart';
import 'deshBoardCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout());
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getSummarySection(crossAxisCount: 1, ratio: 2.7),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tablet'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getSummarySection(crossAxisCount: 2, ratio: 1.8),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desktop'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Row(
        children: [
          _buildDrawer(),
          Expanded(
              child: Column(
            children: [
              _getSummarySection(crossAxisCount: 3, ratio: 1.2),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('About'),
            ),
            ListTile(
              title: Text('Contact'),
            ),
            ListTile(
              title: Text('Terms'),
            ),
            ListTile(
              title: Text('Privacy'),
            ),
            ListTile(
              title: Text('Team'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSummarySection(
      {required int crossAxisCount, required double ratio}) {
    return GridView(
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: ratio,
          mainAxisExtent: 200),
      children: [
        deshBoardCard(),
        deshBoardCard(),
        deshBoardCard(),
        deshBoardCard(),
        deshBoardCard(),
        deshBoardCard(),
        deshBoardCard(),
      ],
    );
  }
}
