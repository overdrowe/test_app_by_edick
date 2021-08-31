import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/exceptions.dart';

class UserService extends GetxService {

  Future<void> login({
    required String login,
    required String password,
  }) async {
    if (login.trim() != 'admin' || password.trim() != '123456') {
      throw IncorrectLoginDataException('Failed login. Check the entered data.');
    }
  }
}