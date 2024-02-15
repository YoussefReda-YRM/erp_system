import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showSuccessDialog(BuildContext context, String title, String content) {
  GoRouter.of(context).pop();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            title,
            style: Styles.font15DarkBlueMedium(context).copyWith(color: Colors.pink),
          ),
        ),
        content: Text(
          content,
          style: Styles.font13BlueSemiBold(context),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              "OK",
              style: Styles.font14BlueSemiBold(context),
            ),
          ),
        ],
      );
    },
  );
}
