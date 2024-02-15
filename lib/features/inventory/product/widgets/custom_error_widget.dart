import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: Styles.font15DarkBlueMedium(context),
      ),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            "Got it",
            style: Styles.font14BlueSemiBold(context),
          ),
        ),
      ],
    );
  }
}