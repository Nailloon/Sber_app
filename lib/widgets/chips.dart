import "package:flutter/material.dart";
import "package:sber_app_filyakin/utils/ColorsPalete.dart";

class ChipsWidget extends StatefulWidget {
  final List<String> chipList;
  final Color neutralColor;
  final Color selectedColor;

  const ChipsWidget({
    super.key,
    required this.chipList,
    required this.neutralColor,
    required this.selectedColor,
  });

  @override
  _ChipsWidgetState createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(widget.chipList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: List<Widget>.generate(widget.chipList.length, (index) {
        return FilterChip(
          label: Text(
            widget.chipList[index],
            style: Theme.of(context).textTheme.labelMedium,
          ),
          shape: const StadiumBorder(),
          selected: isSelected[index],
          checkmarkColor: ColorPalette.blackColor,
          backgroundColor:
              isSelected[index] ? widget.selectedColor : widget.neutralColor,
          onSelected: (bool selected) {
            setState(() {
              isSelected[index] = selected;
            });
          },
        );
      }),
    );
  }
}
