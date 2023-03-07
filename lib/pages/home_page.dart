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
          return const Text("Consumer");
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
