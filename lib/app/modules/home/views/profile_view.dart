import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:git_hub/app/modules/home/controllers/home_controller.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            returnDatas(title: 'Id', value: controller.id.value.toString()),
            returnDatas(title: 'User Name', value: controller.userName.value),
            returnDatas(title: 'Name', value: controller.name.value),
            returnDatas(
                title: 'Followers Url', value: controller.followersUrl.value),
            returnDatas(
                title: 'Following Url', value: controller.followingUrl.value),
            returnDatas(title: 'HTML Url', value: controller.htmlUrl.value)
          ],
        ),
      ),
    );
  }

  Widget returnDatas({String? title, String? value}) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(title!),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            value!,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
