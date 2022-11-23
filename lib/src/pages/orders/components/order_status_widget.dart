import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({Key? key, required this.isOverdue, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(isActive: true, title: "Pedido Confirmado"),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          _StatusDot(
            isActive: true,
            title: "PIX estornado",
            backgroundColor: Colors.orange,
          )
        ] else if (isOverdue) ...[
          _StatusDot(
            isActive: true,
            title: "Pagamento PIX vencido",
            backgroundColor: Colors.red,
          )
        ] else ...[
          _StatusDot(isActive: currentStatus >= 2, title: "Pagamento"),
          _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 3, title: "Preparando"),
          _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 4, title: "Envio"),
          _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 5, title: "Entregue")
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot(
      {Key? key,
      required this.isActive,
      required this.title,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomColors.customSwatchCOlor),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchCOlor
                : Colors.transparent,
          ),
          child: isActive
              ? Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : SizedBox.shrink(),
        ),
        SizedBox(width: 5),
        //TITLE
        Expanded(
            child: Text(
          title,
          style: TextStyle(fontSize: 14),
        ))
      ],
    );
  }
}
