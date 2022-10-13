import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3_tampil/app/data/student_provider.dart';
import 'package:get/get.dart';

class StudentFormController extends GetxController {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtKelas = TextEditingController();
  TextEditingController txtNim = TextEditingController();
  var isLoading = false.obs;

  void tambahData() {
    isLoading.value = true;
    String nama = txtNama.text;
    String kelas = txtKelas.text;
    String nim = txtNim.text;
    if (nama.isEmpty || kelas.isEmpty || nim.isEmpty) {
      Get.snackbar(
        "Error",
        "Data tidak boleh kosong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
      return;
    }
    //buat data json
    var studentJson = jsonEncode({
      "created_at": DateTime.now().toString(),
      "kelas": kelas,
      "nama": nama,
      "nim": int.parse(nim),
    });
    print(studentJson);
    //kirim data ke provider
    StudentProvider().postData(studentJson).then((value) {
      if (value.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Data berhasil ditambahkan",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error",
          value.statusText!,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      isLoading.value = false;
    });
  }
}
