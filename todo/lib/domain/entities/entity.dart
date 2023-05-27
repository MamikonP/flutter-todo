abstract class Entity {}

class EmptyEntity implements Entity {
  const EmptyEntity(this.body);

  final Object? body;
}
