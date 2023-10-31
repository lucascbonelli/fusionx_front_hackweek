import 'package:flutter/material.dart';


class EventoCadastradoCard extends StatefulWidget {
  final String imageName;
  final String eventTitle;
  const EventoCadastradoCard({
    super.key,
    required this.imageName,
    required this.eventTitle,
  });

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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.imageName),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(widget.eventTitle,
              style: const TextStyle(
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