import 'package:flutter/material.dart';

class HeaderAndText extends StatelessWidget {
  final String label;
  final String? text;
  final double? height;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  const HeaderAndText(
      {Key? key,
      required this.label,
      this.text,
      this.height,
      this.labelStyle,
      this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: labelStyle ?? Theme.of(context).textTheme.titleLarge,
      ),
      if (text != null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 8.0,
            ),
            Text(
              text!,
              style: textStyle ?? Theme.of(context).textTheme.labelLarge,
            )
          ],
        )
    ]);
  }
}
