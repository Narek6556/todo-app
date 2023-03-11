import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../model/task.model.dart';

class TasksController extends GetxController {
  static TasksController get to => Get.find();

  List<Task> allTasks = <Task>[].obs;
  List<Task> completedTasks = <Task>[].obs;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  String? editableTaskID;

  void createNewTask() {
    final uuid = Uuid();

    Task newTask = Task(
      id: uuid.v1(),
      title: title.text,
      description: description.text,
      isCompleted: false,
    );
    allTasks.add(newTask);
    title.clear();
    description.clear();
  }

  void markAsCompleted(int index) {
    Task editedTask = Task(
      id: allTasks[index].id,
      title: allTasks[index].title,
      description: allTasks[index].description,
      isCompleted: !allTasks[index].isCompleted,
    );
    allTasks.removeAt(index);
    if (editedTask.isCompleted) {
      allTasks.add(editedTask);
      completedTasks.add(editedTask);
    } else {
      allTasks.insert(0, editedTask);
      completedTasks.removeWhere((element) => element.id == editedTask.id);
    }
  }

  void removeTask(String id) {
    allTasks.removeWhere((element) => element.id == id);
    completedTasks.removeWhere((element) => element.id == id);
  }

  void setEditableTask(String id) {
    editableTaskID = id;
    Task task = allTasks.singleWhere((element) => element.id == id);
    title.text = task.title;
    description.text = task.description;
  }

  void cancelEditing() {
    title.text = '';
    description.text = '';
    Get.back();
  }

  void updateTask() {
    if (editableTaskID != null) {
      int index =
          allTasks.indexWhere((element) => element.id == editableTaskID);
      Task task = allTasks[index];
      task.title = title.text;
      task.description = description.text;
      allTasks.removeAt(index);
      allTasks.insert(index, task);
      title.text = '';
      description.text = '';
      Get.back();
    }
  }
}
