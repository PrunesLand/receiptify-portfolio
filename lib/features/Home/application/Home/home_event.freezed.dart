// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(File file) addImage,
    required TResult Function(String id) removeImage,
    required TResult Function() processImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(File file)? addImage,
    TResult? Function(String id)? removeImage,
    TResult? Function()? processImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(File file)? addImage,
    TResult Function(String id)? removeImage,
    TResult Function()? processImage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_ProcessImage value) processImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(File file) addImage,
    required TResult Function(String id) removeImage,
    required TResult Function() processImage,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(File file)? addImage,
    TResult? Function(String id)? removeImage,
    TResult? Function()? processImage,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(File file)? addImage,
    TResult Function(String id)? removeImage,
    TResult Function()? processImage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_ProcessImage value) processImage,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeEvent {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AddImageImplCopyWith<$Res> {
  factory _$$AddImageImplCopyWith(
    _$AddImageImpl value,
    $Res Function(_$AddImageImpl) then,
  ) = __$$AddImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$AddImageImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$AddImageImpl>
    implements _$$AddImageImplCopyWith<$Res> {
  __$$AddImageImplCopyWithImpl(
    _$AddImageImpl _value,
    $Res Function(_$AddImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? file = null}) {
    return _then(
      _$AddImageImpl(
        file:
            null == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                    as File,
      ),
    );
  }
}

/// @nodoc

class _$AddImageImpl implements _AddImage {
  const _$AddImageImpl({required this.file});

  @override
  final File file;

  @override
  String toString() {
    return 'HomeEvent.addImage(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImageImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImageImplCopyWith<_$AddImageImpl> get copyWith =>
      __$$AddImageImplCopyWithImpl<_$AddImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(File file) addImage,
    required TResult Function(String id) removeImage,
    required TResult Function() processImage,
  }) {
    return addImage(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(File file)? addImage,
    TResult? Function(String id)? removeImage,
    TResult? Function()? processImage,
  }) {
    return addImage?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(File file)? addImage,
    TResult Function(String id)? removeImage,
    TResult Function()? processImage,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_ProcessImage value) processImage,
  }) {
    return addImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) {
    return addImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(this);
    }
    return orElse();
  }
}

abstract class _AddImage implements HomeEvent {
  const factory _AddImage({required final File file}) = _$AddImageImpl;

  File get file;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImageImplCopyWith<_$AddImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImageImplCopyWith<$Res> {
  factory _$$RemoveImageImplCopyWith(
    _$RemoveImageImpl value,
    $Res Function(_$RemoveImageImpl) then,
  ) = __$$RemoveImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemoveImageImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$RemoveImageImpl>
    implements _$$RemoveImageImplCopyWith<$Res> {
  __$$RemoveImageImplCopyWithImpl(
    _$RemoveImageImpl _value,
    $Res Function(_$RemoveImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$RemoveImageImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveImageImpl implements _RemoveImage {
  const _$RemoveImageImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'HomeEvent.removeImage(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImageImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImageImplCopyWith<_$RemoveImageImpl> get copyWith =>
      __$$RemoveImageImplCopyWithImpl<_$RemoveImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(File file) addImage,
    required TResult Function(String id) removeImage,
    required TResult Function() processImage,
  }) {
    return removeImage(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(File file)? addImage,
    TResult? Function(String id)? removeImage,
    TResult? Function()? processImage,
  }) {
    return removeImage?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(File file)? addImage,
    TResult Function(String id)? removeImage,
    TResult Function()? processImage,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_ProcessImage value) processImage,
  }) {
    return removeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) {
    return removeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(this);
    }
    return orElse();
  }
}

abstract class _RemoveImage implements HomeEvent {
  const factory _RemoveImage({required final String id}) = _$RemoveImageImpl;

  String get id;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImageImplCopyWith<_$RemoveImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessImageImplCopyWith<$Res> {
  factory _$$ProcessImageImplCopyWith(
    _$ProcessImageImpl value,
    $Res Function(_$ProcessImageImpl) then,
  ) = __$$ProcessImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessImageImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ProcessImageImpl>
    implements _$$ProcessImageImplCopyWith<$Res> {
  __$$ProcessImageImplCopyWithImpl(
    _$ProcessImageImpl _value,
    $Res Function(_$ProcessImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessImageImpl implements _ProcessImage {
  const _$ProcessImageImpl();

  @override
  String toString() {
    return 'HomeEvent.processImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(File file) addImage,
    required TResult Function(String id) removeImage,
    required TResult Function() processImage,
  }) {
    return processImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(File file)? addImage,
    TResult? Function(String id)? removeImage,
    TResult? Function()? processImage,
  }) {
    return processImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(File file)? addImage,
    TResult Function(String id)? removeImage,
    TResult Function()? processImage,
    required TResult orElse(),
  }) {
    if (processImage != null) {
      return processImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_ProcessImage value) processImage,
  }) {
    return processImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) {
    return processImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) {
    if (processImage != null) {
      return processImage(this);
    }
    return orElse();
  }
}

abstract class _ProcessImage implements HomeEvent {
  const factory _ProcessImage() = _$ProcessImageImpl;
}
