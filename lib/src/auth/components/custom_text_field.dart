import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isObscure;

  const CustomTextField({Key? key, required this.icon, required this.label,  this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          obscureText: this.isObscure,
          decoration: InputDecoration(
              icon: Icon(this.icon),
              labelText: this.label,
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
        ));
  }
}