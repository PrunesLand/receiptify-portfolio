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
    required TResult Function() isLoading,
    required TResult Function(String fileName, String filePath) addImage,
    required TResult Function(String id) removeImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isLoading,
    TResult? Function(String fileName, String filePath)? addImage,
    TResult? Function(String id)? removeImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoading,
    TResult Function(String fileName, String filePath)? addImage,
    TResult Function(String id)? removeImage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
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
abstract class _$$IsLoadingImplCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
    _$IsLoadingImpl value,
    $Res Function(_$IsLoadingImpl) then,
  ) = __$$IsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$IsLoadingImpl>
    implements _$$IsLoadingImplCopyWith<$Res> {
  __$$IsLoadingImplCopyWithImpl(
    _$IsLoadingImpl _value,
    $Res Function(_$IsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsLoadingImpl implements _IsLoading {
  const _$IsLoadingImpl();

  @override
  String toString() {
    return 'HomeEvent.isLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isLoading,
    required TResult Function(String fileName, String filePath) addImage,
    required TResult Function(String id) removeImage,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isLoading,
    TResult? Function(String fileName, String filePath)? addImage,
    TResult? Function(String id)? removeImage,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoading,
    TResult Function(String fileName, String filePath)? addImage,
    TResult Function(String id)? removeImage,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements HomeEvent {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$AddImageImplCopyWith<$Res> {
  factory _$$AddImageImplCopyWith(
    _$AddImageImpl value,
    $Res Function(_$AddImageImpl) then,
  ) = __$$AddImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileName, String filePath});
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
  $Res call({Object? fileName = null, Object? filePath = null}) {
    return _then(
      _$AddImageImpl(
        fileName:
            null == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                    as String,
        filePath:
            null == filePath
                ? _value.filePath
                : filePath // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AddImageImpl implements _AddImage {
  const _$AddImageImpl({required this.fileName, required this.filePath});

  @override
  final String fileName;
  @override
  final String filePath;

  @override
  String toString() {
    return 'HomeEvent.addImage(fileName: $fileName, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImageImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, filePath);

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
    required TResult Function() isLoading,
    required TResult Function(String fileName, String filePath) addImage,
    required TResult Function(String id) removeImage,
  }) {
    return addImage(fileName, filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isLoading,
    TResult? Function(String fileName, String filePath)? addImage,
    TResult? Function(String id)? removeImage,
  }) {
    return addImage?.call(fileName, filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoading,
    TResult Function(String fileName, String filePath)? addImage,
    TResult Function(String id)? removeImage,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(fileName, filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
  }) {
    return addImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
  }) {
    return addImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(this);
    }
    return orElse();
  }
}

abstract class _AddImage implements HomeEvent {
  const factory _AddImage({
    required final String fileName,
    required final String filePath,
  }) = _$AddImageImpl;

  String get fileName;
  String get filePath;

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
    required TResult Function() isLoading,
    required TResult Function(String fileName, String filePath) addImage,
    required TResult Function(String id) removeImage,
  }) {
    return removeImage(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? isLoading,
    TResult? Function(String fileName, String filePath)? addImage,
    TResult? Function(String id)? removeImage,
  }) {
    return removeImage?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoading,
    TResult Function(String fileName, String filePath)? addImage,
    TResult Function(String id)? removeImage,
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
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
  }) {
    return removeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
  }) {
    return removeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
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
