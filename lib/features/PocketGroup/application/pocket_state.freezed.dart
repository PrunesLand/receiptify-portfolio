// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pocket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PocketState {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get totalExpense => throw _privateConstructorUsedError;
  String get totalBudget => throw _privateConstructorUsedError;
  List<PocketModel> get pockets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PocketStateCopyWith<PocketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PocketStateCopyWith<$Res> {
  factory $PocketStateCopyWith(
          PocketState value, $Res Function(PocketState) then) =
      _$PocketStateCopyWithImpl<$Res, PocketState>;
  @useResult
  $Res call(
      {String id,
      String title,
      String totalExpense,
      String totalBudget,
      List<PocketModel> pockets});
}

/// @nodoc
class _$PocketStateCopyWithImpl<$Res, $Val extends PocketState>
    implements $PocketStateCopyWith<$Res> {
  _$PocketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? totalExpense = null,
    Object? totalBudget = null,
    Object? pockets = null,
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
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as String,
      pockets: null == pockets
          ? _value.pockets
          : pockets // ignore: cast_nullable_to_non_nullable
              as List<PocketModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PocketStateImplCopyWith<$Res>
    implements $PocketStateCopyWith<$Res> {
  factory _$$PocketStateImplCopyWith(
          _$PocketStateImpl value, $Res Function(_$PocketStateImpl) then) =
      __$$PocketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String totalExpense,
      String totalBudget,
      List<PocketModel> pockets});
}

/// @nodoc
class __$$PocketStateImplCopyWithImpl<$Res>
    extends _$PocketStateCopyWithImpl<$Res, _$PocketStateImpl>
    implements _$$PocketStateImplCopyWith<$Res> {
  __$$PocketStateImplCopyWithImpl(
      _$PocketStateImpl _value, $Res Function(_$PocketStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? totalExpense = null,
    Object? totalBudget = null,
    Object? pockets = null,
  }) {
    return _then(_$PocketStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as String,
      pockets: null == pockets
          ? _value._pockets
          : pockets // ignore: cast_nullable_to_non_nullable
              as List<PocketModel>,
    ));
  }
}

/// @nodoc

class _$PocketStateImpl implements _PocketState {
  const _$PocketStateImpl(
      {this.id = '',
      this.title = '',
      this.totalExpense = '',
      this.totalBudget = '',
      final List<PocketModel> pockets = const []})
      : _pockets = pockets;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String totalExpense;
  @override
  @JsonKey()
  final String totalBudget;
  final List<PocketModel> _pockets;
  @override
  @JsonKey()
  List<PocketModel> get pockets {
    if (_pockets is EqualUnmodifiableListView) return _pockets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pockets);
  }

  @override
  String toString() {
    return 'PocketState(id: $id, title: $title, totalExpense: $totalExpense, totalBudget: $totalBudget, pockets: $pockets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PocketStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            const DeepCollectionEquality().equals(other._pockets, _pockets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, totalExpense,
      totalBudget, const DeepCollectionEquality().hash(_pockets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PocketStateImplCopyWith<_$PocketStateImpl> get copyWith =>
      __$$PocketStateImplCopyWithImpl<_$PocketStateImpl>(this, _$identity);
}

abstract class _PocketState implements PocketState {
  const factory _PocketState(
      {final String id,
      final String title,
      final String totalExpense,
      final String totalBudget,
      final List<PocketModel> pockets}) = _$PocketStateImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get totalExpense;
  @override
  String get totalBudget;
  @override
  List<PocketModel> get pockets;
  @override
  @JsonKey(ignore: true)
  _$$PocketStateImplCopyWith<_$PocketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
