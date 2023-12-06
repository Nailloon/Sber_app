import "package:flutter/material.dart";

class ChipsWidget extends StatefulWidget {
  final List<String> chipList;
  final Color neutralColor;
  final Color selectedColor;

  ChipsWidget({required this.chipList, required this.neutralColor, required this.selectedColor});

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
          label: Text(widget.chipList[index], 
          style: Theme.of(context).textTheme.labelMedium),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          selected: isSelected[index],
          checkmarkColor: Colors.black,
          backgroundColor: isSelected[index] ? widget.selectedColor : widget.neutralColor,
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