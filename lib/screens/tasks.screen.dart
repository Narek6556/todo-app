import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/tasks.controller.dart';
import 'package:todo/widgets/edit-task.dialog.dart';

import '../model/task.model.dart';

class TasksScreen extends GetView<TasksController> {
  TasksScreen({Key? key}) : super(key: key);

  @override
  TasksController controller = Get.put(TasksController());

  GestureDetector _listItem(item, controller, index) {
    return GestureDetector(
      onTap: () {
        controller.setEditableTask(item.id);
        Get.defaultDialog(
          title: 'Edit Task ${item.title}',
          content: EditTaskDialog(),
        );
      },
      child: ListTile(
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
        trailing: IconButton(
          onPressed: () => controller.markAsCompleted(index),
          icon: item.isCompleted
              ? const Icon(
                  Icons.check_box,
                  color: Colors.blueAccent,
                )
              : const Icon(Icons.check_box_outline_blank),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('All Tasks'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: ListView.builder(
            itemCount: controller.allTasks.length,
            itemBuilder: (context, index) {
              Task item = controller.allTasks[index];
              return item.isCompleted
                  ? Dismissible(
                      onDismissed: (direction) {
                        controller.removeTask(item.id);
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                      ),
                      key: UniqueKey(),
                      child: _listItem(item, controller, index),
                    )
                  : _listItem(item, controller, index);
            },
          ),
        ),
      ),
    );
  }
}
