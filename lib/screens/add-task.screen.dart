import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/tasks.controller.dart';

import '../controller/bottom-navigation.controller.dart';

class AddNewTask extends GetView<TasksController> {
  AddNewTask({Key? key}) : super(key: key);

  @override
  final TasksController controller = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController navigationController =
        Get.put(BottomNavigationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.title,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: controller.description,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.createNewTask();
                    Get.snackbar(
                      'Task Added',
                      'The ${controller.title.text} task was added!',
                      shouldIconPulse: true,
                      duration: const Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.copy_all_rounded,
                        color: Colors.blue,
                        size: 32,
                      ),
                    );
                    navigationController.changeScreen(0);
                  },
                  child: Container(
                    child: Text('Add'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
