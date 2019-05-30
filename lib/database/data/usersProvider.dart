import '../dbhelper.dart';
import 'users.dart';

class UsersProvider {
  static const String TABLE_NAME = "table_users";

  Future<Users> insert(Users user) async {
    user.id =
        await DBHelper.dbHelper.getDatabase().insert(TABLE_NAME, user.toMap());
    return user;
  }

  Future<Users> get(int id) async {
    List<Map> maps = await DBHelper.dbHelper.getDatabase().query(TABLE_NAME,
        columns: [Users.columnId, Users.columnName, Users.columnEmail],
        where: '${Users.columnId} = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Users.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Users>> getAll() async {
    var res = await DBHelper.dbHelper.getDatabase().query(TABLE_NAME);
    List<Users> list =
        res.isNotEmpty ? res.map((c) => Users.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> delete(int id) async {
    return await DBHelper.dbHelper
        .getDatabase()
        .delete(TABLE_NAME, where: '${Users.columnId} = ?', whereArgs: [id]);
  }

  Future<int> update(Users user) async {
    return await DBHelper.dbHelper.getDatabase().update(
        TABLE_NAME, user.toMap(),
        where: '${Users.columnId} = ?', whereArgs: [user.id]);
  }
}
