import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda/src/services/util_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  final UtilServices utilServices = UtilServices();

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order: ${order.id}",
                style: TextStyle(color: CustomColors.customSwatchCOlor),
              ),
              Text(
                utilServices.formatDateTime(order.cretedDateTime),
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // ITEMS LIST
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return _OrderItemWidget(
                                orderItem: orderItem,
                                utilServices: utilServices);
                          }).toList(),
                        ),
                      )),
                  //DIVISOR
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  //ORDER STATUS
                  Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverdue:
                            order.overdueDateTime.isBefore(DateTime.now()),
                      ))
                ],
              ),
            ),

            // AMOUNT
            Text.rich(
              TextSpan(style: TextStyle(fontSize: 20), children: [
                TextSpan(
                    text: "Total ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: utilServices.priceToCurrency(order.total))
              ]),
            ),

            //PAYMENT BUTTON
            Visibility(
              visible: order.status == "pending_payment",
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () {
                    showDialog(context: context, builder: (_){
                      return  PaymentDialog(order: order,);
                    });
                  },
                  icon: Image.asset(
                    'assets/app_images/pix.png',
                    height: 18,
                  ),
                  label: Text("QR CODE PIX")),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilServices utilServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
