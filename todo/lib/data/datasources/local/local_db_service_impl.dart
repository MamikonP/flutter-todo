import 'package:hive/hive.dart';

import 'local_db_service.dart';

class LocalDbServiceImpl implements LocalDbService {
  @override
  Future<Box<T>> open<T>(String dbName) async => Hive.openBox(dbName);

  @override
  Future<void> add<T>(Box<T> db, T value) async => db.add(value);

  @override
  Future<void> put<T>(Box<T> db, Object key, T value) async =>
      db.put(key, value);

  @override
  List<T> getAll<T>(Box<T> db) => db.values.toList();

  @override
  T? get<T>(Box<T> db, Object key) => db.get(key);

  @override
  Future<void> clear<T>(Box<T> db) async => db.clear();

  @override
  Future<void> delete<T>(Box<T> db, Object key) async => db.delete(key);

  @override
  bool containsKey<T>(Box<T> db, Object key) => db.containsKey(key);
}
