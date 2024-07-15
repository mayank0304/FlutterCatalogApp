import 'dart:convert';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_page/catalogheader.dart';
import 'package:catalog_app/widgets/home_page/cataloglist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response =
    //     await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.product = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart; 
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context,_, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
          backgroundColor: context.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ).badge(color: Vx.red500, size: 22, count: _cart.items.length, textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          // color: Vx.black 
        )),
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
