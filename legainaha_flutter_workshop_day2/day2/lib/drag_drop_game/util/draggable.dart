import 'package:flutter/material.dart';

class DraggableLogo extends StatelessWidget {
  const DraggableLogo({super.key, required this.logo});
  final String logo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Image.asset(
      logo,
      width: 110,
    ));
  }
}
