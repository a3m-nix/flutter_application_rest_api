import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.onTapButtonTambah(),
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => controller.getStudents(),
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.white70,
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.listData.length,
                itemBuilder: (BuildContext context, int index) {
                  var list = controller.listData[index];
                  //print(list);
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 1),
                    child: ListTile(
                      title: Text(list['nama']),
                      subtitle: Text(list['kelas']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
