import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.isLoading() = _IsLoading;
  const factory HomeEvent.addImage({
    required String fileName,
    required String filePath,
  }) = _AddImage;
  const factory HomeEvent.removeImage({required String id}) = _RemoveImage;
}
