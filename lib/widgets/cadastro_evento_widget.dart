import 'package:flutter/material.dart';
import 'package:teste/widgets/cadastro_widgets_empresa.dart';

import '../core/model.dart';

class EventoCadastradoCard extends StatefulWidget {
  final ImageProvider? image;
  const EventoCadastradoCard({super.key, this.image, });

  @override
  State<EventoCadastradoCard> createState() => _EventoCadastradoCardState();
}

class _EventoCadastradoCardState extends State<EventoCadastradoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: widget.image != null
                    ? DecorationImage(
                  image: widget.image!,
                  fit: BoxFit.cover,
                )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            const Text('Teste',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}