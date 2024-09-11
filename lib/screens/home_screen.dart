import 'package:flutter/material.dart';
import 'package:flutter_new_todo/models/todo_model.dart';
import 'package:flutter_new_todo/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> todos = [];

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO DO LIST"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 475,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      todos[index].check = !todos[index].check;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Todo(
                            title: todos[index].title,
                            desc: todos[index].Description,
                            done: todos[index].check,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              todos.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                }),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: title,
                        decoration:
                            const InputDecoration(labelText: "Enter new task"),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: desc,
                        decoration:
                            const InputDecoration(labelText: "Description"),
                      ),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (title.text.isNotEmpty && desc.text.isNotEmpty) {
                      todos.add(ToDoModel(title.text, desc.text, false));
                      setState(() {});
                    }
                  },
                  child: const Text("+ Task "),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
