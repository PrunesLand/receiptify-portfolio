// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layout_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LayoutConfig {
  Widget? get floatingActionButton => throw _privateConstructorUsedError;

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LayoutConfigCopyWith<LayoutConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutConfigCopyWith<$Res> {
  factory $LayoutConfigCopyWith(
    LayoutConfig value,
    $Res Function(LayoutConfig) then,
  ) = _$LayoutConfigCopyWithImpl<$Res, LayoutConfig>;
  @useResult
  $Res call({Widget? floatingActionButton});
}

/// @nodoc
class _$LayoutConfigCopyWithImpl<$Res, $Val extends LayoutConfig>
    implements $LayoutConfigCopyWith<$Res> {
  _$LayoutConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? floatingActionButton = freezed}) {
    return _then(
      _value.copyWith(
            floatingActionButton:
                freezed == floatingActionButton
                    ? _value.floatingActionButton
                    : floatingActionButton // ignore: cast_nullable_to_non_nullable
                        as Widget?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LayoutConfigImplCopyWith<$Res>
    implements $LayoutConfigCopyWith<$Res> {
  factory _$$LayoutConfigImplCopyWith(
    _$LayoutConfigImpl value,
    $Res Function(_$LayoutConfigImpl) then,
  ) = __$$LayoutConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget? floatingActionButton});
}

/// @nodoc
class __$$LayoutConfigImplCopyWithImpl<$Res>
    extends _$LayoutConfigCopyWithImpl<$Res, _$LayoutConfigImpl>
    implements _$$LayoutConfigImplCopyWith<$Res> {
  __$$LayoutConfigImplCopyWithImpl(
    _$LayoutConfigImpl _value,
    $Res Function(_$LayoutConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? floatingActionButton = freezed}) {
    return _then(
      _$LayoutConfigImpl(
        floatingActionButton:
            freezed == floatingActionButton
                ? _value.floatingActionButton
                : floatingActionButton // ignore: cast_nullable_to_non_nullable
                    as Widget?,
      ),
    );
  }
}

/// @nodoc

class _$LayoutConfigImpl implements _LayoutConfig {
  const _$LayoutConfigImpl({this.floatingActionButton});

  @override
  final Widget? floatingActionButton;

  @override
  String toString() {
    return 'LayoutConfig(floatingActionButton: $floatingActionButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LayoutConfigImpl &&
            (identical(other.floatingActionButton, floatingActionButton) ||
                other.floatingActionButton == floatingActionButton));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floatingActionButton);

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LayoutConfigImplCopyWith<_$LayoutConfigImpl> get copyWith =>
      __$$LayoutConfigImplCopyWithImpl<_$LayoutConfigImpl>(this, _$identity);
}

abstract class _LayoutConfig implements LayoutConfig {
  const factory _LayoutConfig({final Widget? floatingActionButton}) =
      _$LayoutConfigImpl;

  @override
  Widget? get floatingActionButton;

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LayoutConfigImplCopyWith<_$LayoutConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
