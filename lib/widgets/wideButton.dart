import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/utils/ColorsPalete.dart';
import 'package:sber_app_filyakin/widgets/headerAndText.dart';

class WideButton extends StatelessWidget {
  final WideButtonData buttonData;

  const WideButton({
    Key? key,
    required this.buttonData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: buttonData.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Image.asset(
              buttonData.imagePath,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: mediaQuery - (64 + 48)),
              child: buttonData.buttonText,
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
                buttonData: buttons[i],
              ),
              if (i < buttons.length - 1)
                const Divider(
                  height: 1,
                  thickness: 0,
                  indent: 48,
                  endIndent: 0,
                  color: ColorPalette.greyColor,
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
