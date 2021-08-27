import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/app/controllers/app_controller.dart';
import 'package:test_app_by_auramel/modules/app/view_models/app_view_model.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/auth/login',
        getPages: [],
      ),
    );
  }

}