import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tasks.controller.dart';
import '../model/task.model.dart';

class CompletedTasksScreen extends GetView<TasksController> {
  CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  TasksController controller = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Completed Tasks'),
              Text(controller.completedTasks.length.toString()),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: ListView.builder(
            itemCount: controller.completedTasks.length,
            itemBuilder: (context, index) {
              Task item = controller.completedTasks[index];
              return ListTile(
                title: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  item.description,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                ),
              );
            },
          ),
        )));
  }
}
