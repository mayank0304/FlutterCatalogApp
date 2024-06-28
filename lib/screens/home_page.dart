import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/mydrawer.dart';
import 'package:catalog_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.product[0]);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Catalog App",
          ),
        ),
        drawer: const Mydrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(itemCount: dummyList.length,
          itemBuilder:(context, index) {
            return ProductWidget(item: dummyList[index],);
          },),
        )
    );
  }
}
