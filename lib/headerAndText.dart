import 'package:flutter/material.dart';

class HeaderAndText extends StatelessWidget{
  final String label;
  final String text;
  const HeaderAndText({Key? key, required this.label, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0, left: 16.0),
      child: ConstrainedBox(constraints: const BoxConstraints(minHeight: 68),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(label),Text(text)])),
    );
  }
}