import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_call_example/provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider API"),
      ),
      body: Consumer<ToDoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = value.todos;
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(todo.id.toString()),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      color: todo.completed ? Colors.grey : Colors.black,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ToDoProvider>(context, listen: false).getAllToDos();
    });
    super.initState();
  }
}
