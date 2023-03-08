import 'package:flutter/cupertino.dart';

import '../../../core/constants/constant.dart';

class CategoryItemWidget extends StatelessWidget {
  final String image;
  const CategoryItemWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Responsive.font),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}
