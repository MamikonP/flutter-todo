import 'filter_by.dart';

enum TodoListFilterBy implements FilterBy {
  all('All'),
  date('Date'),
  alphabetical('Alphabetical');

  const TodoListFilterBy(this.name);

  @override
  final String name;
}
