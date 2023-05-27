import 'package:flutter/material.dart';

enum TodoDetaultType {
  work('work', Icons.work_outline),
  study('study', Icons.book_outlined),
  private('private', Icons.person_outline);

  const TodoDetaultType(this.value, this.icon);

  final String value;
  final IconData icon;
}
