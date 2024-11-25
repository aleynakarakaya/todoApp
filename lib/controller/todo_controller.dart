import 'package:get/get.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/api_service.dart';

class TodoController extends GetxController {
  var checkList = <TodoModel>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    apiService.fetchData();
  }
}
