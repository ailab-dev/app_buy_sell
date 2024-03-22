import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
    required this.rate,
    this.size = 14,
    this.unratedColor = ColorsConstant.purpleGray,
    this.rateColor = const Color.fromRGBO(76, 92, 123, 1),
  });

  final int maxRate = 5;
  final double rate;
  final double size;
  final Color unratedColor;
  final Color rateColor;

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (var i = 0; i < maxRate; i++) {
      if (i < rate) {
        if (i == rate.toInt()) {
          stars.add(Icon(
            _isInteger(rate) ? Icons.star_rate : Icons.star_half,
            color: rateColor,
            size: size,
          ));
        } else {
          stars.add(Icon(
            Icons.star_rate,
            color: rateColor,
            size: size,
          ));
        }
      } else {
        stars.add(Icon(
          Icons.star_rate,
          color: unratedColor,
          size: size,
        ));
      }
    }
    return Row(
      children: stars,
    );
  }

  bool _isInteger(num value) => (value % 1) == 0;
}
