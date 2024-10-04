import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productUnitPriceTEController =
      TextEditingController();
  final TextEditingController _productQuantityTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productImageTEController =
      TextEditingController();
  final TextEditingController _productTotalPriceTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildFormAddNewProduct(),
        ),
      ),
    );
  }

  Widget _buildFormAddNewProduct() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
                labelText: 'Product Name', hintText: 'Product Name'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid data';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productUnitPriceTEController,
            decoration: const InputDecoration(
                labelText: 'Unit Price', hintText: 'Unit Price'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid data';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productQuantityTEController,
            decoration: const InputDecoration(
                labelText: 'Quantity', hintText: 'Quantity'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid data';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: const InputDecoration(
                labelText: 'Product Code', hintText: 'Product Code'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid data';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productImageTEController,
            decoration: const InputDecoration(
                labelText: 'Product Image', hintText: 'Product Image'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid data';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productTotalPriceTEController,
            decoration: const InputDecoration(
                labelText: 'Total Price', hintText: 'Total Price'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid data';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          _inProgress
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: _onTapAddProductButton,
                  child: const Text('Add Product'))
        ],
      ),
    );
  }

  void _onTapAddProductButton() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "Img": _productImageTEController.text,
      "ProductCode": _productCodeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _productQuantityTEController.text,
      "TotalPrice": _productTotalPriceTEController.text,
      "UnitPrice": _productUnitPriceTEController.text
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      _clearTextFormField();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('New Product Added')));
      Navigator.of(context).pop(true);
    }
    _inProgress = false;
    setState(() {});
  }

  void _clearTextFormField() {
    _productTotalPriceTEController.clear();
    _productImageTEController.clear();
    _productCodeTEController.clear();
    _productQuantityTEController.clear();
    _productUnitPriceTEController.clear();
    _productNameTEController.clear();
  }

  @override
  void dispose() {
    _productTotalPriceTEController.dispose();
    _productImageTEController.dispose();
    _productCodeTEController.dispose();
    _productQuantityTEController.dispose();
    _productUnitPriceTEController.dispose();
    _productNameTEController.dispose();
    super.dispose();
  }
}
