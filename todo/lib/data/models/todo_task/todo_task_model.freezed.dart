// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoTaskModel _$TodoTaskModelFromJson(Map<String, dynamic> json) {
  return _TodoTaskModel.fromJson(json);
}

/// @nodoc
mixin _$TodoTaskModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoTaskModelCopyWith<TodoTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTaskModelCopyWith<$Res> {
  factory $TodoTaskModelCopyWith(
          TodoTaskModel value, $Res Function(TodoTaskModel) then) =
      _$TodoTaskModelCopyWithImpl<$Res, TodoTaskModel>;
  @useResult
  $Res call({String id, String title, DateTime? dueDate, String? tag});
}

/// @nodoc
class _$TodoTaskModelCopyWithImpl<$Res, $Val extends TodoTaskModel>
    implements $TodoTaskModelCopyWith<$Res> {
  _$TodoTaskModelCopyWithImpl(this._value, this._then);

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
    Object? tag = freezed,
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
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoTaskModelCopyWith<$Res>
    implements $TodoTaskModelCopyWith<$Res> {
  factory _$$_TodoTaskModelCopyWith(
          _$_TodoTaskModel value, $Res Function(_$_TodoTaskModel) then) =
      __$$_TodoTaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, DateTime? dueDate, String? tag});
}

/// @nodoc
class __$$_TodoTaskModelCopyWithImpl<$Res>
    extends _$TodoTaskModelCopyWithImpl<$Res, _$_TodoTaskModel>
    implements _$$_TodoTaskModelCopyWith<$Res> {
  __$$_TodoTaskModelCopyWithImpl(
      _$_TodoTaskModel _value, $Res Function(_$_TodoTaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? dueDate = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$_TodoTaskModel(
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
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoTaskModel implements _TodoTaskModel {
  const _$_TodoTaskModel(
      {required this.id, required this.title, this.dueDate, this.tag});

  factory _$_TodoTaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodoTaskModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime? dueDate;
  @override
  final String? tag;

  @override
  String toString() {
    return 'TodoTaskModel(id: $id, title: $title, dueDate: $dueDate, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoTaskModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, dueDate, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoTaskModelCopyWith<_$_TodoTaskModel> get copyWith =>
      __$$_TodoTaskModelCopyWithImpl<_$_TodoTaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoTaskModelToJson(
      this,
    );
  }
}

abstract class _TodoTaskModel implements TodoTaskModel {
  const factory _TodoTaskModel(
      {required final String id,
      required final String title,
      final DateTime? dueDate,
      final String? tag}) = _$_TodoTaskModel;

  factory _TodoTaskModel.fromJson(Map<String, dynamic> json) =
      _$_TodoTaskModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime? get dueDate;
  @override
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$$_TodoTaskModelCopyWith<_$_TodoTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
