import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/widgets/headerAndText.dart';

class WideButton extends StatelessWidget {
  final String imagePath;
  final HeaderAndText buttonText;
  final VoidCallback onTap;

  const WideButton({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: mediaQuery - (64 + 48)),
              child: buttonText,
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 24,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ],
        ),
      ),
    );
  }
}

class WideButtonList extends StatelessWidget {
  final List<WideButtonData> buttons;

  const WideButtonList({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < buttons.length; i++)
          Column(
            children: [
              WideButton(
                imagePath: buttons[i].imagePath,
                buttonText: buttons[i].buttonText,
                onTap: buttons[i].onTap,
              ),
              if (i < buttons.length - 1)
                const Divider(
                  height: 1,
                  thickness: 0,
                  indent: 48,
                  endIndent: 0,
                  color: Colors.grey,
                ),
            ],
          ),
      ],
    );
  }
}

class WideButtonData {
  final String imagePath;
  final HeaderAndText buttonText;
  final VoidCallback onTap;

  WideButtonData({
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
  });
}
