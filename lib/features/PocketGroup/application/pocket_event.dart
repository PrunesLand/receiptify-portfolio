import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/PocketModel.dart';

part 'pocket_event.freezed.dart';

@freezed
class PocketEvent with _$PocketEvent {
  const factory PocketEvent.addPocket(PocketModel pocket) = _AddPocket;
  const factory PocketEvent.removePocket(String id) = _RemovePocket;
}
