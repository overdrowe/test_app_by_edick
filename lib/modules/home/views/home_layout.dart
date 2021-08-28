import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/models/navigation/navigation_item.dart';
import 'package:test_app_by_auramel/modules/home/controllers/home_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/home_view_model.dart';
import 'package:test_app_by_auramel/modules/home/views/albums_screen.dart';
import 'package:test_app_by_auramel/modules/home/views/posts_screen.dart';
import 'package:test_app_by_auramel/modules/home/views/profile_screen.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class HomeLayout extends MVCWidget<HomeController, HomeViewModel> {
  const HomeLayout({
    required HomeController controller,
    required HomeViewModel viewModel,
  }) : super(
    viewModel: viewModel,
    controller: controller,
  );

  factory HomeLayout.factory() {
    return HomeLayout(
      controller: Get.find(),
      viewModel: Get.find(),
    );
  }

  @override
  Widget build(_) {
    return GetBuilder(
      init: viewModel,
      global: false,
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: _buildBottom(),
          body: IndexedStack(
            index: viewModel.currentIndex,
            children: _buildScreens(),
          ),
        );
      },
    );
  }

  Widget _buildBottom() {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildBottomNavigationItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBottomNavigationItems() {
    final List<Widget> result = [];

    viewModel.bottomNavigationItems.forEach((NavigationItem navigationItem) {
      final SvgPicture icon = (navigationItem.type != viewModel.currentType)
          ? SvgPicture.asset(
        navigationItem.iconUrl,
        height: 24,
        width: 24,
        color: Colors.green,
      )
          : SvgPicture.asset(
        navigationItem.iconUrl,
        height: 24,
        width: 24,
        color: Colors.deepOrange,
      );

      result.add(
        IconButton(
          icon: icon,
          onPressed: () => controller.changeCurrentType(navigationItem.type),
        ),
      );
    });

    return result;
  }

  List<Widget> _buildScreens() {
    return [
      AlbumsScreen.factory(),
      PostsScreen.factory(),
      ProfileScreen.factory(),
    ];
  }
}