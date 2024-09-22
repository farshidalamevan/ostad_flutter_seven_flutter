import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoAddTEController =
      TextEditingController(text: '1');

  List<WaterTracker> waterTrackerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWaterTrackerCounter(),
          Expanded(
            child: _buildWaterTrackerListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterTrackerListView() {
    return ListView.separated(
      itemCount: waterTrackerList.length,
      itemBuilder: (context, index) {
        final WaterTracker waterTracker = waterTrackerList[index];
        return ListTile(
          title: Text(
              '${waterTracker.dateTime.hour}:${waterTracker.dateTime.minute}'),
          subtitle: Text(
              '${waterTracker.dateTime.day}-${waterTracker.dateTime.month}-${waterTracker.dateTime.year}'),
          leading: CircleAvatar(child: Text('${waterTracker.noOfGlass}')),
          trailing: IconButton(
            onPressed: () => _onTapDeleteButton(index),
            icon: const Icon(Icons.delete),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget _buildWaterTrackerCounter() {
    return Column(
      children: [
        Text(
          getTotalGlassCount().toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text("Glass's"),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: _glassNoAddTEController,
              ),
            ),
            TextButton(
                onPressed: _addNewWaterTrack,
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _clearAllData,
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
              foregroundColor: WidgetStatePropertyAll(Colors.white)),
          child: const Text(
            'RESET',
            style: TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTracker t in waterTrackerList) {
      counter += t.noOfGlass;
    }
    return counter;
  }

  void _addNewWaterTrack() {
    if (_glassNoAddTEController.text.isEmpty) {
      _glassNoAddTEController.text = '1';
    }

    final int noOfGlass = int.tryParse(_glassNoAddTEController.text) ?? 1;
    WaterTracker waterTracker = WaterTracker(
      noOfGlass: noOfGlass,
      dateTime: DateTime.now(),
    );
    waterTrackerList.add(waterTracker);
    setState(() {});
  }

  void _clearAllData() {
    waterTrackerList.clear();
    setState(() {});
  }

  void _onTapDeleteButton(int index) {
    waterTrackerList.removeAt(index);
    setState(() {});
  }
}

class WaterTracker {
  final int noOfGlass;
  final DateTime dateTime;

  WaterTracker({required this.noOfGlass, required this.dateTime});
}
