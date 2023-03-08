import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';

class MealDetailsWidget extends StatelessWidget {
  final String label;
  final Color color;
  const MealDetailsWidget({Key? key, required this.label, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.teal,
      hoverColor: Colors.teal,
      selectedColor: Colors.teal,
      selectedTileColor: Colors.teal,
      contentPadding:EdgeInsets.symmetric(
        vertical: Responsive.font,
        horizontal: Responsive.font
      ),
      title:Text(label,style: TextStyle(color: decorationColor(color),fontSize:Responsive.font*1.5),),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color: decorationColor(color),),
    );
  }
}
