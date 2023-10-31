import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarrosselWidget extends StatelessWidget {
  const CarrosselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: [
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage("lib/imagens/Events/Event1.jfif"),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
            image: const DecorationImage(
              image: AssetImage("lib/imagens/Events/Event2.jfif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
            image: const DecorationImage(
              image: AssetImage("lib/imagens/Events/Event3.jfif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
            image: const DecorationImage(
              image: AssetImage("lib/imagens/Events/Event4.jfif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
