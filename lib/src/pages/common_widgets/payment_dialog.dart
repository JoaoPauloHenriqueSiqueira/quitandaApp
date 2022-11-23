import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/services/util_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  final UtilServices utilServices = new UtilServices();

  PaymentDialog({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // CONTENT
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "PIX Payment",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                // CODE QR
                QrImage(
                  data: "123456789asssaa0",
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                // VALID_AT
                Text(
                  "Expiration date: ${utilServices.formatDateTime(order.overdueDateTime)}",
                  style: TextStyle(fontSize: 12),
                ),

                // AMOUNT
                Text(
                  "Amount: ${utilServices.priceToCurrency(order.total)}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),

                // COPY AND PASTE
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(width: 2, color: Colors.green),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.copy,
                      size: 15,
                    ),
                    label: Text(
                      "Copy PIX code",
                      style: TextStyle(fontSize: 13),
                    ))
              ],
            ),
          ),

          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ))
        ],
      ),
    );
  }
}
