import 'package:flutter/cupertino.dart';
import 'package:provider_api_call_example/model/todo.dart';
import 'package:provider_api_call_example/services/todo_service.dart';

class ToDoProvider extends ChangeNotifier {
  ToDoService _service = ToDoService();
  bool isLoading = false;
  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  Future<void> getAllToDos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getToDos();

    _todos = response!;
    isLoading = false;
    notifyListeners();
  }
}
