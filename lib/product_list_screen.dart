import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_flutter_seven_flutter/add_new_product.dart';
import 'package:ostad_flutter_seven_flutter/product.dart';
import 'package:ostad_flutter_seven_flutter/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Product List'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddNewProduct();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    print('Request');
    Uri uri = Uri.parse('http://152.42.163.176:2008/api/v1/ReadProduct');
    Response response = await get(uri);

    print(response);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
            id: item['_id'],
            productName: item['ProductName'],
            productCode: item['ProductCode'],
            productImage: item['Img'],
            quantity: item['Qty'],
            unitPrice: item['UnitPrice'],
            totalPrice: item['TotalPrice']);
        productList.add(product);
      }
    }
    setState(() {});
  }
}
