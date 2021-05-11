import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.child,
    required this.color,
    this.borderRadius = 2.0,
    this.height,
    this.onPressed,
  })  : assert(borderRadius != null),
        super(key: key);

  final Widget? child;
  final Color? color;
  final double? borderRadius;
  final double? height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(color),
        ),
        child: child,
      ),
    );
  }
}
