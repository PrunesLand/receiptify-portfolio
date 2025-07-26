import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/Model/Image/image_model.dart';

part 'document_state.freezed.dart';

@freezed
class DocumentState with _$DocumentState {
  const factory DocumentState({
    @Default(false) bool isLoading,
    @Default([]) List<ImageModel?> list,
    @Default('') String textData,
    @Default(false) bool AddDocModalOpen,
    @Default(true) bool OcrLoading,
  }) = _DocumentState;
}
