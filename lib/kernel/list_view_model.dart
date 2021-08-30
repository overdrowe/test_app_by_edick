import 'dart:async';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';
import 'package:test_app_by_auramel/models/model.dart';

class ListViewModel<M extends Model> extends ViewModel {
  final RefreshController refreshController = RefreshController();

  bool isWithStaticData = false;

  List<M> _items = [];
  List<M> get items => List.from(_items);

  late Function fetchCallback;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int get length => _items.length;

  M getItem(int index) {
    if (index < 0 || index > _items.length) {
      throw Exception('Invalid index');
    }

    return _items[index];
  }

  void startLoading() {
    _isLoading = true;
    update();
  }

  void stopLoading() {
    _isLoading = false;
    update();
  }

  Future<void> fetchData() async {
    startLoading();
    _items = await fetchCallback();
    stopLoading();
  }

  Future<void> refreshData() async {
    await fetchData();
    update();

    refreshController.refreshCompleted();
  }
}