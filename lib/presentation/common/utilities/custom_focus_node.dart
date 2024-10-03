import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Common abstract class
abstract class OlFocusable {
  String get id; // Common property
}

// Extension of the FocusNode class to add a unique ID
class OlFocusNode extends FocusNode implements OlFocusable {
  @override
  final String id; // Unique identifier

  OlFocusNode({required this.id}) : super(debugLabel: id);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(StringProperty('id', id)); // Add the ID to the debug properties
  }
}

// Extension of the FocusScopeNode class to add a unique ID
class OlFocusScopeNode extends FocusScopeNode implements OlFocusable {
  @override
  final String id; // Unique identifier

  OlFocusScopeNode({required this.id}) : super(debugLabel: id);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(StringProperty('id', id)); // Add the ID to the debug properties
  }
}

extension FocusNodeExt on FocusNode {
  String get id {
    if (this is OlFocusable) {
      return (this as OlFocusable).id;
    }
    return '';
  }
}
