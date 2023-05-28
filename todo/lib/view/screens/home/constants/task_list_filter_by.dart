import 'filter_by.dart';

enum TaskListFilterBy implements FilterBy {
  all('All'),
  completed('Completed'),
  nonCompleted('Non completed'),
  date('Date'),
  alphabetical('Alphabetical');

  const TaskListFilterBy(this.name);

  @override
  final String name;
}
