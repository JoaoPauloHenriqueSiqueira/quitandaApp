import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/services/util_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({Key? key, required this.item}) : super(key: key);

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 3,
          shadowColor: Colors.grey.shade300,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // IMAGE
                Expanded(child: Image.asset(item.imgUrl)),

                // NAME
                Text(
                  item.itemName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                // PRICE
                Row(
                  children: [
                    Text(
                      utilServices.priceToCurrency(item.price),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchCOlor),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                    color: CustomColors.customSwatchCOlor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20))),
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
