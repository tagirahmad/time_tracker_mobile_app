import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/common_widgets/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    required String text,
    Color? color,
    Color? textColor,
    VoidCallback? onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15.0,
            ),
          ),
          color: color,
          onPressed: onPressed,
          height: 50.0,
        );
}
