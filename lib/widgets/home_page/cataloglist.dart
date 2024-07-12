import 'package:catalog_app/models/catalog.dart';
// import 'package:catalog_app/screens/home_detail_page.dart';
import 'package:catalog_app/utils/routes.dart';
// import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.product.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.product[index];
          return InkWell(
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(catalog: catalog))),
            onTap: () => Navigator.of(context).pushNamed(MyRoutes.homeDetailRoute, arguments: catalog),
            child: CatalogItem(catalog: catalog));
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
              .box
              .rounded
              .p8
              .color(Mytheme.creamColor)
              .make()
              .p16()
              .w32(context),
        ),
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
                    child: "Add to cart".text.white.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    ).px4().py4()).white.rounded.make().py16();
  }
}
