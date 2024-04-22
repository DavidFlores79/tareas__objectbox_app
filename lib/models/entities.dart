import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;

  String description;
  bool status;

  Task({required this.description, this.status = false});

  final owner = ToOne<User>();

  bool setFinished() {
    status = !status;
    return status;
  }
}

@Entity()
class User {
  @Id()
  int id = 0;

  String name;
  String email;

  User({required this.name, required this.email});

  @Backlink()
  final tasks = ToMany<Task>();
}
