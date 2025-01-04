
import 'package:flutter/material.dart';
import 'filter_text.dart';



class FilterCheckboxTitle extends StatelessWidget  {
  const FilterCheckboxTitle({
    Key? key,
    required this.selected,
    required this.title,
    required this.onUpdate,
  }) : super(key: key);

  final bool selected;
  final String title;
  final ValueChanged<bool?> onUpdate;


  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: selected,
      activeColor: Colors.red,
      checkColor: Colors.grey,
      onChanged: (value) {
        onUpdate(value);
      },
      tileColor: Colors.grey,
      title: FilterText(
        title: title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,

        ),
      ),
    );
  }
}