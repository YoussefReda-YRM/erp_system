import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            AssetsData.background,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CustomBackButton(),
        ),
      ],
    );
  }
}
