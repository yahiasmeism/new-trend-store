import 'package:flutter/cupertino.dart';

class CustomCupertinoButton extends StatelessWidget {
  const CustomCupertinoButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
  });
  final Function() onPressed;
  final Icon icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(50),
      color: color,
      onPressed: onPressed,
      child: icon,
    );
  }
}
