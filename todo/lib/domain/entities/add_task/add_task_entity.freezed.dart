// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddTaskEntity _$AddTaskEntityFromJson(Map<String, dynamic> json) {
  return _AddTaskEntity.fromJson(json);
}

/// @nodoc
mixin _$AddTaskEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddTaskEntityCopyWith<AddTaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskEntityCopyWith<$Res> {
  factory $AddTaskEntityCopyWith(
          AddTaskEntity value, $Res Function(AddTaskEntity) then) =
      _$AddTaskEntityCopyWithImpl<$Res, AddTaskEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime? dueDate,
      String? time,
      String? tag,
      String? type,
      bool? completed});
}

/// @nodoc
class _$AddTaskEntityCopyWithImpl<$Res, $Val extends AddTaskEntity>
    implements $AddTaskEntityCopyWith<$Res> {
  _$AddTaskEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? dueDate = freezed,
    Object? time = freezed,
    Object? tag = freezed,
    Object? type = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddTaskEntityCopyWith<$Res>
    implements $AddTaskEntityCopyWith<$Res> {
  factory _$$_AddTaskEntityCopyWith(
          _$_AddTaskEntity value, $Res Function(_$_AddTaskEntity) then) =
      __$$_AddTaskEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime? dueDate,
      String? time,
      String? tag,
      String? type,
      bool? completed});
}

/// @nodoc
class __$$_AddTaskEntityCopyWithImpl<$Res>
    extends _$AddTaskEntityCopyWithImpl<$Res, _$_AddTaskEntity>
    implements _$$_AddTaskEntityCopyWith<$Res> {
  __$$_AddTaskEntityCopyWithImpl(
      _$_AddTaskEntity _value, $Res Function(_$_AddTaskEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? dueDate = freezed,
    Object? time = freezed,
    Object? tag = freezed,
    Object? type = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_AddTaskEntity(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddTaskEntity implements _AddTaskEntity {
  const _$_AddTaskEntity(this.id, this.title,
      {this.dueDate, this.time, this.tag, this.type, this.completed});

  factory _$_AddTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AddTaskEntityFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime? dueDate;
  @override
  final String? time;
  @override
  final String? tag;
  @override
  final String? type;
  @override
  final bool? completed;

  @override
  String toString() {
    return 'AddTaskEntity(id: $id, title: $title, dueDate: $dueDate, time: $time, tag: $tag, type: $type, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, dueDate, time, tag, type, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddTaskEntityCopyWith<_$_AddTaskEntity> get copyWith =>
      __$$_AddTaskEntityCopyWithImpl<_$_AddTaskEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddTaskEntityToJson(
      this,
    );
  }
}

abstract class _AddTaskEntity implements AddTaskEntity {
  const factory _AddTaskEntity(final String id, final String title,
      {final DateTime? dueDate,
      final String? time,
      final String? tag,
      final String? type,
      final bool? completed}) = _$_AddTaskEntity;

  factory _AddTaskEntity.fromJson(Map<String, dynamic> json) =
      _$_AddTaskEntity.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime? get dueDate;
  @override
  String? get time;
  @override
  String? get tag;
  @override
  String? get type;
  @override
  bool? get completed;
  @override
  @JsonKey(ignore: true)
  _$$_AddTaskEntityCopyWith<_$_AddTaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
