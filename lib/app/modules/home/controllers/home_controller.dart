import 'package:flutter_application_3_tampil/app/data/student_provider.dart';
import 'package:flutter_application_3_tampil/app/data/user_provider.dart';
import 'package:flutter_application_3_tampil/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listData = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getStudents();
    getUsers();
    super.onInit();
  }

  void onTapButtonTambah() {
    Get.toNamed(Routes.STUDENT_FORM);
  }

  void getStudents() {
    listData.clear();
    isLoading.value = true;
    StudentProvider().getAll().then((Response response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.body;
        jsonResponse.forEach((key, value) {
          Map studentModel = {
            'nama': value['nama'],
            'kelas': value['kelas'],
          };
          listData.add(studentModel);
        });
      } else {
        Get.snackbar("Error", response.statusText!);
      }
      isLoading.value = false;
    });
  }

  void getUsers() {
    isLoading.value = true;
    UserProvider().getAll().then((Response response) {
      final Map jsonResponse = response.body;
      var data = jsonResponse['data'];
      var page = jsonResponse['page'];
      var perPage = jsonResponse['per_page'];
      var total = jsonResponse['total'];
      var totalPage = jsonResponse['total_page'];
      for (var element in data) {
        Map studentModel = {
          'nama': element['email'],
          'kelas': element['first_name'],
        };
        listData.add(studentModel);
      }
      isLoading.value = false;
    });
  }
}
