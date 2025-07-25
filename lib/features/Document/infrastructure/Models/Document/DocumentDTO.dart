import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'DocumentDTO.freezed.dart';

@freezed
class DocumentDTO with _$DocumentDTO {
  const factory DocumentDTO({
    required String id,
    required String content,
    required File file,
  }) = _DocumentDTO;
}
