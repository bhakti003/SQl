import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqllite_demo/Models/user_data_model.dart';

class HomeScreenController extends GetxController {
  var userData = <UserDataModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    createDatabase();
  }

  Future<void> createDatabase() async {
    String path = join(await getDatabasesPath(), "db_user");
    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      printInfo(info: "db:" + db.toString());
      await db.execute("CREATE TABLE tbl_user ("
          "name TEXT PRIMARY KEY,"
          "age TEXT NOT NULL,"
          "address TEXT NOT NULL"
          ")");
    });
    // getTodo();
  }

  addData({String? name, String? age, String? address}) {
    var user = UserDataModel(name: name, age: age, address: address);
    insertData(user);
  }

  Future<void> insertData(UserDataModel user) async {
    print("MODEL DATA ${user.toJson()}");
    String path = join(await getDatabasesPath(), "db_user");
    final db = await openDatabase(path);
    await db.insert("tbl_user", user.toJson());
    getData();
    print(user.toJson());
  }

  Future<void> getData() async {
    String path = join(await getDatabasesPath(), "db_user");
    final db = await openDatabase(path);
    final List<Map<String, dynamic>> maps = await db.query("tbl_user");
    userData.addAll(maps.map((e) => UserDataModel.fromJson(e)).toList());
    print(userData.value);
  }
}
