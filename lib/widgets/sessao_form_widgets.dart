import 'package:flutter/material.dart';
import 'package:html_editor_enhanced_fork/html_editor.dart';

class SessionNameField extends StatelessWidget {
  final TextEditingController controller;

  const SessionNameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nome da Sessão:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'Digite o nome da sessão',
          ),
        ),
      ],
    );
  }
}

class DateTimePicker extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback onPressed;

  const DateTimePicker(
      {super.key, required this.label, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            '$label: ${value ?? "Não selecionado"}',
          ),
        ),
      ],
    );
  }
}

class SessionContentField extends StatelessWidget {
  final HtmlEditorController htmlEditorController;
  final TextEditingController controller;

  SessionContentField({super.key, required this.controller})
      : htmlEditorController = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: HtmlEditor(
                  controller: htmlEditorController,
                  htmlToolbarOptions: const HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.aboveEditor,
                    toolbarType: ToolbarType.nativeScrollable,
                  ),
                  htmlEditorOptions: const HtmlEditorOptions(
                    adjustHeightForKeyboard: true,
                    shouldEnsureVisible: true,
                    autoAdjustHeight: false,
                    hint: 'Descrição do evento',
                    androidUseHybridComposition: true,
                  ),
                ),
              ),
            ],
    );
  }
}
