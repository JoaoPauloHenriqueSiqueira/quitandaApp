import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/components/cart_tile.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTab extends StatefulWidget {
  CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilServices utilService = UtilServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);
      utilService.showToast(message: "Product ${cartItem.item.itemName} removed from cart");
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: app_data.cartItems.length,
            itemBuilder: (_, index) {
              return CartTile(
                  cartItem: app_data.cartItems[index],
                  remove: removeItemFromCart);
            },
          )),
          Container(
            padding: EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Total amount", style: TextStyle(fontSize: 12)),
                Text(
                  utilService.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customSwatchCOlor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: CustomColors.customSwatchCOlor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () async{
                        bool? result = await showOrderConfirmation();
                        if(result ?? false){
                          showDialog(context: context, builder: (_){
                            return  PaymentDialog(order: app_data.orders.first,);
                          });
                        }else{
                          utilService.showToast(message: "Order not finished");
                        }
                      },
                      child: Text(
                        "Finish",
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text("Confirm"),
            content: Text("Do you want to finalize your order?"),
            actions: [
              TextButton(
                onPressed: () {

                  Navigator.of(context).pop(false);
                },
                child: Text("No"),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.of(context).pop(true);

                  },
                  child: Text("Yes"))
            ],
          );
        });
  }
}
