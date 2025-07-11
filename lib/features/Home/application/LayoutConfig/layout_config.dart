import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout_config.freezed.dart';

@freezed
class LayoutConfig with _$LayoutConfig {
  const factory LayoutConfig({Widget? floatingActionButton}) = _LayoutConfig;
}
