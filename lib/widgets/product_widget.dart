import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Item item;

  const ProductWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          item.image,
          height: 70,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\u20B9 ${item.price}",
          textScaler: const TextScaler.linear(1.5),
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
