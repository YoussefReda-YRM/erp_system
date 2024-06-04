import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showSnackBar(BuildContext context) {
  GoRouter.of(context).pop();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('You are not authorized to do so'),
      duration: Duration(seconds: 3),
    ),
  );
}
