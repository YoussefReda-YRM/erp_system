import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

deleteShowDialog(
    BuildContext context, String content, Function()? onPressed) {
  return showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(
          "Confirm Deletion",
          style: Styles.font18DarkBlueBold(context),
        ),
        content: SizedBox(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: Styles.font13BlueSemiBold(context),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
