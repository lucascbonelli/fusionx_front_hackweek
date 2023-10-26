import 'package:flutter/material.dart';

class EventoCadastradoCard extends StatefulWidget {
  const EventoCadastradoCard({super.key});

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
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 12),
            const Text('Titulo Evento'),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}