import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controller/todo_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
    );
  }
}

class Todo extends StatelessWidget {
  Todo({super.key});

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: todoController.checkList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
              decoration: BoxDecoration(
                  color: todoController.checkList[index].completed
                      ? purple
                      : black12,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                title: Text(
                  todoController.checkList[index].id.toString(),
                  style: TextStyle(
                      color: todoController.checkList[index].completed
                          ? white
                          : black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  todoController.checkList[index].title,
                  style: TextStyle(
                      color: todoController.checkList[index].completed
                          ? white
                          : black87),
                ),
                trailing: Checkbox(
                  value: todoController.checkList[index].completed,
                  onChanged: (value) {
                    if (value != null) {
                      todoController.checkList[index].completed = value;
                      todoController.checkList.refresh();
                    }
                  },
                  activeColor: orange,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
