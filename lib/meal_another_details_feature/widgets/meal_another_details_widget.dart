import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant.dart';

class MealAnotherDetailsWidget extends StatelessWidget {
  final Color color;
  final String label;
  final List list;

  const MealAnotherDetailsWidget({
    Key? key,
    required this.color,
    required this.label,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Responsive.font * 1.05),
          border: Border.all(color: decorationColor(color))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Responsive.font),
        child: ExpansionTile(
            backgroundColor: primaryColor(color),
            collapsedBackgroundColor: primaryColor(color),
            textColor: Colors.white,
            collapsedTextColor: Colors.white,
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: Text(
              label,
              style: TextStyle(fontSize: Responsive.font * 1.2),
            ),
            children: list.isEmpty
                ? [
                    Column(
                      children: [
                        Divider(
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.padding,
                              vertical: Responsive.padding),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.padding),
                            child: Row(
                              children: [
                                Text(
                                  'No $label',
                                  style: TextStyle(
                                      fontSize: Responsive.font,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ]
                : List.generate(
                    list.length,
                    (index) => Column(
                          children: [
                            Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.padding,
                                  vertical: Responsive.padding),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Responsive.padding),
                                child: Row(
                                  children: [
                                    Text(
                                      '#${index + 1} ${list[index]}',
                                      style: TextStyle(
                                          fontSize: Responsive.font,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))),
      ),
    );
  }
}
