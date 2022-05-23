import 'package:get/get.dart';

import 'package:git_hub/app/modules/home/bindings/home_binding.dart';
import 'package:git_hub/app/modules/home/views/home_view.dart';
import 'package:git_hub/app/modules/userName/bindings/user_name_binding.dart';
import 'package:git_hub/app/modules/userName/views/user_name_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USER_NAME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_NAME,
      page: () => UserNameView(),
      binding: UserNameBinding(),
    ),
  ];
}
