// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BasicStats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BasicStats {
  String get title => throw _privateConstructorUsedError;
  String get totalExpense => throw _privateConstructorUsedError;
  String get remainingBudget => throw _privateConstructorUsedError;
  String get totalBudget => throw _privateConstructorUsedError;

  /// Create a copy of BasicStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicStatsCopyWith<BasicStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicStatsCopyWith<$Res> {
  factory $BasicStatsCopyWith(
    BasicStats value,
    $Res Function(BasicStats) then,
  ) = _$BasicStatsCopyWithImpl<$Res, BasicStats>;
  @useResult
  $Res call({
    String title,
    String totalExpense,
    String remainingBudget,
    String totalBudget,
  });
}

/// @nodoc
class _$BasicStatsCopyWithImpl<$Res, $Val extends BasicStats>
    implements $BasicStatsCopyWith<$Res> {
  _$BasicStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalExpense = null,
    Object? remainingBudget = null,
    Object? totalBudget = null,
  }) {
    return _then(
      _value.copyWith(
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
            remainingBudget:
                null == remainingBudget
                    ? _value.remainingBudget
                    : remainingBudget // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BasicStatsImplCopyWith<$Res>
    implements $BasicStatsCopyWith<$Res> {
  factory _$$BasicStatsImplCopyWith(
    _$BasicStatsImpl value,
    $Res Function(_$BasicStatsImpl) then,
  ) = __$$BasicStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String totalExpense,
    String remainingBudget,
    String totalBudget,
  });
}

/// @nodoc
class __$$BasicStatsImplCopyWithImpl<$Res>
    extends _$BasicStatsCopyWithImpl<$Res, _$BasicStatsImpl>
    implements _$$BasicStatsImplCopyWith<$Res> {
  __$$BasicStatsImplCopyWithImpl(
    _$BasicStatsImpl _value,
    $Res Function(_$BasicStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BasicStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalExpense = null,
    Object? remainingBudget = null,
    Object? totalBudget = null,
  }) {
    return _then(
      _$BasicStatsImpl(
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
        remainingBudget:
            null == remainingBudget
                ? _value.remainingBudget
                : remainingBudget // ignore: cast_nullable_to_non_nullable
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

class _$BasicStatsImpl implements _BasicStats {
  const _$BasicStatsImpl({
    required this.title,
    required this.totalExpense,
    required this.remainingBudget,
    required this.totalBudget,
  });

  @override
  final String title;
  @override
  final String totalExpense;
  @override
  final String remainingBudget;
  @override
  final String totalBudget;

  @override
  String toString() {
    return 'BasicStats(title: $title, totalExpense: $totalExpense, remainingBudget: $remainingBudget, totalBudget: $totalBudget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicStatsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.remainingBudget, remainingBudget) ||
                other.remainingBudget == remainingBudget) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    totalExpense,
    remainingBudget,
    totalBudget,
  );

  /// Create a copy of BasicStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicStatsImplCopyWith<_$BasicStatsImpl> get copyWith =>
      __$$BasicStatsImplCopyWithImpl<_$BasicStatsImpl>(this, _$identity);
}

abstract class _BasicStats implements BasicStats {
  const factory _BasicStats({
    required final String title,
    required final String totalExpense,
    required final String remainingBudget,
    required final String totalBudget,
  }) = _$BasicStatsImpl;

  @override
  String get title;
  @override
  String get totalExpense;
  @override
  String get remainingBudget;
  @override
  String get totalBudget;

  /// Create a copy of BasicStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicStatsImplCopyWith<_$BasicStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
