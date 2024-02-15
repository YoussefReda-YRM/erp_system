import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: Styles.font13LightGreyRegular(context),
      ),
    );
  }
}
