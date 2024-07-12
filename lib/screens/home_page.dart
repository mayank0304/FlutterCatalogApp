import 'dart:convert';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/mydrawer.dart';
import 'package:catalog_app/widgets/theme.dart';
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
      backgroundColor: Mytheme.creamColor,
      body: SafeArea(
        child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CatalogHeader(),
                (CatalogModel.product.isNotEmpty)
                    ? const CatalogList().expand()
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Vx.m12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl5.bold.color(Mytheme.darkBluishColor).make(),
          "Trending Projects".text.xl2.make(),
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.product.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.product[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(catalog.image)
            .box
            .rounded
            .p8
            .color(Mytheme.creamColor)
            .make()
            .p16()
            .w40(context),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.color(Mytheme.darkBluishColor).lg.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: ,
              children: [
                catalog.price.text.make(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Mytheme.darkBluishColor),
                    onPressed: () {},
                    child: "Buy".text.white.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(175).make().py16();
  }
}
