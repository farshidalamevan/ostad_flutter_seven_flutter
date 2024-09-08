import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNumTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'First Number',
                  labelText: 'First Number',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _secondNumTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Second Number',
                  labelText: 'Second Number',
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    /// Another way of Condition
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: _onTapAdd, icon: const Icon(Icons.add)),
                  IconButton(
                      onPressed: _onTapSubtraction,
                      icon: const Icon(Icons.remove)),
                  IconButton(
                      onPressed: _onTapMultiplication,
                      icon: const Icon(Icons.clear)),
                  TextButton(onPressed: _onTapDivision, child: const Text('➗')),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'RESULT : ${_result.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapAdd() {
    if (_formKey.currentState!.validate()) {
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNum + secondNum;
      setState(() {});
    }
  }

  void _onTapSubtraction() {
    if (_formKey.currentState!.validate() == false) {
      /// Another way of Condition
      return;
    }
    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum - secondNum;
    setState(() {});
  }

  void _onTapMultiplication() {
    if (_formKey.currentState!.validate()) {
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNum * secondNum;
      setState(() {});
    }
  }

  void _onTapDivision() {
    if (_formKey.currentState!.validate()) {
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNum / secondNum;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _firstNumTEController.dispose();
    _secondNumTEController.dispose();
    super.dispose();
  }
}
