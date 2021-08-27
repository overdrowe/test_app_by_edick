import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';

abstract class Controller<V extends ViewModel> extends GetLifeCycle {

  final V viewModel;

  Controller(this.viewModel);
}