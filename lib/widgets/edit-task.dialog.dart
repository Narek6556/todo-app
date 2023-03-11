import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/tasks.controller.dart';

class EditTaskDialog extends GetView<TasksController> {
  EditTaskDialog({Key? key}) : super(key: key);

  @override
  final TasksController controller = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller.title,
            decoration: const InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: controller.description,
            decoration: const InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () => controller.cancelEditing(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => controller.updateTask(),
                child: const Text('Update'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
