import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            icon: Icons.email,
            label: "Email",
            initialValue: app_data.user.email,
            readOnly: true,
          ),
          CustomTextField(
              icon: Icons.person,
              label: "Name",
              initialValue: app_data.user.name,
              readOnly: true),
          CustomTextField(
              icon: Icons.phone,
              label: "Phone",
              initialValue: app_data.user.phone,
              readOnly: true),
          CustomTextField(
              icon: Icons.file_copy,
              label: "CPF",
              isSecret: true,
              initialValue: app_data.user.cpf,
              readOnly: true),
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: updatePassword,
                  child: Text("Update password")))
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Update your password",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CustomTextField(
                        icon: Icons.lock,
                        label: "Current Password",
                        isSecret: true,
                      ),
                      CustomTextField(
                          icon: Icons.lock_outline,
                          label: "New Password",
                          isSecret: true),
                      CustomTextField(
                          icon: Icons.lock_outline,
                          label: "Confirmation",
                          isSecret: true),
                      SizedBox(
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {},
                              child: Text("Update Password")))
                    ],
                  ),
                ),
                Positioned(top:5, right:5, child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },icon: Icon(Icons.close),))
              ],
            ),
          );
        });
  }
}
