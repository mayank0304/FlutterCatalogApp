class Item {
  final String id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String imgage;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imgage});
}

final product = [
  Item(
      id: "mayank01",
      name: "Apple iPhone 15 Pro Max",
      desc:
          "Apple iPhone 15 Pro Max (256 GB) - Black Titanium, GAME-CHANGING A17 PRO CHIP, ADVANCED DISPLAY",
      price: 15009,
      color: "#000000",
      imgage: "https://m.media-amazon.com/images/I/81Os1SDWpcL._SX679_.jpg")
];
