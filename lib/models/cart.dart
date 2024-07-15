import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
  
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
  
}
