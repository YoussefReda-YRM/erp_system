import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomNoProductWidget extends StatelessWidget {
  const CustomNoProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "There is no product, Create a New product now.",
            textAlign: TextAlign.center,
            style: Styles.font18LightGreyBold(context),
          ),
        ],
      ),
    );
  }
}