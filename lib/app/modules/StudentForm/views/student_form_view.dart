import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_form_controller.dart';

class StudentFormView extends GetView<StudentFormController> {
  const StudentFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Siswa'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller.txtNama,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller.txtKelas,
                decoration: InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller.txtNim,
                decoration: InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: controller.isLoading.value
                  ? Column(
                      children: [CircularProgressIndicator()],
                    )
                  : ElevatedButton(
                      onPressed: controller.tambahData,
                      child: Text('Tambah'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
