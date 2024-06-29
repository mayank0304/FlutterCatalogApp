import 'dart:convert';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/mydrawer.dart';
import 'package:catalog_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.product =
        List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
        setState(() {
          
        });
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Catalog App",
          ),
        ),
        drawer: const Mydrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.product.isNotEmpty)
          ? ListView.builder(
            itemCount: CatalogModel.product.length,
            itemBuilder: (context, index) {
              return ProductWidget(
                item: CatalogModel.product[index],
              );
            },
          )
          : 
          const Center(
            child: CircularProgressIndicator(),
            ),  
        ));
  }
}
