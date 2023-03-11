import 'package:get/get.dart';
import 'package:todo/screens/completed-tasks.screen.dart';

import '../screens/add-task.screen.dart';
import '../screens/tasks.screen.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get to => Get.find();

  var currentIndex = 0.obs;

  // final pages = <String>['/tasks', '/add-new-task', '/completed'];
  final screens = [
    TasksScreen(),
    AddNewTask(),
    CompletedTasksScreen(),
  ];

  void changeScreen(int index) {
    currentIndex.value = index;
  }

  // Route? onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case '/tasks':
  //       return GetPageRoute(settings: settings, page: () => TasksScreen());
  //     case '/add-new-task':
  //       return GetPageRoute(settings: settings, page: () => AddNewTask());
  //   }
  //   return null;
  // }
}
