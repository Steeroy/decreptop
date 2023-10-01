import 'package:flutter/material.dart';

import '../../configuration/configuration.dart';

class BigPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BigPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Configuration().colors.primary,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Configuration().colors.background,
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class BigSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BigSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            backgroundColor: Configuration().colors.background,
            side: BorderSide(color: Configuration().colors.primary, width: 1)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Configuration().colors.primary,
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
