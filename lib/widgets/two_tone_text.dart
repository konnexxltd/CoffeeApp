import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TwoToneText extends StatelessWidget {
  final String firstText, secondText, tag;
  final double fontSize;
  const TwoToneText(
      {required Key key,
      required this.firstText,
      required this.secondText,
      required this.tag, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: fontSize,
              color: Theme.of(context).textTheme.headline6!.color),
          children: [
            TextSpan(
              text: secondText,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
