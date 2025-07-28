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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasicStats {
  PocketModel get pocket => throw _privateConstructorUsedError;
  String get summaryExpense => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasicStatsCopyWith<BasicStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicStatsCopyWith<$Res> {
  factory $BasicStatsCopyWith(
          BasicStats value, $Res Function(BasicStats) then) =
      _$BasicStatsCopyWithImpl<$Res, BasicStats>;
  @useResult
  $Res call({PocketModel pocket, String summaryExpense});

  $PocketModelCopyWith<$Res> get pocket;
}

/// @nodoc
class _$BasicStatsCopyWithImpl<$Res, $Val extends BasicStats>
    implements $BasicStatsCopyWith<$Res> {
  _$BasicStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pocket = null,
    Object? summaryExpense = null,
  }) {
    return _then(_value.copyWith(
      pocket: null == pocket
          ? _value.pocket
          : pocket // ignore: cast_nullable_to_non_nullable
              as PocketModel,
      summaryExpense: null == summaryExpense
          ? _value.summaryExpense
          : summaryExpense // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PocketModelCopyWith<$Res> get pocket {
    return $PocketModelCopyWith<$Res>(_value.pocket, (value) {
      return _then(_value.copyWith(pocket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasicStatsImplCopyWith<$Res>
    implements $BasicStatsCopyWith<$Res> {
  factory _$$BasicStatsImplCopyWith(
          _$BasicStatsImpl value, $Res Function(_$BasicStatsImpl) then) =
      __$$BasicStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PocketModel pocket, String summaryExpense});

  @override
  $PocketModelCopyWith<$Res> get pocket;
}

/// @nodoc
class __$$BasicStatsImplCopyWithImpl<$Res>
    extends _$BasicStatsCopyWithImpl<$Res, _$BasicStatsImpl>
    implements _$$BasicStatsImplCopyWith<$Res> {
  __$$BasicStatsImplCopyWithImpl(
      _$BasicStatsImpl _value, $Res Function(_$BasicStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pocket = null,
    Object? summaryExpense = null,
  }) {
    return _then(_$BasicStatsImpl(
      pocket: null == pocket
          ? _value.pocket
          : pocket // ignore: cast_nullable_to_non_nullable
              as PocketModel,
      summaryExpense: null == summaryExpense
          ? _value.summaryExpense
          : summaryExpense // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BasicStatsImpl implements _BasicStats {
  const _$BasicStatsImpl({required this.pocket, required this.summaryExpense});

  @override
  final PocketModel pocket;
  @override
  final String summaryExpense;

  @override
  String toString() {
    return 'BasicStats(pocket: $pocket, summaryExpense: $summaryExpense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicStatsImpl &&
            (identical(other.pocket, pocket) || other.pocket == pocket) &&
            (identical(other.summaryExpense, summaryExpense) ||
                other.summaryExpense == summaryExpense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pocket, summaryExpense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicStatsImplCopyWith<_$BasicStatsImpl> get copyWith =>
      __$$BasicStatsImplCopyWithImpl<_$BasicStatsImpl>(this, _$identity);
}

abstract class _BasicStats implements BasicStats {
  const factory _BasicStats(
      {required final PocketModel pocket,
      required final String summaryExpense}) = _$BasicStatsImpl;

  @override
  PocketModel get pocket;
  @override
  String get summaryExpense;
  @override
  @JsonKey(ignore: true)
  _$$BasicStatsImplCopyWith<_$BasicStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
