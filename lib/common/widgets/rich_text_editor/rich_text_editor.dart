import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'editor_controller.dart';

/// A simplified text editor widget from the `t_utils` package.
///
/// Users only need to use this widget and don't require the `quill` package directly.
class TTextEditor extends StatefulWidget {
  /// Controller to manage the editor's content and state.
  final TTextController controller;

  /// Callback to notify when the content changes.
  final ValueChanged<String>? onContentChanged;

  /// Toolbar options
  final bool showBold;
  final bool showItalic;
  final bool showUnderLine;
  final bool showStrikeThrough;
  final bool showHeading;
  final bool showFontFamily;
  final bool showListOptions;

  /// Whether to display the toolbar in multiple rows.
  final bool toolbarMultiRow;

  /// The height of the editor area.
  final double editorHeight;

  /// The label for the editor section.
  final String label;

  /// The label's text style.
  final TextStyle? labelStyle;

  /// The padding inside the editor.
  final EdgeInsets editorPadding;

  /// The border color of the editor area.
  final Color borderColor;

  /// The border radius of the editor area.
  final double borderRadius;

  /// Placeholder text for the editor.
  final String placeholder;

  /// Whether the editor should autofocus.
  final bool autoFocus;

  /// Whether to disable clipboard functionality.
  final bool disableClipboard;

  /// Whether the editor supports selection toolbar.
  final bool enableSelectionToolbar;
  final bool isReadOnly;

  const TTextEditor({
    super.key,
    required this.controller,
    this.onContentChanged,
    this.showBold = true,
    this.showItalic = true,
    this.showUnderLine = true,
    this.showStrikeThrough = false,
    this.showHeading = true,
    this.showFontFamily = false,
    this.showListOptions = true,
    this.toolbarMultiRow = false,
    this.editorHeight = 300,
    this.label = 'Text Editor',
    this.editorPadding = const EdgeInsets.all(8.0),
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.placeholder = 'Start typing...',
    this.autoFocus = false,
    this.disableClipboard = false,
    this.enableSelectionToolbar = true,
    this.labelStyle,
    this.isReadOnly = false,
  });

  @override
  _TTextEditorState createState() => _TTextEditorState();
}

class _TTextEditorState extends State<TTextEditor> {
  @override
  void initState() {
    super.initState();

    // Notify content changes to the user if a callback is provided.
    widget.controller.quillController.addListener(() {
      if (widget.onContentChanged != null) {
        widget.onContentChanged!(widget.controller.getDescription());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: widget.labelStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // Toolbar
        if (!widget.isReadOnly)
          quill.QuillToolbar.simple(
            configurations: quill.QuillSimpleToolbarConfigurations(
              multiRowsDisplay: widget.toolbarMultiRow,
              showBoldButton: widget.showBold,
              showItalicButton: widget.showItalic,
              showUnderLineButton: widget.showUnderLine,
              showStrikeThrough: widget.showStrikeThrough,
              showHeaderStyle: widget.showHeading,
              showFontFamily: widget.showFontFamily,
              showListCheck: widget.showListOptions,
              showListBullets: widget.showListOptions,
              showListNumbers: widget.showListOptions,
              showSearchButton: true,
            ),
            controller: widget.controller.quillController,
          ),
        if (!widget.isReadOnly) const SizedBox(height: 8),

        // Editor
        Container(
          height: widget.editorHeight,
          padding: widget.editorPadding,
          decoration: BoxDecoration(
            border: Border.all(color: widget.borderColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: quill.QuillEditor(
            controller: widget.controller.quillController,
            scrollController: ScrollController(),
            configurations: quill.QuillEditorConfigurations(
              expands: false,
              scrollable: true,
              autoFocus: widget.autoFocus,
              placeholder: widget.placeholder,
              checkBoxReadOnly: widget.isReadOnly,
              enableInteractiveSelection: widget.enableSelectionToolbar,
            ),
            focusNode: FocusNode(),
          ),
        ),
      ],
    );
  }
}
