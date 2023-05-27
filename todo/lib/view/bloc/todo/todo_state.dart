part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends BlocState with EquatableMixin {
  const TodoState({
    this.todos = const <TodoListEntity>[],
    this.tasks = const <TodoTaskEntity>[],
    this.error,
    StateFlowResult? result,
    final bool isBusy = false,
  }) : super(result, isBusy: isBusy);

  final String? error;
  final List<TodoListEntity> todos;
  final List<TodoTaskEntity> tasks;

  @override
  List<Object?> get props => <Object?>[
        result,
        isBusy,
        error,
        todos,
        tasks,
      ];
}

class TodoInitial extends TodoState {
  const TodoInitial() : super();
}

class TodoBusy extends TodoState {
  TodoBusy(TodoState initState)
      : super(todos: initState.todos, tasks: initState.tasks, isBusy: true);
}

class TodoLoaded extends TodoState {
  TodoLoaded(
    TodoState initState, {
    List<TodoListEntity>? todos,
    List<TodoTaskEntity>? tasks,
  }) : super(
            todos: todos ?? initState.todos,
            tasks: tasks ?? initState.tasks,
            result: StateFlowResult.success);
}

class TodoFailed extends TodoState {
  TodoFailed(TodoState initState, String error)
      : super(
            todos: initState.todos,
            tasks: initState.tasks,
            error: error,
            result: StateFlowResult.failed);
}
