import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_call_example/pages/home_page.dart';
import 'package:provider_api_call_example/provider/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
