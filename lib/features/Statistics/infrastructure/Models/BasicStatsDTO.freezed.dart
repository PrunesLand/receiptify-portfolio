// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BasicStatsDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BasicStatsDTO _$BasicStatsDTOFromJson(Map<String, dynamic> json) {
  return _BasicStatsDTO.fromJson(json);
}

/// @nodoc
mixin _$BasicStatsDTO {
  @JsonKey(name: 'total_expense')
  String get totalExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_last_expense')
  String get dateOfLastExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_budget')
  String get remainingBudget => throw _privateConstructorUsedError;

  /// Serializes this BasicStatsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicStatsDTOCopyWith<BasicStatsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicStatsDTOCopyWith<$Res> {
  factory $BasicStatsDTOCopyWith(
    BasicStatsDTO value,
    $Res Function(BasicStatsDTO) then,
  ) = _$BasicStatsDTOCopyWithImpl<$Res, BasicStatsDTO>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_expense') String totalExpense,
    @JsonKey(name: 'date_last_expense') String dateOfLastExpense,
    @JsonKey(name: 'remaining_budget') String remainingBudget,
  });
}

/// @nodoc
class _$BasicStatsDTOCopyWithImpl<$Res, $Val extends BasicStatsDTO>
    implements $BasicStatsDTOCopyWith<$Res> {
  _$BasicStatsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpense = null,
    Object? dateOfLastExpense = null,
    Object? remainingBudget = null,
  }) {
    return _then(
      _value.copyWith(
            totalExpense:
                null == totalExpense
                    ? _value.totalExpense
                    : totalExpense // ignore: cast_nullable_to_non_nullable
                        as String,
            dateOfLastExpense:
                null == dateOfLastExpense
                    ? _value.dateOfLastExpense
                    : dateOfLastExpense // ignore: cast_nullable_to_non_nullable
                        as String,
            remainingBudget:
                null == remainingBudget
                    ? _value.remainingBudget
                    : remainingBudget // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BasicStatsDTOImplCopyWith<$Res>
    implements $BasicStatsDTOCopyWith<$Res> {
  factory _$$BasicStatsDTOImplCopyWith(
    _$BasicStatsDTOImpl value,
    $Res Function(_$BasicStatsDTOImpl) then,
  ) = __$$BasicStatsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_expense') String totalExpense,
    @JsonKey(name: 'date_last_expense') String dateOfLastExpense,
    @JsonKey(name: 'remaining_budget') String remainingBudget,
  });
}

/// @nodoc
class __$$BasicStatsDTOImplCopyWithImpl<$Res>
    extends _$BasicStatsDTOCopyWithImpl<$Res, _$BasicStatsDTOImpl>
    implements _$$BasicStatsDTOImplCopyWith<$Res> {
  __$$BasicStatsDTOImplCopyWithImpl(
    _$BasicStatsDTOImpl _value,
    $Res Function(_$BasicStatsDTOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BasicStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpense = null,
    Object? dateOfLastExpense = null,
    Object? remainingBudget = null,
  }) {
    return _then(
      _$BasicStatsDTOImpl(
        totalExpense:
            null == totalExpense
                ? _value.totalExpense
                : totalExpense // ignore: cast_nullable_to_non_nullable
                    as String,
        dateOfLastExpense:
            null == dateOfLastExpense
                ? _value.dateOfLastExpense
                : dateOfLastExpense // ignore: cast_nullable_to_non_nullable
                    as String,
        remainingBudget:
            null == remainingBudget
                ? _value.remainingBudget
                : remainingBudget // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicStatsDTOImpl implements _BasicStatsDTO {
  const _$BasicStatsDTOImpl({
    @JsonKey(name: 'total_expense') required this.totalExpense,
    @JsonKey(name: 'date_last_expense') required this.dateOfLastExpense,
    @JsonKey(name: 'remaining_budget') required this.remainingBudget,
  });

  factory _$BasicStatsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicStatsDTOImplFromJson(json);

  @override
  @JsonKey(name: 'total_expense')
  final String totalExpense;
  @override
  @JsonKey(name: 'date_last_expense')
  final String dateOfLastExpense;
  @override
  @JsonKey(name: 'remaining_budget')
  final String remainingBudget;

  @override
  String toString() {
    return 'BasicStatsDTO(totalExpense: $totalExpense, dateOfLastExpense: $dateOfLastExpense, remainingBudget: $remainingBudget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicStatsDTOImpl &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.dateOfLastExpense, dateOfLastExpense) ||
                other.dateOfLastExpense == dateOfLastExpense) &&
            (identical(other.remainingBudget, remainingBudget) ||
                other.remainingBudget == remainingBudget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalExpense,
    dateOfLastExpense,
    remainingBudget,
  );

  /// Create a copy of BasicStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicStatsDTOImplCopyWith<_$BasicStatsDTOImpl> get copyWith =>
      __$$BasicStatsDTOImplCopyWithImpl<_$BasicStatsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicStatsDTOImplToJson(this);
  }
}

abstract class _BasicStatsDTO implements BasicStatsDTO {
  const factory _BasicStatsDTO({
    @JsonKey(name: 'total_expense') required final String totalExpense,
    @JsonKey(name: 'date_last_expense') required final String dateOfLastExpense,
    @JsonKey(name: 'remaining_budget') required final String remainingBudget,
  }) = _$BasicStatsDTOImpl;

  factory _BasicStatsDTO.fromJson(Map<String, dynamic> json) =
      _$BasicStatsDTOImpl.fromJson;

  @override
  @JsonKey(name: 'total_expense')
  String get totalExpense;
  @override
  @JsonKey(name: 'date_last_expense')
  String get dateOfLastExpense;
  @override
  @JsonKey(name: 'remaining_budget')
  String get remainingBudget;

  /// Create a copy of BasicStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicStatsDTOImplCopyWith<_$BasicStatsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
