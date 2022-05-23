import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_hub/app/modules/home/bindings/home_binding.dart';
import 'package:git_hub/app/modules/home/views/home_view.dart';

class UserNameController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  static String? userName;
  //TODO: Implement UserNameController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  goToHomePage() {
    if (userNameController.text.isNotEmpty || userNameController.text != '') {
      Get.to(HomeView(), binding: HomeBinding());
    } else {
      Get.snackbar("Empty !", "Please provide user name",
          backgroundColor: Color.fromRGBO(227, 30, 57, 1));
    }
  }
}
