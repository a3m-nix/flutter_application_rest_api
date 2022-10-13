import 'package:get/get.dart';

import '../modules/StudentForm/bindings/student_form_binding.dart';
import '../modules/StudentForm/views/student_form_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_FORM,
      page: () => const StudentFormView(),
      binding: StudentFormBinding(),
    ),
  ];
}
