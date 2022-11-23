import 'package:quitanda/src/models/cart_item_model.dart';

class OrderModel {
  late String id;
  late DateTime cretedDateTime;
  late DateTime overdueDateTime;
  late List<CartItemModel> items;
  late String status;
  late String copyAndPaste;
  late double total;

  OrderModel({
   required this.id,
   required this.cretedDateTime,
   required this.overdueDateTime,
   required this.items,
   required this.status,
   required this.copyAndPaste,
   required this.total,
  });

}
