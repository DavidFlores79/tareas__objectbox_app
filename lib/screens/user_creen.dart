import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:objectbox_app/models/entities.dart';
import 'package:objectbox_app/widgets/main_drawer.dart';

import '../main.dart';

class UserScreen extends StatefulWidget {
  static String routeName = 'users';
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Stream<List<User>> stream;

  @override
  void initState() {
    stream = objectBox.getUSers();
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
      body: StreamBuilder<List<User>>(
        stream: stream,
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
                final user = users[index];
                return ListTile(
                  onTap: () => showTasks(user),
                  trailing: IconButton(
                    onPressed: () => objectBox.deleteUser(user.id),
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    ),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          final user = User(
            name: Faker().person.firstName(),
            email: Faker().internet.email(),
          );
          objectBox.insertUser(user);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  showTasks(User user) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: const Text(
            'User Tasks',
            textAlign: TextAlign.center,
          ),
          content: Container(
            width: 400,
            height: 300,
            child: user.tasks.isEmpty
                ? const Center(
                    child: Text('Este usuario no tiene tareas asignadas'),
                  )
                : Scrollbar(
                    trackVisibility: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: user.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        final task = user.tasks[index];
                        return ListTile(
                          title: Text(task.description),
                        );
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}
