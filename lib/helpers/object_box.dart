import 'package:objectbox_app/models/entities.dart';
import 'package:objectbox_app/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<User> userBox;
  late final Box<Task> _taskBox;

  ObjectBox._init(this._store) {
    userBox = Box<User>(_store);
    _taskBox = Box<Task>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();

    return ObjectBox._init(store);
  }

  User? getUser(int id) => userBox.get(id);

  Stream<List<User>> getUSers() => userBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int insertUser(User user) => userBox.put(user);

  bool deleteUser(int id) {
    final user = getUser(id);
    user?.tasks.forEach((task) => deleteTask(task.id));
    return userBox.remove(id);
  }

  Task? getTask(int id) => _taskBox.get(id);

  Stream<List<Task>> getTasks() => _taskBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int insertTask(Task task) => _taskBox.put(task);

  bool deleteTask(int id) => _taskBox.remove(id);
}
