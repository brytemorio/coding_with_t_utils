import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/rich_text_editor/editor_controller.dart';
import 'package:t_utils/common/widgets/rich_text_editor/rich_text_editor.dart';

class TTextEditorExample extends StatelessWidget {
  const TTextEditorExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TTextController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TTextEditor(
          controller: controller,
          onContentChanged: (content) {
            print("Content updated: $content");
          },
        ),
        const SizedBox(height: 12),
        ElevatedButton(
            onPressed: () => print(controller.getDescription()),
            child: Text('Print Description')),
        ElevatedButton(
            onPressed: () => controller.setDescription(
                '"[{"insert":"ssss\n\n\nsd sasda"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"asdsad"},{"insert":"sdsad","attributes":{"bold":true}},{"insert":"\n","attributes":{"list":"bullet"}}]"'),
            child: Text('Set Description')),
      ],
    );
  }
}
