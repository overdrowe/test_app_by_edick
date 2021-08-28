import 'package:test_app_by_auramel/kernel/view_model.dart';
import 'package:test_app_by_auramel/models/navigation/navigation_item.dart';

class HomeViewModel extends ViewModel {
  List<NavigationItem> _bottomNavigationItems = NavigationItem.all();
  List<NavigationItem> get bottomNavigationItems => _bottomNavigationItems;

  NavigationItemType currentType = NavigationItemType.albums;


  int get currentIndex => _bottomNavigationItems.indexWhere((NavigationItem navigationItem) => (navigationItem.type == currentType));
}