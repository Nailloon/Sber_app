import 'package:flutter/material.dart';

class HeaderAndText extends StatelessWidget {
  final String label;
  final String? text;
  final double? height;
  const HeaderAndText({Key? key, required this.label, this.text, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      if (text != null)
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 8.0,
            ),
            Text(
              text!,
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        )
    ]);
  }
}
