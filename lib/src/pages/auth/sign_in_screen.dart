import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/auth/components/custom_text_field.dart';
import 'package:quitanda/src/pages/auth/sign_up_screen.dart';
import 'package:quitanda/src/pages/base/base_screen.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: CustomColors.customSwatchCOlor,

      // LOGO SCREEN
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //LOGO
                  Text.rich(TextSpan(style: TextStyle(fontSize: 40), children: [
                    TextSpan(
                        text: "Green",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "grocer",
                        style: TextStyle(color: CustomColors.customContrastColor))
                  ])),

                  //CATEGORIES
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                        style: TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Lactíceneos'),
                          ],
                          isRepeatingAnimation: true,
                          pause: Duration.zero,
                        )),
                  ),
                ],
              )),

              //FORM LOGIN
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //INPUT EMAIL
                    CustomTextField(icon: Icons.mail, label: "Email"),

                    //INPUT PASSWORD
                    CustomTextField(
                        icon: Icons.lock, label: "Password", isSecret: true),

                    //ENTER BUTTON
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (c){
                                return BaseScreen();
                              })
                            );
                          },
                          child: const Text(
                            "Enter",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                        )),

                    //FORGOT PASSWORD
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  color: CustomColors.customContrastColor,
                                  fontSize: 14),
                            ))),

                    // DIVISOR
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: const Text("Or"),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),

                    // NEW USER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(

                          // CREATE ACCOUNT
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (c){
                                  return SignUpScreen();
                                })
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(fontSize: 14),
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 2, color: Colors.green),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
