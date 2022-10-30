import 'package:quitanda/src/models/item_model.dart';

class CartItemModel {
  late ItemModel item;
  late int quantity;

  CartItemModel({required this.item, required this.quantity});

  double totalPrice() {
    return item.price * quantity;
  }
}
