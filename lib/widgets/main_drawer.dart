import 'package:flutter/material.dart';
import 'package:objectbox_app/screens/task_creen.dart';
import 'package:objectbox_app/screens/user_creen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("David Flores"),
            accountEmail: Text("david@mail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn-icons-png.freepik.com/512/146/146025.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_task),
            title: const Text("Tasks"),
            onTap: () =>
                Navigator.pushReplacementNamed(context, TaskScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_outlined),
            title: const Text("Users"),
            onTap: () =>
                Navigator.pushReplacementNamed(context, UserScreen.routeName),
          ),
        ],
      ),
    );
  }
}
