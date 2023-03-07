import 'package:http/http.dart' as http;
import 'package:provider_api_call_example/model/todo.dart';

class ToDoService {
  Future<List<ToDo>?> getToDos() async {
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return toDoFromJson(json);
    }
  }
}
