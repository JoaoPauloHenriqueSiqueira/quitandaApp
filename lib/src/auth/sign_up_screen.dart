import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';
import 'package:quitanda/src/folder/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final phoneFormatter = MaskTextInputFormatter(
      mask: "## # ####-####", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchCOlor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(icon: Icons.email, label: "Email"),
                        CustomTextField(
                            icon: Icons.lock,
                            label: "Password",
                            isSecret: true),
                        CustomTextField(icon: Icons.person, label: "Name"),
                        CustomTextField(icon: Icons.phone, label: "Phone", inputFormatters: [phoneFormatter],),
                        CustomTextField(icon: Icons.file_copy, label: "CPF",inputFormatters: [cpfFormatter],),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Create account",
                                  style: TextStyle(fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                    child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Colors.white,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
