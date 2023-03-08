import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';

class FavoriteItemWidget extends StatelessWidget {
  final String image;
  final String label;
  final Color color;

  const FavoriteItemWidget(
      {Key? key, required this.image, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Responsive.width,
          height: Responsive.height * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Responsive.font),
                  topLeft: Radius.circular(Responsive.font))),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Responsive.font),
                topLeft: Radius.circular(Responsive.font)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: image,
              placeholder: (c, p) => Image.asset(
                'assets/images/holder/holder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: Responsive.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Responsive.font),
                  bottomRight: Radius.circular(Responsive.font)),
              color: primaryColor(color),
              border: Border.all(color: decorationColor(color))),
          padding: EdgeInsets.symmetric(
            vertical: Responsive.padding,
            horizontal: Responsive.padding,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.white, fontSize: Responsive.font * 1.2),
          ),
        )
      ],
    );
  }
}
