import 'dart:convert';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_page/catalogheader.dart';
import 'package:catalog_app/widgets/home_page/cataloglist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
    CatalogModel.product = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
        backgroundColor: context.primaryColor,
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      // drawer: const Mydrawer(),
      body: SafeArea(
        child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CatalogHeader(),
                (CatalogModel.product.isNotEmpty)
                    ? const CatalogList().py16().expand()
                    : const CircularProgressIndicator().centered().expand()
              ],
            )),
      ),

      // appBar: AppBar(
      //   title: const Text(
      //     "Catalog App",
      //   ),
      // ),
      // drawer: const Mydrawer(),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.product.isNotEmpty)
      //       // ? ListView.builder(
      //       //   itemCount: CatalogModel.product.length,
      //       //   itemBuilder: (context, index) {
      //       //     return ProductWidget(
      //       //       item: CatalogModel.product[index],
      //       //     );
      //       //   },
      //       // )
      //       ? GridView.builder(
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 16,
      //               crossAxisSpacing: 10
      //               ),
      //           itemBuilder: (context, index) {
      //             final item = CatalogModel.product[index];
      //             return Card(
      //               clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: GridTile(
      //                   header: Text(item.name),
      //                   footer: Text(item.price.toString()),
      //                   child: Image.network(item.image),
      //                 ));
      //           },
      //           itemCount: CatalogModel.product.length,
      //         )
      //       : const Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // )
    );
  }
}
