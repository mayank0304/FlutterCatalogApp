class CatalogModel {
  static final product = [
    Item(
        id: 1,
        name: "Apple iPhone 15 Pro Max",
        desc:
            "Apple iPhone 15 Pro Max (256 GB) - Black Titanium",
        price: 150090,
        color: "#000000",
        image: "https://m.media-amazon.com/images/I/81Os1SDWpcL._SX679_.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
