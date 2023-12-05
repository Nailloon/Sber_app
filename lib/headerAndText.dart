import 'package:flutter/material.dart';
class HeaderAndText extends StatelessWidget{
  const HeaderAndText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: const BoxConstraints(minHeight: 68),
    child: const Column(children: [Text(""),Text("")],));
  }
}