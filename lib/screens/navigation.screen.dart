import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/bottom-navigation.controller.dart';

class NavigationScreen extends GetView<BottomNavigationController> {
  NavigationScreen({Key? key}) : super(key: key);

  @override
  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: Colors.white60,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              controller.changeScreen(index);
            },
            currentIndex: controller.currentIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.view_list_rounded),
                label: 'All Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded),
                label: 'Add New Task',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done_all),
                label: 'Completed Tasks',
              ),
            ],
          ),
        ));
  }
}
