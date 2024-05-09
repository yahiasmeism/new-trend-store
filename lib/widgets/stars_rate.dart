import 'package:flutter/material.dart';

class StarsRate extends StatelessWidget {
  const StarsRate({super.key, required this.rate, required this.size});
  final double rate;
  final double size;
  @override
  Widget build(BuildContext context) {
    var disabledColor = Colors.grey;
    List<Icon> stars = [
      Icon(
        Icons.star_outline,
        color: disabledColor,
        size: size,
      ),
      Icon(
        Icons.star_outline,
        color: disabledColor,
        size: size,
      ),
      Icon(
        Icons.star_outline,
        color: disabledColor,
        size: size,
      ),
      Icon(
        Icons.star_outline,
        color: disabledColor,
        size: size,
      ),
      Icon(
        Icons.star_outline,
        color: disabledColor,
        size: size,
      ),
    ];
    if (rate >= 0) {
      for (double i = 0.5; i <= rate; i = i + 0.5) {
        if (i.toInt() == i && i >= 1) {
          stars[i.floor() - 1] = Icon(
            Icons.star,
            color: Colors.orange,
            size: size,
          );
        } else if (i.toInt() != i) {
          stars[i.floor()] = Icon(
            Icons.star_half,
            color: Colors.amber,
            size: size,
          );
        }
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
