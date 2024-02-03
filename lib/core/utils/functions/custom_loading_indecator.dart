import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

void customErrorIndicator(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: ColorsApp.lighterGrey,
      ),
    ),
  );
}
