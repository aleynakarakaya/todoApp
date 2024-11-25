import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo_model.dart';

class ApiService {
  Future<void> fetchData() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final TodoController todoController = Get.find<TodoController>();
        final responseBody = jsonDecode(response.body) as List;
        final List<TodoModel> todos = responseBody
            .map((json) => TodoModel.fromJson(json as Map<String, dynamic>))
            .toList();

        todoController.checkList.value = todos;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print('Catch error : $e');
    }
  }
}
