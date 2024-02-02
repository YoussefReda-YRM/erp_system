import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void setupErrorState(BuildContext context, String error) {
    GoRouter.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: Styles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              "Got it",
              style: Styles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }