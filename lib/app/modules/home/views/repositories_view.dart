import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:git_hub/app/modules/home/controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoriesView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: controller.repoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (() {
              controller.launchUrl(index);
            }),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.folder,
                    color: Colors.orange[800],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      controller.repoList[index].name ?? 'Empty',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
