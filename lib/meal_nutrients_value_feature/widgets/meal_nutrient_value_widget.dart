import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant.dart';

class MealNutrientValueWidget extends StatelessWidget {
  final Color color;
  final String label;
  final double quantity;
  final String unit;

  const MealNutrientValueWidget(
      {Key? key,
      required this.color,
      required this.label,
      required this.quantity,
      required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor(color),
          borderRadius: BorderRadius.circular(Responsive.font),
          border: Border.all(color: decorationColor(color))),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: Responsive.font),
        ),
        trailing: Text(
          '$quantity $unit',
          style: TextStyle(
            color: Colors.white,
            fontSize: Responsive.font,
          ),
        ),
      ),
    );
  }
}
