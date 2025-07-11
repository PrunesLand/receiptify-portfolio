import 'package:flutter/material.dart';

import 'layout_config.dart'; // Import the new model

/// Manages the configuration for the shared layout.
class LayoutState extends ValueNotifier<LayoutConfig> {
  LayoutState() : super(const LayoutConfig());

  void setFab(Widget? fab) {
    value = value.copyWith(floatingActionButton: fab);
  }
}
