import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.productId});

  final String productId;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
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
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: _inProgress
            ? const Center(child: RefreshProgressIndicator())
            : Padding(
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
          TextField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
                labelText: 'Product Name', hintText: 'Product Name'),
          ),
          TextField(
            controller: _productUnitPriceTEController,
            decoration: const InputDecoration(
                labelText: 'Unit Price', hintText: 'Unit Price'),
          ),
          TextField(
            controller: _productQuantityTEController,
            decoration: const InputDecoration(
                labelText: 'Quantity', hintText: 'Quantity'),
          ),
          TextField(
            controller: _productCodeTEController,
            decoration: const InputDecoration(
                labelText: 'Product Code', hintText: 'Product Code'),
          ),
          TextField(
            controller: _productImageTEController,
            decoration: const InputDecoration(
                labelText: 'Product Image', hintText: 'Product Image'),
          ),
          TextField(
            controller: _productTotalPriceTEController,
            decoration: const InputDecoration(
                labelText: 'Total Price', hintText: 'Total Price'),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
              onPressed: _onTapUpdateProductButton,
              child: const Text('Update Product'))
        ],
      ),
    );
  }

  void _onTapUpdateProductButton() {
    if (_formKey.currentState!.validate()) {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.productId}');
    Map<String, dynamic> requestBody = {
      "Img": _productImageTEController.text,
      "ProductCode": _productCodeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _productQuantityTEController.text,
      "TotalPrice": _productTotalPriceTEController.text,
      "UnitPrice": _productUnitPriceTEController.text
    };

    Response response = await post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      clearTextFieldWindow();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Product Updated')));
      Navigator.of(context).pop(true);
    }

    _inProgress = false;
    setState(() {});
  }

  void clearTextFieldWindow() {
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
