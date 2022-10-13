import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<Response<dynamic>> getAll() async {
    return await get('https://reqres.in/api/users');
  }
}
