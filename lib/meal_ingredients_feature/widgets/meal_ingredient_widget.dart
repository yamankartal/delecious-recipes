import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant.dart';

class MealIngredientWidget extends StatelessWidget {
  final String image;
  final String label;
  final Color color;

  const MealIngredientWidget(
      {Key? key, required this.image, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: Responsive.width * 0.55,
            child: Text(
              label,
              style: TextStyle(
                  color: decorationColor(color), fontSize: Responsive.font),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: styleColor,
            maxRadius: Responsive.font * 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Responsive.font * 1.5),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: image,
                placeholder: (_, s) =>
                    CircularProgressIndicator(color: decorationColor(color)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
