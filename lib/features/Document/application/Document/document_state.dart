import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Document/domain/Enums/Enums.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';

part 'document_state.freezed.dart';

@freezed
class DocumentState with _$DocumentState {
  const factory DocumentState({
    @Default(false) bool isLoading,
    @Default([]) List<ReceiptModel?> list,
    @Default('') String textData,
    @Default(false) bool AddDocModalOpen,
    @Default(true) bool OcrLoading,
    @Default('0') String totalExpenseMain,
    @Default(DocumentChipEnum.latest) DocumentChipEnum chipEnum,
  }) = _DocumentState;
}
