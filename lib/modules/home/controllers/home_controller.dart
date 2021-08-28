import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/kernel/events.dart';
import 'package:test_app_by_auramel/models/navigation/navigation_item.dart';
import 'package:test_app_by_auramel/modules/home/view_models/home_view_model.dart';

class HomeController extends Controller<HomeViewModel> {

  final AlbumsScreenSelectedEvent _albumsScreenSelectedEvent = Get.find();
  final PostsScreenSelectedEvent _postsScreenSelectedEvent = Get.find();
  final ProfileScreenSelectedEvent _profileScreenSelectedEvent = Get.find();

  // final CreateOrderEvent _createOrderEvent = Get.find();

  HomeController(HomeViewModel viewModel): super(viewModel);

  @override
  void onInit() {
    _albumsScreenSelectedEvent.addListener(_albumsScreenSelectedEventCallback);
    _postsScreenSelectedEvent.addListener(_postsScreenSelectedEventCallback);
    _profileScreenSelectedEvent.addListener(_profileScreenSelectedEventCallback);

    super.onInit();
  }

  @override
  void onClose() {
    _albumsScreenSelectedEvent.removeListener(_albumsScreenSelectedEventCallback);
    _postsScreenSelectedEvent.removeListener(_postsScreenSelectedEventCallback);
    _profileScreenSelectedEvent.removeListener(_profileScreenSelectedEventCallback);

    super.onClose();
  }

  Future<void> changeCurrentType(NavigationItemType type) async {

    viewModel.currentType = type;
    viewModel.update();
  }

  // Future<void> onCreateClicked() async {
  //   if (viewModel.currentType == NavigationItemType.albums) {
  //     _createOrderEvent.emit();
  //   }
  // }

  Future<void> _albumsScreenSelectedEventCallback() async {
    changeCurrentType(NavigationItemType.albums);
  }

  Future<void> _postsScreenSelectedEventCallback() async {
    changeCurrentType(NavigationItemType.posts);
  }

  Future<void> _profileScreenSelectedEventCallback() async {
    changeCurrentType(NavigationItemType.profile);
  }
}