import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final String title;
  final String desc;
  final bool done;
  const Todo({
    super.key,
    required this.title,
    required this.desc,
    required this.done,
  });

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: widget.done ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                widget.desc,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
