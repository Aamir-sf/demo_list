import 'package:flutter/material.dart';



class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _MyAppState();
}

class _MyAppState extends State<Screen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _secondTaskController = TextEditingController();
  final List<String> _tasks = [];
  final List<String> _tasks1 = [];

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _tasks1.add(_secondTaskController.text);
        _taskController.clear();
        _secondTaskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: const Center(
            child: Text(
              'Task',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _taskController,
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  fillColor: const Color(0xffF8F9FA),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.task_rounded,
                    color: Color(0xff323F4B),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
             const SizedBox(height: 10),
              TextField(
                controller: _secondTaskController,
                decoration: InputDecoration(
                  contentPadding:const EdgeInsets.symmetric(vertical: 35.0),
                  hintText: 'Enter task',
                  fillColor: const Color(0xffF8F9FA),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.edit,
                    color: Color(0xff323F4B),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
             const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text("${_tasks[index]}"),
                        Text("${_tasks1[index]}"),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTask,
          child: const Icon(Icons.add),
        ),
    );
  }
}
