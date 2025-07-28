// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pocket_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PocketEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PocketModel pocket) addPocket,
    required TResult Function(String id) removePocket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PocketModel pocket)? addPocket,
    TResult? Function(String id)? removePocket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PocketModel pocket)? addPocket,
    TResult Function(String id)? removePocket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddPocket value) addPocket,
    required TResult Function(_RemovePocket value) removePocket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddPocket value)? addPocket,
    TResult? Function(_RemovePocket value)? removePocket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddPocket value)? addPocket,
    TResult Function(_RemovePocket value)? removePocket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PocketEventCopyWith<$Res> {
  factory $PocketEventCopyWith(
          PocketEvent value, $Res Function(PocketEvent) then) =
      _$PocketEventCopyWithImpl<$Res, PocketEvent>;
}

/// @nodoc
class _$PocketEventCopyWithImpl<$Res, $Val extends PocketEvent>
    implements $PocketEventCopyWith<$Res> {
  _$PocketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddPocketImplCopyWith<$Res> {
  factory _$$AddPocketImplCopyWith(
          _$AddPocketImpl value, $Res Function(_$AddPocketImpl) then) =
      __$$AddPocketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PocketModel pocket});

  $PocketModelCopyWith<$Res> get pocket;
}

/// @nodoc
class __$$AddPocketImplCopyWithImpl<$Res>
    extends _$PocketEventCopyWithImpl<$Res, _$AddPocketImpl>
    implements _$$AddPocketImplCopyWith<$Res> {
  __$$AddPocketImplCopyWithImpl(
      _$AddPocketImpl _value, $Res Function(_$AddPocketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pocket = null,
  }) {
    return _then(_$AddPocketImpl(
      null == pocket
          ? _value.pocket
          : pocket // ignore: cast_nullable_to_non_nullable
              as PocketModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PocketModelCopyWith<$Res> get pocket {
    return $PocketModelCopyWith<$Res>(_value.pocket, (value) {
      return _then(_value.copyWith(pocket: value));
    });
  }
}

/// @nodoc

class _$AddPocketImpl implements _AddPocket {
  const _$AddPocketImpl(this.pocket);

  @override
  final PocketModel pocket;

  @override
  String toString() {
    return 'PocketEvent.addPocket(pocket: $pocket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPocketImpl &&
            (identical(other.pocket, pocket) || other.pocket == pocket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pocket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPocketImplCopyWith<_$AddPocketImpl> get copyWith =>
      __$$AddPocketImplCopyWithImpl<_$AddPocketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PocketModel pocket) addPocket,
    required TResult Function(String id) removePocket,
  }) {
    return addPocket(pocket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PocketModel pocket)? addPocket,
    TResult? Function(String id)? removePocket,
  }) {
    return addPocket?.call(pocket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PocketModel pocket)? addPocket,
    TResult Function(String id)? removePocket,
    required TResult orElse(),
  }) {
    if (addPocket != null) {
      return addPocket(pocket);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddPocket value) addPocket,
    required TResult Function(_RemovePocket value) removePocket,
  }) {
    return addPocket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddPocket value)? addPocket,
    TResult? Function(_RemovePocket value)? removePocket,
  }) {
    return addPocket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddPocket value)? addPocket,
    TResult Function(_RemovePocket value)? removePocket,
    required TResult orElse(),
  }) {
    if (addPocket != null) {
      return addPocket(this);
    }
    return orElse();
  }
}

abstract class _AddPocket implements PocketEvent {
  const factory _AddPocket(final PocketModel pocket) = _$AddPocketImpl;

  PocketModel get pocket;
  @JsonKey(ignore: true)
  _$$AddPocketImplCopyWith<_$AddPocketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovePocketImplCopyWith<$Res> {
  factory _$$RemovePocketImplCopyWith(
          _$RemovePocketImpl value, $Res Function(_$RemovePocketImpl) then) =
      __$$RemovePocketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemovePocketImplCopyWithImpl<$Res>
    extends _$PocketEventCopyWithImpl<$Res, _$RemovePocketImpl>
    implements _$$RemovePocketImplCopyWith<$Res> {
  __$$RemovePocketImplCopyWithImpl(
      _$RemovePocketImpl _value, $Res Function(_$RemovePocketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemovePocketImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovePocketImpl implements _RemovePocket {
  const _$RemovePocketImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PocketEvent.removePocket(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovePocketImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovePocketImplCopyWith<_$RemovePocketImpl> get copyWith =>
      __$$RemovePocketImplCopyWithImpl<_$RemovePocketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PocketModel pocket) addPocket,
    required TResult Function(String id) removePocket,
  }) {
    return removePocket(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PocketModel pocket)? addPocket,
    TResult? Function(String id)? removePocket,
  }) {
    return removePocket?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PocketModel pocket)? addPocket,
    TResult Function(String id)? removePocket,
    required TResult orElse(),
  }) {
    if (removePocket != null) {
      return removePocket(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddPocket value) addPocket,
    required TResult Function(_RemovePocket value) removePocket,
  }) {
    return removePocket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddPocket value)? addPocket,
    TResult? Function(_RemovePocket value)? removePocket,
  }) {
    return removePocket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddPocket value)? addPocket,
    TResult Function(_RemovePocket value)? removePocket,
    required TResult orElse(),
  }) {
    if (removePocket != null) {
      return removePocket(this);
    }
    return orElse();
  }
}

abstract class _RemovePocket implements PocketEvent {
  const factory _RemovePocket(final String id) = _$RemovePocketImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$RemovePocketImplCopyWith<_$RemovePocketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
