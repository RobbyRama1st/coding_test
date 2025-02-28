import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? textButton;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final VoidCallback? onPress;

  const RoundedButton({
    key,
    this.textButton,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: 1.0,
                style: BorderStyle.solid),
          ),
          elevation: 4.0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: contentPaddingVertical ?? 15,
              horizontal: contentPaddingHorizontal ?? 20),
          child: Text(
            textButton!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
