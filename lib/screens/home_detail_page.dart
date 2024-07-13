import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  // final Item catalog;
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var catalog = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          // buttonPadding: ,
          children: [
            "\u20B9 ${catalog.price}"
                .text
                .xl2
                .color(context.accentColor)
                .make(),
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: context.primaryColor),
                    onPressed: () {},
                    child: "Add to cart".text.lg.white.make())
                .wh(150, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text
                          .color(context.accentColor)
                          .xl4
                          .bold
                          .center
                          .make(),
                      5.heightBox,
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .center
                          .make(),
                      15.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate."
                          .text
                          .textStyle(context.captionStyle)
                          
                          .make()
                    ],
                  ).p64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
