import 'package:get/get.dart';

class StudentProvider extends GetConnect {
  Future<Response<dynamic>> getAll() async {
    return await get(
        'https://materi-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/students.json');
  }

  Future<Response<dynamic>> postData(var studentJson) async {
    return await post(
        'https://materi-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/students.json',
        studentJson);
  }
}
