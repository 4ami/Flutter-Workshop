import 'dart:ui';

import 'package:flutter/material.dart';

class PageTemplete extends StatelessWidget {
  const PageTemplete({super.key, required this.image, required this.label});
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _backImage(),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 250,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.amber,
                  Colors.amber[200]!,
                ],
              ),
            ),
            child: _label(),
          ),
        ),
      ],
    );
  }

  Center _label() {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  SizedBox _backImage() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
