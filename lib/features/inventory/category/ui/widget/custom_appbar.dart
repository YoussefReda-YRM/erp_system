import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

class AppBarCustomization extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  AppBarCustomization(this.name);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsApp.primaryColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(22))),

      title: Text(name), // Use the provided name
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
          // Handle back button pressed, e.g., navigate to the previous screen
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 22); // Adjust the height as needed
}
