import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return OrderTile(
              order: app_data.orders[index],
            );
            //Text(app_data.orders[index].id)
          },
          separatorBuilder: (_, index) {
            return SizedBox(height: 10);
          },
          itemCount: app_data.orders.length),
    );
  }
}
