import 'package:flutter/material.dart';
import 'package:git_hub/app/modules/home/views/profile_view.dart';
import 'package:git_hub/app/modules/home/views/repositories_view.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Colors.black,
            bottom: TabBar(tabs: [
              Tab(
                text: 'Profile',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Repositories',
                icon: Icon(Icons.folder),
              )
            ]),
          ),
          body: Obx(() => controller.connectionStatus == 0
              ? Center(
                  child: Text('No Connection'),
                )
              : TabBarView(children: [ProfileView(), RepositoriesView()]))),
    );
  }
}
