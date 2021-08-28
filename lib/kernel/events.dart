import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class Event extends ChangeNotifier with GetxServiceMixin {}

class AlbumsScreenSelectedEvent extends Event {}
class PostsScreenSelectedEvent extends Event {}
class ProfileScreenSelectedEvent extends Event {}