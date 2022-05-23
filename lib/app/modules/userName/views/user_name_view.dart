import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:git_hub/utils/validators.dart';

import '../controllers/user_name_controller.dart';

class UserNameView extends GetView<UserNameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: Validators.nameValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.userNameController,
              onChanged: (value) {
                UserNameController.userName = value;
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: .5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: .5),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: .5),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20))),
            ),
            GestureDetector(
              onTap: () {
                controller.goToHomePage();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.red),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
