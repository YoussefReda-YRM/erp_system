import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidinText extends StatelessWidget {
  const SlidinText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            "ERP SYSTEM",
            style: Styles.font16LightGreyMedium ,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
