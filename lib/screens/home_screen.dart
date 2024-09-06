import 'package:flutter/material.dart';
import 'package:flutter_new_todo/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO DO LIST"),
      ),
      body: Column(
        children: [
          Todo(
            title: "First Todo",
            desc: "First Description",
          ),
        ],
      ),
    );
  }
}
