import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:git_hub/app/modules/userName/controllers/user_name_controller.dart';
import 'package:git_hub/models/repo.dart';
import 'package:git_hub/models/user.dart';
import 'package:git_hub/networkOperations/operations.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  List<Repo> repoList = [];
  RxString name = ''.obs;
  RxInt id = 0.obs;
  RxString userName = ''.obs;
  RxString followersUrl = ''.obs;
  RxString followingUrl = ''.obs;
  RxString htmlUrl = ''.obs;
  var connectionStatus = 0.obs;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubScription;
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    initConnectivity().then((value) {
      if (connectionStatus.value != 0) {
        fetchRepoistory(UserNameController.userName);
        fethUser(UserNameController.userName);
      }
    });
    connectivitySubScription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> fetchRepoistory(String? userName) async {
    String response = await ApiBaseHelper.fetchRepository(userName: userName);
    var data = RepoList.fromjson(json.decode(response));
    for (int i = 0; i < data.repoList!.length; i++) {
      repoList.add(Repo(
          name: data.repoList![i].name,
          description: data.repoList![i].description,
          htmlUrl: data.repoList![i].htmlUrl));
    }
  }

  Future<void> fethUser(String? userNames) async {
    String response = await ApiBaseHelper.fetchUserData(userName: userNames);
    User user = User.fromJson(json.decode(response));
    id.value = user.id ?? 0;
    name.value = user.name ?? 'Empty';
    userName.value = user.login ?? 'Empty';
    htmlUrl.value = user.htmlUrl ?? 'Empty';
    followersUrl.value = user.followersUrl ?? 'Empty';
    followingUrl.value = user.followingUrl ?? 'Empty';
  }

  Future<void> launchUrl(int index) async {
    String url = 'https://github.com/${userName}/${repoList[index].name}';
    await launch(url, forceSafariVC: false);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateConnectionStatus(result);
  }

  updateConnectionStatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;

      default:
        Get.snackbar("Network Error", "Failed to get network connection");
        break;
    }
  }
}
