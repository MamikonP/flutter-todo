part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends BlocState with EquatableMixin {
  const TodoState({
    this.todos = const <TodoListEntity>[],
    this.error,
    StateFlowResult? result,
    final bool isBusy = false,
  }) : super(result, isBusy: isBusy);

  final String? error;
  final List<TodoListEntity> todos;

  @override
  List<Object?> get props => <Object?>[
        result,
        isBusy,
        error,
        todos,
      ];
}

class TodoInitial extends TodoState {
  const TodoInitial() : super();
}

class TodoLoaded extends TodoState {
  const TodoLoaded(List<TodoListEntity> todos)
      : super(todos: todos, result: StateFlowResult.success);
}

class TodoFailed extends TodoState {
  TodoFailed(TodoState initState, String error)
      : super(
            todos: initState.todos,
            error: error,
            result: StateFlowResult.failed);
}
