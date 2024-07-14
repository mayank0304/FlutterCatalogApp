import 'package:flutter/material.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(
          children: [
            CartList().p32().expand(), // Pass _cart instance to CartList
            const Divider(),
            _CartTotal(), // Pass _cart instance to _CartTotal
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {


  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
          50.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet".text.make()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primaryColor,
            ),
            child: "Buy".text.white.make(),
          ).w24(context),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key,});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  
final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {
            // Implement removal from cart logic here
          },
          icon: const Icon(Icons.remove_circle_outline),
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
