import 'package:equatable/equatable.dart';

import '../entity.dart';

class TodoTaskEntity extends Equatable implements Entity {
  const TodoTaskEntity(
      {required this.id, required this.title, this.dueDate, this.tag});

  final String id;
  final String title;
  final DateTime? dueDate;
  final String? tag;

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        dueDate,
        tag,
      ];
}
