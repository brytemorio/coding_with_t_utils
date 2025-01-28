import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

/// Controller for managing the content and state of the `TTextEditor`.
class TTextController {
  final quill.QuillController _quillController;

  TTextController({String? initialText, bool isReadOnly = false})
      : _quillController = quill.QuillController(
          readOnly: isReadOnly,
          document: initialText != null && initialText.isNotEmpty
              ? quill.Document.fromJson(jsonDecode(initialText))
              : quill.Document(),
          selection: const TextSelection.collapsed(
              offset: 0, affinity: TextAffinity.downstream),
        );

  /// Get the current text as a JSON string.
  String getDescription() {
    final jsonContent =
        jsonEncode(_quillController.document.toDelta().toJson());
    return jsonContent.toString();
  }

  /// Set the text content using a JSON string.
  void setDescription(String jsonString) {
    try {
      if (jsonString.isEmpty) return;
      final List<dynamic> json = jsonDecode(jsonString);
      _quillController.document = quill.Document.fromJson(json);
    } catch (e) {
      debugPrint('Error setting description: $e');
    }
  }

  /// Internal access to the quill controller (hidden from external use).
  quill.QuillController get quillController => _quillController;
}
