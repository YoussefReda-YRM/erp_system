import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

class CategorySearchWidget extends StatelessWidget {
  const CategorySearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsApp.border,
      ),
      child: const Center(
        child: Row(
          children: [
            Icon(Icons.search),
            Text("Search for category"),
          ],
        ),
      ),
    );
  }
}
