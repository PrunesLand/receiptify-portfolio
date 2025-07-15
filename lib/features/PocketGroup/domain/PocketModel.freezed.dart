// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PocketModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PocketModel {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get totalExpense => throw _privateConstructorUsedError;
  String get totalBudget => throw _privateConstructorUsedError;

  /// Create a copy of PocketModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PocketModelCopyWith<PocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PocketModelCopyWith<$Res> {
  factory $PocketModelCopyWith(
    PocketModel value,
    $Res Function(PocketModel) then,
  ) = _$PocketModelCopyWithImpl<$Res, PocketModel>;
  @useResult
  $Res call({
    String? id,
    String title,
    String totalExpense,
    String totalBudget,
  });
}

/// @nodoc
class _$PocketModelCopyWithImpl<$Res, $Val extends PocketModel>
    implements $PocketModelCopyWith<$Res> {
  _$PocketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PocketModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? totalExpense = null,
    Object? totalBudget = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            totalExpense:
                null == totalExpense
                    ? _value.totalExpense
                    : totalExpense // ignore: cast_nullable_to_non_nullable
                        as String,
            totalBudget:
                null == totalBudget
                    ? _value.totalBudget
                    : totalBudget // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PocketModelImplCopyWith<$Res>
    implements $PocketModelCopyWith<$Res> {
  factory _$$PocketModelImplCopyWith(
    _$PocketModelImpl value,
    $Res Function(_$PocketModelImpl) then,
  ) = __$$PocketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String title,
    String totalExpense,
    String totalBudget,
  });
}

/// @nodoc
class __$$PocketModelImplCopyWithImpl<$Res>
    extends _$PocketModelCopyWithImpl<$Res, _$PocketModelImpl>
    implements _$$PocketModelImplCopyWith<$Res> {
  __$$PocketModelImplCopyWithImpl(
    _$PocketModelImpl _value,
    $Res Function(_$PocketModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PocketModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? totalExpense = null,
    Object? totalBudget = null,
  }) {
    return _then(
      _$PocketModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        totalExpense:
            null == totalExpense
                ? _value.totalExpense
                : totalExpense // ignore: cast_nullable_to_non_nullable
                    as String,
        totalBudget:
            null == totalBudget
                ? _value.totalBudget
                : totalBudget // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PocketModelImpl implements _PocketModel {
  const _$PocketModelImpl({
    this.id,
    required this.title,
    required this.totalExpense,
    required this.totalBudget,
  });

  @override
  final String? id;
  @override
  final String title;
  @override
  final String totalExpense;
  @override
  final String totalBudget;

  @override
  String toString() {
    return 'PocketModel(id: $id, title: $title, totalExpense: $totalExpense, totalBudget: $totalBudget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PocketModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, totalExpense, totalBudget);

  /// Create a copy of PocketModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PocketModelImplCopyWith<_$PocketModelImpl> get copyWith =>
      __$$PocketModelImplCopyWithImpl<_$PocketModelImpl>(this, _$identity);
}

abstract class _PocketModel implements PocketModel {
  const factory _PocketModel({
    final String? id,
    required final String title,
    required final String totalExpense,
    required final String totalBudget,
  }) = _$PocketModelImpl;

  @override
  String? get id;
  @override
  String get title;
  @override
  String get totalExpense;
  @override
  String get totalBudget;

  /// Create a copy of PocketModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PocketModelImplCopyWith<_$PocketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
