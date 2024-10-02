import 'package:flutter/material.dart';
import 'package:ostad_flutter_seven_flutter/product.dart';
import 'package:ostad_flutter_seven_flutter/update_product_item.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title:  Text(product.productName),
      titleTextStyle: const TextStyle(color: Colors.redAccent),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Product Code: ${product.productCode}'),
           Text('Price: \$${product.unitPrice}'),
           Text('Unit: ${product.quantity}'),
           Text('Total Price: \$${product.totalPrice}'),
          const Divider(
            color: Colors.grey,
          ),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const UpdateProduct();
                  }));
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete'),
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.redAccent)),
              ),
            ],
          )
        ],
      ),
    );
  }
}