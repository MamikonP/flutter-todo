part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends BlocState with EquatableMixin {
  const TodoState({
    this.todos = const <TodoListEntity>[],
    this.tasks = const <TodoTaskEntity>[],
    this.error,
    this.page = 0,
    this.addTaskEntity = const AddTaskEntity('', ''),
    this.taskEntity,
    this.taskFilter,
    this.todoFilter,
    StateFlowResult? result,
    final bool isBusy = false,
  }) : super(result, isBusy: isBusy);

  final String? error;
  final List<TodoListEntity> todos;
  final List<TodoTaskEntity> tasks;
  final AddTaskEntity addTaskEntity;
  final TodoTaskEntity? taskEntity;
  final int page;
  final TodoListFilterBy? todoFilter;
  final TaskListFilterBy? taskFilter;

  @override
  List<Object?> get props => <Object?>[
        result,
        isBusy,
        error,
        todos,
        tasks,
        addTaskEntity,
        page,
        taskFilter,
        todoFilter,
      ];
}

class TodoInitial extends TodoState {
  const TodoInitial() : super();
}

class TodoBusy extends TodoState {
  TodoBusy(TodoState initState)
      : super(
            todos: initState.todos,
            tasks: initState.tasks,
            taskFilter: initState.taskFilter,
            todoFilter: initState.todoFilter,
            isBusy: true);
}

class TodoLoaded extends TodoState {
  TodoLoaded(
    TodoState initState, {
    List<TodoListEntity>? todos,
    List<TodoTaskEntity>? tasks,
  }) : super(
            todos: todos ?? initState.todos,
            tasks: tasks ?? initState.tasks,
            taskFilter: initState.taskFilter,
            todoFilter: initState.todoFilter,
            result: StateFlowResult.success);
}

class TodoFailed extends TodoState {
  TodoFailed(TodoState initState, String error)
      : super(
            todos: initState.todos,
            tasks: initState.tasks,
            error: error,
            taskFilter: initState.taskFilter,
            todoFilter: initState.todoFilter,
            result: StateFlowResult.failed);
}

class TaskDetailUpdated extends TodoState {
  TaskDetailUpdated(
    TodoState initState,
    AddTaskEntity addTaskEntity,
    {TodoTaskEntity? taskEntity}
  ) : super(
          todos: initState.todos,
          tasks: initState.tasks,
          addTaskEntity: addTaskEntity,
          taskFilter: initState.taskFilter,
          todoFilter: initState.todoFilter,
          taskEntity: taskEntity
        );
}

class TodoPageUpdated extends TodoState {
  TodoPageUpdated(
    TodoState initState,{
    int? page,
    TodoListFilterBy? todoFilter,
    TaskListFilterBy? taskFilter,
  }) : super(
          todos: initState.todos,
          tasks: initState.tasks,
          page: page ?? initState.page,
          taskFilter: taskFilter ?? initState.taskFilter,
          todoFilter: todoFilter ?? initState.todoFilter,
        );
}
