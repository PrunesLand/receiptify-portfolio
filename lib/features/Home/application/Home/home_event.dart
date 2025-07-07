import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loading() = _Loading;
  const factory HomeEvent.addImage({required File file}) = _AddImage;
  const factory HomeEvent.removeImage({required String id}) = _RemoveImage;
  const factory HomeEvent.processImage() = _ProcessImage;
}
