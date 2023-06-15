extension ListMapExtension on List<Map<dynamic, dynamic>> {
  List<Map<String, dynamic>> toMapStringKey() => map(
      (Map<dynamic, dynamic> json) => json.map((dynamic key, dynamic value) =>
          MapEntry<String, dynamic>(key.toString(), value))).toList();
}
