import 'package:hive/hive.dart';

abstract class LocalDbService {
  Future<Box<T>> open<T>(String dbName);
  Future<void> add<T>(Box<T> db, T value);
  Future<void> put<T>(Box<T> db, Object key, T value);
  List<T> getAll<T>(Box<T> db);
  T? get<T>(Box<T> db, Object key);
  Future<void> delete<T>(Box<T> db, Object key);
  Future<void> clear<T>(Box<T> db);
  bool containsKey<T>(Box<T> db, Object key);
}
