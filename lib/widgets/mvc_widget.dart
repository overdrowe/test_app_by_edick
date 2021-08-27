import 'package:flutter/material.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';

abstract class MVCWidget<C extends Controller, V extends ViewModel> extends StatelessWidget {

  final V viewModel;
  final C controller;

  const MVCWidget({
    required this.viewModel,
    required this.controller,
  });
}