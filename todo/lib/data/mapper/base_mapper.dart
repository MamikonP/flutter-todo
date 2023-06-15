abstract class BaseMapper<T> {
  dynamic result(dynamic body);
}

abstract class ListMapper<T> extends BaseMapper<T> {
  @override
  List<T> result(dynamic body) => models(body);

  List<T> models(dynamic body);

  List<T> parseModels(
          List<dynamic> json, T Function(dynamic json) fromJsonTModel) =>
      json.map(fromJsonTModel).toList();
}

abstract class ObjectMapper<T> extends BaseMapper<T> {
  @override
  T result(dynamic body) => model(body);

  T model(dynamic body);

  T parseModel(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonTModel) =>
      fromJsonTModel(json);
}
