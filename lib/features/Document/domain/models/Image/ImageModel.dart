import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ImageModel.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    @Default('') String id,
    File? file,
    @Default('') String content,
  }) = _ImageModel;
}
