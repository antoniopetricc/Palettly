import 'package:flutter/material.dart';
import 'package:palettly/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Styles.kPrimary,
          borderRadius: Styles.kBorderRadius,
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.kSubHeading.copyWith(color: Styles.kWhite),
          ),
        ),
      ),
    );
  }
}
