import 'dart:math';

import 'package:flutter/material.dart';
import 'package:objectbox_app/main.dart';
import 'package:objectbox_app/models/entities.dart';
import 'package:objectbox_app/widgets/main_drawer.dart';

class TaskScreen extends StatefulWidget {
  static String routeName = 'tasks';
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Stream<List<Task>> streamTask;
  late List<User> users;

  @override
  void initState() {
    streamTask = objectBox.getTasks();
    users = objectBox.userBox.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectBox App'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: StreamBuilder<List<Task>>(
        stream: streamTask,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final users = snapshot.data!;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final task = users[index];
                return ListTile(
                  onTap: () => toggleCheckBox(task),
                  trailing: IconButton(
                    onPressed: () => objectBox.deleteTask(task.id),
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    ),
                  ),
                  leading: task.status
                      ? const Icon(Icons.circle)
                      : const Icon(Icons.circle_outlined),
                  title: Row(
                    children: [
                      Text(task.description),
                      // Spacer(),
                      // Text(task.status.toString()),
                    ],
                  ),
                  subtitle: Text('Asignado a ${task.owner.target?.name}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final _random = Random();
          final User user = users[_random.nextInt(users.length)];
          print(user.id);

          final task = Task(description: 'Mi primera Tarea');
          task.owner.target = user;

          objectBox.insertTask(task);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  toggleCheckBox(Task task) {
    task.setFinished();
    objectBox.insertTask(task);
    setState(() {});
  }
}
