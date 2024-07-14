import 'package:catalog_app/models/catalog.dart';

class CartModel {
  // Singleton pattern
  static final CartModel _cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => _cartModel;

  // The catalog field
  CatalogModel _catalog = CatalogModel();

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items {
    
    return _itemIds.map((id) => _catalog.getById(id)).toList();
  }

  // Get total price
  num get totalPrice {
   
    return items.fold(0, (total, current) => total + current.price);
  }

  // Add Item
  void add(Item item) {
      _itemIds.add(item.id);
   
  }

  // Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}