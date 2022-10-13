import 'package:get/get.dart';

import '../controllers/student_form_controller.dart';

class StudentFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentFormController>(
      () => StudentFormController(),
    );
  }
}
