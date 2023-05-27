// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) {
  return _TodoListModel.fromJson(json);
}

/// @nodoc
mixin _$TodoListModel {
  String get type => throw _privateConstructorUsedError;
  TodoListColor? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoListModelCopyWith<TodoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListModelCopyWith<$Res> {
  factory $TodoListModelCopyWith(
          TodoListModel value, $Res Function(TodoListModel) then) =
      _$TodoListModelCopyWithImpl<$Res, TodoListModel>;
  @useResult
  $Res call({String type, TodoListColor? color});
}

/// @nodoc
class _$TodoListModelCopyWithImpl<$Res, $Val extends TodoListModel>
    implements $TodoListModelCopyWith<$Res> {
  _$TodoListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TodoListColor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoListModelCopyWith<$Res>
    implements $TodoListModelCopyWith<$Res> {
  factory _$$_TodoListModelCopyWith(
          _$_TodoListModel value, $Res Function(_$_TodoListModel) then) =
      __$$_TodoListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, TodoListColor? color});
}

/// @nodoc
class __$$_TodoListModelCopyWithImpl<$Res>
    extends _$TodoListModelCopyWithImpl<$Res, _$_TodoListModel>
    implements _$$_TodoListModelCopyWith<$Res> {
  __$$_TodoListModelCopyWithImpl(
      _$_TodoListModel _value, $Res Function(_$_TodoListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? color = freezed,
  }) {
    return _then(_$_TodoListModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TodoListColor?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoListModel implements _TodoListModel {
  const _$_TodoListModel({required this.type, this.color});

  factory _$_TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodoListModelFromJson(json);

  @override
  final String type;
  @override
  final TodoListColor? color;

  @override
  String toString() {
    return 'TodoListModel(type: $type, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoListModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoListModelCopyWith<_$_TodoListModel> get copyWith =>
      __$$_TodoListModelCopyWithImpl<_$_TodoListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoListModelToJson(
      this,
    );
  }
}

abstract class _TodoListModel implements TodoListModel {
  const factory _TodoListModel(
      {required final String type,
      final TodoListColor? color}) = _$_TodoListModel;

  factory _TodoListModel.fromJson(Map<String, dynamic> json) =
      _$_TodoListModel.fromJson;

  @override
  String get type;
  @override
  TodoListColor? get color;
  @override
  @JsonKey(ignore: true)
  _$$_TodoListModelCopyWith<_$_TodoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
