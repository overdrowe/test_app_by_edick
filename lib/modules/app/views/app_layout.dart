import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/app/controllers/app_controller.dart';
import 'package:test_app_by_auramel/modules/app/view_models/app_view_model.dart';
import 'package:test_app_by_auramel/modules/auth/bindings/login_bindings.dart';
import 'package:test_app_by_auramel/modules/auth/views/login_screen.dart';
import 'package:test_app_by_auramel/modules/home/bindings/home_bindings.dart';
import 'package:test_app_by_auramel/modules/home/views/albums_screen.dart';
import 'package:test_app_by_auramel/modules/home/views/home_layout.dart';
import 'package:test_app_by_auramel/modules/home/views/posts_screen.dart';
import 'package:test_app_by_auramel/modules/home/views/profile_screen.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class Application extends MVCWidget<AppController, AppViewModel> {
  Application({
    required AppController controller,
    required AppViewModel viewModel,
  }): super(
    controller: controller,
    viewModel: viewModel,
  );

  factory Application.factory() {
    return Application(
      controller: Get.find(),
      viewModel: Get.find(),
    );
  }

  @override
  Widget build(_) {
    final List<GetPage> pages = [
      GetPage(
        name: '/home',
        page: () => HomeLayout.factory(),
        binding: HomeBindings(),
      ),
      GetPage(
        name: '/auth/login',
        page: () => LoginScreen.factory(),
        binding: LoginBindings(),
      ),
      GetPage(
        name: '/home/albums',
        page: () => AlbumsScreen.factory(),
      ),
      GetPage(
        name: '/home/posts',
        page: () => PostsScreen.factory(),
      ),
      GetPage(
        name: '/home/profile',
        page: () => ProfileScreen.factory(),
      ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        getPages: pages,
      ),
    );
  }
}