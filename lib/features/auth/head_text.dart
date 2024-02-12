import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  const HeadText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(text, style: Styles.font24LightGreyBold(context)),
    );
  }
}
