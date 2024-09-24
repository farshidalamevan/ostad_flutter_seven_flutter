import 'package:flutter/material.dart';

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

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildFormAddNewProduct(),
      ),
    );
  }

  Widget _buildFormAddNewProduct() {
    return Form(
        key: _formkey,
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
                onPressed: _onTapAddProductButton, child: const Text('Add Product'))
          ],
        ),
      );
  }

  void _onTapAddProductButton() {}

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
